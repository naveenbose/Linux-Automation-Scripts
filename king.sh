#!/bin/bash
########################################################
#Author: Naveen Bose
#Description: This script is useful while playing CTFs, but platform like tryhackme.com forbids this kind of automated scripts to add your name into king.txt, But im curious what if i create this script so i did it for fun. Tested localy not in CTFs environment.
#########################################################

if [ $# -ne 1 ];
then
    echo "Append filename you want to create: $0 <filename>"
    exit 1
fi


filename=$1

if [ -f "$filename" ] && [ -w "$filename"  ]
then
    echo "N4V33N" > $filename
else
    touch "/root/$filename"
    echo "N4V33N" > "/root/$filename"
fi

