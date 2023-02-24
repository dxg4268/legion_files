#!/bin/bash
## Copyright (C) 2023-2023 Aditya Sharma <dxg4268>

red='\033[0;31m'
yellow='\033[0;33m'
green='\033[0;32m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
clear='\033[0m'


date=$(date +"%T")
user_host=$(whoami)@$(hostname)


banner() {
echo ""
echo  "                           ▄▀█ █░░ █ █▄▀ █▀█ █▀▀ █▀▄" 
echo  "                           █▀█ █▄▄ █ █░█ █▀▄ ██▄ █▄▀"
echo "                                    made for LegionOS"
echo ""

echo -e " [${yellow}$user_host${clear}]                                                     [${green}$date${clear}]"
echo -e "${magenta} ==============================================================================${clear}"

}

while true; 
do
clear
banner
echo
echo 
echo -e " ${cyan}[-] Options -${clear}"
echo
echo -e " ${green}1)${clear} List Installed Linux Kernel"
echo -e " ${green}2)${clear} Install a new Kernel"
echo -e " ${green}3)${clear} Return to main menu"

echo
echo
printf " ${cyan}[?] What to do ? : ${clear}"
read choice

case $choice in
  1)
    echo 
    echo -e " ${cyan}[-] Installed Kernels ${clear}"
    kernel-switcher
    sleep 5
    ;;
  2)
    kernel-installer-bin
    ;;
  3)
    exit
    ;;

  *)
    echo -e " Invalid Choice !"
    ;;
esac
done


