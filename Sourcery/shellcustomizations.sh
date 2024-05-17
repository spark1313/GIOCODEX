#This file identifies shell customizations which are applied to all users of the system and sourced upon boot.
#Create the file in /etc/profile.d/shellcustomizations.sh
#If updating the file, you will need to re-source the file for it to apply before a reboot via 'source /etc/profile'
alias ll="ls -lath"
alias l="ls -l"
alias ..='cd ..'
alias updateall='sudo flatpak update && sudo snap refresh && sudo apt upgrade'
neofetch
