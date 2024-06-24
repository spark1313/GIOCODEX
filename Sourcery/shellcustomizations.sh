#This file identifies shell customizations which are applied to all users of the system.
#Add these lines to /etc/bash.bashrc for use in interactive shells
#Then to also apply to login shells, create the file '/etc/profile.d/bashrcsourcer.sh' and add these lines to it
#If updating the lines, you will need to re-source the file for it to apply before a reboot via 'source /etc/profile'
alias ll="ls -lath"
alias l="ls -l"
alias ..="cd .."
alias updateall="sudo flatpak update && sudo snap refresh && sudo apt upgrade"
neofetch
