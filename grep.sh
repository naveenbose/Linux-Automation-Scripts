#!/bin/bash
########################################################
# Author: Naveen Bose
# Purpose : To speed the work 
########################################################

if [ $# -ne 2 ];                                                                
then                                                                            
        echo "Usage syntax: $0 <filename> <letters>"        
exit 1                                                                          
fi                                                                              
                                                                                
filename=$1
letters=$2                                                                      
                                                                     
grep -i $letters $filename                                                      
                                                                                
echo "Here you go"  
