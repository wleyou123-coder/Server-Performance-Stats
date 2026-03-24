#!/bin/bash

echo "Total CPU usage:"
top -bn1 | grep -i '^%cpu' | cut -f1-9 -d' '
echo -e '\n'

echo "Total memory usage:"
top -bn1 | grep -i '^Mib mem' | cut -f1,3 -d','
echo -e '\n'

echo  "Total disk usage:"
df -ha | awk '{print $1, $3, $5}' | column -t
echo -e '\n'

echo "Total 5 processes by CPU usage:"
ps aux | awk '{print $2,$3}' | sort -k2 -r | head -n6 | column -t
echo -e '\n'

echo "Top 5 processes by memory usage:"
ps aux | awk '{print $2,$4}' | sort -k2 -r | head -n6 | column -t
echo -e '\n'
