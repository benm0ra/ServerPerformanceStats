# server-stats.sh

A Bash script that prints a quick snapshot of a Linux server's resource usage: CPU, memory, disk, and the top processes by CPU and memory.

## Overview

Built for the [roadmap.sh Server Performance Stats](https://roadmap.sh/projects/server-stats) DevOps project.

## Script Details

- **Author**: Benjamin Morales  
- **Date**: April 2025  

## Features

The script outputs the following information:
1. **Total CPU Usage**: Displays the percentage of CPU currently in use.
2. **Memory Usage**: Shows used and free memory in MB, along with percentages.
3. **Disk Usage**: Summarizes total disk space used and free, including percentages.
4. **Top 5 Processes by CPU Usage**: Lists the most CPU-intensive processes.
5. **Top 5 Processes by Memory Usage**: Lists the most memory-intensive processes.

## Prerequisites

- Linux. The script relies on GNU/procps versions of `top`, `free`, `df --total`, and `ps --sort`, so it won't run unmodified on macOS.
- `bash` shell.
- Basic utilities such as `top`, `free`, `df`, and `ps`.

## Usage

```bash
git clone https://github.com/benm0ra/ServerPerformanceStats.git
cd ServerPerformanceStats
chmod +x server-stats.sh
./server-stats.sh
```

See [`server-stats.sh`](server-stats.sh) for the full source.

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
