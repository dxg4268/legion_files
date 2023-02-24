#!/bin/bash
## Copyright (C) 2023-2023 Aditya Sharma <dxg4268> 

# Colors
red='\033[0;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[35m'
cyan='\033[36m'
NC='\033[0m'

# Get current date and time
  date=$(date +"%T")

  # Get username and hostname
  user_host=$(whoami)@$(hostname)

banner() {
echo ""
echo  "                           ▄▀█ █░░ █ █▄▀ █▀█ █▀▀ █▀▄" 
echo  "                           █▀█ █▄▄ █ █░█ █▀▄ ██▄ █▄▀"
echo "                                    made for LegionOS"
echo ""

echo -e " [${yellow}$user_host${NC}]                                                     [${green}$date${NC}]"
echo -e " ${magenta}==============================================================================${NC}"

}

while true
do
clear

banner
echo ""
echo ""
echo -e " ${cyan}[+] System Maintainance: ${NC}"
echo
echo -e " ${green}1)${NC} System Update ﮮ"
echo -e " ${green}2)${NC} Reinstall all the Packages "
echo -e " ${green}3)${NC} Clean Package Cache "
echo -e " ${green}4)${NC} Remove Database Lock "
echo -e " ${green}5)${NC} Remove Orphans "
echo -e " ${green}0)${NC} Return to main menu"


echo
echo
printf " ${cyan}[?] Enter your choice: ${NC}"
read choice

case "$choice" in
    1)
        update
        ;;
    2)
        sudo pacman -Qqn | sudo pacman -S -
        ;;
    3)
        sudo pacman -Sccc
        ;;
    4)
        sudo rm /var/lib/pacman/db.lck
        ;;
    5)
        sudo pacman -Qtdq | sudo pacman -Rns -
        ;;
    6)
        nitrogen
        ;;
    7)
        update
        ;;
    8)
        kernel-list
        ;;
    9)
        echo ""
        ;;
    0)
	      exit
        ;;

    *)
        echo "Invalid choice"
        ;;
esac

done
