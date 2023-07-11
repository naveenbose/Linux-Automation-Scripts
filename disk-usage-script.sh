#!/bin/bash
# Author: Naveen Bose
# Purpose: Disk usage script
# Description: This script calculates the disk usage of a specified directory and displays the size in a human-readable format.
#Note: must change path before running the script

# Define the directory path
directory="/path/to/directory"

# Calculate the disk usage
disk_usage=$(du -sh $directory | awk '{print $1}')

# Display the disk usage
echo "Disk Usage of $directory: $disk_usage"

