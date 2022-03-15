#! /bin/bash

sys_log_file="system-info.log"

# If logfile doesn't exists. 
if [ ! -f $sys_log_file ]
  then
    printf "Memory\t\tDisk\t\tCPU\n" > $sys_log_file
fi


# Store MEM value. Awk reads second line, used_mem*100/total_mem . 
MEM=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')

# Store DISK value. Awk reads / (root) partition and stores 5th column.
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')

# Store CPU value. Top is called once, awk reads first column after load average:.  
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

# Store collected values to file.
echo "$MEM$DISK$CPU" >> $sys_log_file
