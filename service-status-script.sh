#!/bin/bash
# Author: Naveen Bose
# Purpose: Service status script
# Description: This script checks the status of a specified service and displays whether it is running or not.
#Note: must change service in "service_name=" before run the script

# Define the service name
service_name="my_service"

# Check if the service is running
if systemctl is-active --quiet $service_name; then
    echo "$service_name is running."
else
    echo "$service_name is not running."
fi

