# System Resource Usage Summary Script

## Overview

This Bash script provides a summary of system resource usage, including CPU, memory, and disk usage, as well as the top processes consuming these resources for https://roadmap.sh/projects/server-stats Devops projects.

## Script Details

- **Author**: Ben  
- **Date**: April 2025  

## Features

The script outputs the following information:
1. **Total CPU Usage**: Displays the percentage of CPU currently in use.
2. **Memory Usage**: Shows used and free memory in MB, along with percentages.
3. **Disk Usage**: Summarizes total disk space used and free, including percentages.
4. **Top 5 Processes by CPU Usage**: Lists the most CPU-intensive processes.
5. **Top 5 Processes by Memory Usage**: Lists the most memory-intensive processes.

## Prerequisites

- A Unix-based operating system (Linux or macOS).
- `bash` shell.
- Basic utilities such as `top`, `free`, `df`, and `ps`.

## Usage

1. Copy the script to your local machine and save it as `performance_summary.sh`.
2. Make the script executable:
   ```bash
   chmod +x performance_summary.sh
   ```
3. Run the script:
   ```bash
   ./performance_summary.sh
   ```

## Script Code

```bash
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
```

## Example Output

When you run the script, you will see an output similar to this:

```
=====================================
       System Resource Summary       
=====================================
1. Total CPU Usage:
   Total CPU Usage: 12%

2. Total Memory Usage:
   Used: 2048MB (50%), Free: 2048MB (50%)

3. Total Disk Usage:
   Used: 50G (25%), Free: 150G

4. Top 5 Processes by CPU Usage:
   CPU: 25% | PID: 1234 | User: root | Command: python3
   CPU: 15% | PID: 5678 | User: user1 | Command: java
   ...

5. Top 5 Processes by Memory Usage:
   MEM: 30% | PID: 1234 | User: root | Command: python3
   MEM: 20% | PID: 5678 | User: user1 | Command: java
   ...

=====================================
```

## License

This project is licensed under the MIT License. Feel free to use and modify it as needed.
