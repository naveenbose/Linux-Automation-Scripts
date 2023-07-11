#!/bin/bash
#
#Author: Naveen Bose
#Purpose: Backup script
#Description: Must change backup_source and backup_destination before running the script 

# Define backup source and destination directories
backup_source="/path/to/source"
backup_destination="/path/to/destination"

# Create a timestamp for the backup file
timestamp=$(date +%Y%m%d%H%M%S)
backup_file="backup_$timestamp.tar.gz"

# Create the backup
tar -czvf "$backup_destination/$backup_file" "$backup_source"

# Optionally, delete old backups older than 30 days
find "$backup_destination" -name "backup_*.tar.gz" -type f -mtime +30 -exec rm {} \;

