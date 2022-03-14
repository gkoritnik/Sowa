#! /bin/bash

sys_log_file="system-info.log"

# If logfile doesn't exists. 
if [ ! -f $sys_log_file ]
  then
    printf "RAM\t\tDisk\t\tCPU\n" > $sys_log_file
fi


# Store MEM, DISK and CPU.
MEM=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')

echo "$MEM$DISK$CPU" >> $sys_log_file
