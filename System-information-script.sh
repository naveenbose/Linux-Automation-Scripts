#!/bin/bash
# Author: Naveen Bose
# Purpose: System information script
# Description: This script retrieves various system information such as hostname, kernel version, CPU information, and memory usage.

# Retrieve the hostname
hostname=$(hostname)

# Retrieve the kernel version
kernel_version=$(uname -r)

# Retrieve CPU information
cpu_info=$(cat /proc/cpuinfo | grep "model name" | uniq)

# Retrieve memory usage
memory_usage=$(free -h | awk 'NR==2 {print $3 "/" $2}')

# Display system information
echo "Hostname: $hostname"
echo "Kernel Version: $kernel_version"
echo "CPU Information: $cpu_info"
echo "Memory Usage: $memory_usage"

