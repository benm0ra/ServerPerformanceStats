#!/bin/bash

# Script: System Resource Usage Summary
# Author: Ben
# Date: April 2025

echo "====================================="
echo "       System Resource Summary       "
echo "====================================="

# 1. Total CPU Usage
echo "1. Total CPU Usage:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}')
echo "   Total CPU Usage: $CPU_USAGE"
echo ""

# 2. Total Memory Usage (Free vs Used including percentage)
echo "2. Total Memory Usage:"
MEMORY_STATS=$(free -m | awk 'NR==2{printf "   Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2}')
echo "$MEMORY_STATS"
echo ""

# 3. Total Disk Usage (Free vs Used including percentage)
echo "3. Total Disk Usage:"
DISK_STATS=$(df -h --total | grep "total" | awk '{printf "   Used: %s (%s), Free: %s\n", $3, $5, $4}')
echo "$DISK_STATS"
echo ""

# 4. Top 5 Processes by CPU Usage
echo "4. Top 5 Processes by CPU Usage:"
ps -eo pcpu,pid,user,args --sort=-pcpu | head -n 6 | awk 'NR>1 {printf "   CPU: %s%% | PID: %s | User: %s | Command: %s\n", $1, $2, $3, $4}'
echo ""

# 5. Top 5 Processes by Memory Usage
echo "5. Top 5 Processes by Memory Usage:"
ps -eo pmem,pid,user,args --sort=-pmem | head -n 6 | awk 'NR>1 {printf "   MEM: %s%% | PID: %s | User: %s | Command: %s\n", $1, $2, $3, $4}'
echo ""

echo "====================================="
