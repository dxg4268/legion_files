#!/usr/bin/env zsh


▒█▀▀█ █░░█ █░░█ █▀▀▄ ▒█▀▀█ █░░█ █░░█ █▀▀▄ ▒█▀▄▀█ █▀▀█ █▀▀█ █░░█
▒█░░░ █▀▀█ █░░█ █░░█ ▒█░░░ █▀▀█ █░░█ █░░█ ▒█▒█▒█ █▄▄█ █▄▄▀ █░░█ 
▒█▄▄█ ▀░░▀ ░▀▀▀ ▀░░▀ ▒█▄▄█ ▀░░▀ ░▀▀▀ ▀░░▀ ▒█░░▒█ ▀░░▀ ▀░▀▀ ░▀▀▀

# Define update interval (in seconds)
interval=1

# Define color codes
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[34m'
magenta='\033[35m'
cyan='\033[36m'
NC='\033[0m'

# Function to create a bar
create_bar() {
  percentage=$1
  bar_size=30
  filled_bar_size=$(echo "$percentage * $bar_size / 100" | bc -l | awk '{printf "%.0f", $0}')
  filled_bar=$(printf "%${filled_bar_size}s")
  empty_bar=$(printf "%$(($bar_size - $filled_bar_size))s")
  bar="[${filled_bar// /#}${empty_bar// /-}]"
  echo -e "$bar $percentage%"
}

# Clear the screen
clear

# Infinite loop
while :
do
  # Get current date and time
  date=$(date +"%T")

  # Get username and hostname
  user_host=$(whoami)@$(hostname)

  # Get system load
  load=$(uptime | awk '{print $10 $11 $12}')

  # Get total memory usage
  total=$(free -m | awk 'NR==2{print $2}')

  # Get used memory
  used=$(free -m | awk 'NR==2{print $3}')

  # Get free memory
  free=$(free -m | awk 'NR==2{print $4}')

  # Get memory usage percentage
  mem_usage=$(echo "scale=2; ($used/$total)*100" | bc)

  # Get CPU usage
  cpu_usage=$(printf "%.2f \n" $[100.00-$(sar -u 1 1 | awk '/Average/ {print}' | awk '{print $8}')])
  #cpu_usage=$(top -bn1 | awk '/^%Cpu/ { print $2 }')

  # Get CPU temperature
  temp=$(sensors | awk '/^Core 0:/{print $3}')

  # Clear the screen
  clear
  
  echo ""
 
  echo "                           █── █▀▀ █▀▀▀ ─▀─ █▀▀█ █▀▀▄" 
  echo "                           █── █▀▀ █─▀█ ▀█▀ █──█ █──█"
  echo "                           ▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀ ▀▀▀▀ ▀──▀"
  echo ""





  # Display the header
  echo -e " [${yellow}$user_host${NC}]                                                     [${green}$date${NC}]"
  echo -e " ${magenta}==============================================================================${NC}"
  echo ""
  # Display system load
  echo -e " ${cyan}Load${NC}: $load"

  # Display CPU usage bar
  echo -e " ${yellow}CPU Usage${NC}:                             $(create_bar $cpu_usage)"
  echo ""
  # Display memory usage
  echo -e " ${yellow}Memory Usage${NC}"
  echo -e "    Total: ${green}$total MB${NC}"
  echo -e "    Used: ${red}$used MB${NC}"
  echo -e "    Free: ${green}$free MB${NC}"
  echo -e "    Usage:                              ${magenta}$(create_bar $mem_usage)"
  
  # Display disk usage
  read disk_total disk_used disk_avail disk_percent disk_mount < <(df -h | grep '/$' | awk '{print $2, $3, $4, $5, $6}')

  disk_percent=${disk_percent%\%}
  echo ""
  echo -e " $(tput setaf 6)Root_Disk:                             $(create_bar $disk_percent) $(tput sgr0)"
  echo ""
  # Display CPU temperature
  echo -e " ${yellow}Temperature${NC}: $temp"
  
  kernel=$(uname -r)
  echo -e " $(tput setaf 2)Kernel: $kernel $(tput sgr0)"

  # Check if user presses 'q'
  read -t $interval -n 1 input
  if [[ $input == "q" ]]; then
    echo -e "\nExiting..."
    exit
  fi



  # Wait for the defined interval
  sleep $interval
done

