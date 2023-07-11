#!/bin/bash
# Author: Naveen Bose
# Purpose: Advanced server monitoring script
# Description: This script monitors CPU usage, memory usage, and disk space. If any of these metrics exceed the specified thresholds, it sends an email notification using the configured SMTP server. Adjust the email configuration variables (recipient, sender, smtp_server, smtp_port, smtp_username, smtp_password) and customize the threshold values as per your requirements.Please note that this script requires the sendmail command-line tool to be installed on your system to send email notifications. Additionally, make sure to replace the placeholder email addresses and SMTP server details with the actual values

# Email configuration
recipient="admin@example.com"
sender="monitoring@example.com"
smtp_server="smtp.example.com"
smtp_port="587"
smtp_username="monitoring@example.com"
smtp_password="your_password"

# Thresholds
cpu_threshold=90     # CPU usage threshold (in percentage)
mem_threshold=90     # Memory usage threshold (in percentage)
disk_threshold=90    # Disk usage threshold (in percentage)

# Check CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
cpu_usage=${cpu_usage%.*} # Remove decimal point if present

# Check memory usage
mem_usage=$(free | awk 'NR==2 {print ($3/$2) * 100}')

# Check disk usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Check if CPU usage exceeds the threshold
if [ $cpu_usage -gt $cpu_threshold ]; then
    subject="High CPU Usage Alert on $(hostname)"
    message="CPU usage is currently at $cpu_usage%."

    # Send email notification
    echo -e "Subject:$subject\n$message" | \
    /usr/sbin/sendmail -S "$smtp_server:$smtp_port" \
    -au"$smtp_username" -ap"$smtp_password" -f"$sender" "$recipient"
fi

# Check if memory usage exceeds the threshold
if [ $mem_usage -gt $mem_threshold ]; then
    subject="High Memory Usage Alert on $(hostname)"
    message="Memory usage is currently at $mem_usage%."

    # Send email notification
    echo -e "Subject:$subject\n$message" | \
    /usr/sbin/sendmail -S "$smtp_server:$smtp_port" \
    -au"$smtp_username" -ap"$smtp_password" -f"$sender" "$recipient"
fi

# Check if disk usage exceeds the threshold
if [ $disk_usage -gt $disk_threshold ]; then
    subject="High Disk Usage Alert on $(hostname)"
    message="Disk usage is currently at $disk_usage%."

    # Send email notification
    echo -e "Subject:$subject\n$message" | \
    /usr/sbin/sendmail -S "$smtp_server:$smtp_port" \
    -au"$smtp_username" -ap"$smtp_password" -f"$sender" "$recipient"
fi

