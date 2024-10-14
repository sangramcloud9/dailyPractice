#!/bin/bash
#Author : Sangram Kadav
#Date 14th Oct

set -x #this will start the code in debug mode

set -e #this will exit the script if there is an error

set -o pipefail #this will overcome the drawback of set e

free -g >nodeHealthReport #this will print the RAM usage

df -h >>nodeHealthReport #this will print the disk usage

ps -ef >> nodeHealthReport #this will print all the running processes

ps -ef | grep amazon >> nodeHealthReport  #filter amazon

ps -ef | grep amazon | awk -F" " '{print $2}' >> nodeHealthReport #filter column 2
