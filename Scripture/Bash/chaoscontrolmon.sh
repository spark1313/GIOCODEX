#!/usr/bin/env bash
#=================================================================================================================================================
# chaoscontrolmon.sh
#=================================================================================================================================================
# This bash script was designed to monitor local hard disks on Linux systems and send a Gotify notification so manual review would not be needed.
# The script is designed to be ran as root and called via cron job.
# The script assumes smartmontools is installed so calls via smartctl can be made.
# It should be ran with a single argument as the device intending to run against. For example: 'smartcontrol.sh /dev/sda'
#=================================================================================================================================================

# Strict mode: exit on error (-e), error on unset variables (-u), fail pipelines on first error (-o pipefail):
set -euo pipefail

#=================================================================================================================================================
# Variables
#=================================================================================================================================================
#The system device - this is input from the first argument of the command that ran this script:
DEVICE="${1:-}"
#This is the directory which saved snapshots of smarctl are placed for comparison:
DATA_DIR="/var/lib/chaoscontrolmon"

#Gotify base URL:
GOTIFY_URL="notify.domain.com"
#Gotify token:
GOTIFY_TOKEN="H4HG0771M"

# SMART attributes to monitor (case-insensitive, matched against smartctl output):
WATCH_ATTRS=(
    "Uncorrectable_Sector_Ct"
    "Wear_Leveling_Count"
    "SSD_Life_Left"
    "Percent_Lifetime_Remain"
    "Percentage Used"
    "Media and Data Integrity Errors"
    "UDMA_CRC_Error_Count"
    "Media_Wearout_Indicator"
    "Reallocated_Sector_Ct"
    "Reported_Uncorrect"
    "Current_Pending_Sector"
    "Offline_Uncorrectable"
    "Critical Warning"
    "Available Spare"
)

#=================================================================================================================================================
# Auto-Detection
#=================================================================================================================================================
# Auto-detect device if not provided via argument. Detection first checks for local NVME then SSD then HDD:
if [[ -z "$DEVICE" ]]; then
    # Try NVME first:
    DEVICE=$(lsblk -dno NAME,TRAN 2>/dev/null | awk '$2=="nvme"{print "/dev/"$1; exit}')
    # Try SATA SSDs (non-rotational SATA devices):
    if [[ -z "$DEVICE" ]]; then
        for dev in $(lsblk -dno NAME,TRAN 2>/dev/null | awk '$2=="sata"{print $1}'); do
            rota=$(cat "/sys/block/${dev}/queue/rotational" 2>/dev/null || echo "1")
            if [[ "$rota" == "0" ]]; then
                DEVICE="/dev/${dev}"
                break
            fi
        done
    fi
    # Fall back to any HDD (rotational SATA device):
    if [[ -z "$DEVICE" ]]; then
        DEVICE=$(lsblk -dno NAME,TRAN 2>/dev/null | awk '$2=="sata"{print "/dev/"$1; exit}')
    fi
    # If no argument supplied and no disks are able to be auto-detected, exit:
    [[ -n "$DEVICE" ]] || { echo "No disk found. Specify one explicitly: $0 /dev/sdX"; exit 1; }
fi

#=================================================================================================================================================
# SMART Data Collection
#=================================================================================================================================================
# Specify per-device baseline file (e.g. nvme0n1.prev.txt, sda.prev.txt):
DEV_NAME=$(basename "$DEVICE")
# Identify previous file:
PREVIOUS_FILE="$DATA_DIR/${DEV_NAME}.prev.txt"

#Create the directory specified if it does not yet exist else do nothing if it does exist:
mkdir -p "$DATA_DIR"

# Build a grep pattern from the watch list:
PATTERN=$(IFS="|"; echo "${WATCH_ATTRS[*]}")

# Grab current SMART data, extract only the watched attributes:
CURRENT=$(smartctl -a "$DEVICE" 2>&1 | grep -iE "$PATTERN" || true)

# If the previous file does not exist, this is identified as the first run so a snapshot is taken and the script exits:
if [[ ! -f "$PREVIOUS_FILE" ]]; then
    echo "$CURRENT" > "$PREVIOUS_FILE"
    exit 0
fi

#=================================================================================================================================================
# Comparison and Notification
#=================================================================================================================================================
# Compare current SMART data against previous baseline:
PREVIOUS=$(cat "$PREVIOUS_FILE")

#If the identified parameters in the previous snapshot and the current snapshot are not the same:
if [[ "$CURRENT" != "$PREVIOUS" ]]; then
    #Do a diff to identify differences:
    DIFF=$(diff <(echo "$PREVIOUS") <(echo "$CURRENT")) || true

    #Send Gotify notification with the diff:
    curl -X POST -fs -o /dev/null 2>&1 --retry 1 "https://${GOTIFY_URL}/message?token=${GOTIFY_TOKEN}" -F "title=Chaoscontrolmon: ${DEVICE} changed" -F "message=${DIFF}" &> /dev/null

    #Update baseline with new snapshot:
    echo "$CURRENT" > "$PREVIOUS_FILE"
fi
