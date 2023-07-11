#!/bin/bash
#
#Author: naveen bose
#Purpose: Automatic system updates
#
#
#
# Update the package lists
sudo yum update -y

# Remove unnecessary packages
sudo yum autoremove -y

# Clean up the package cache
sudo yum clean all

