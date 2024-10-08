#!/bin/bash
#script to analyze node health
#date 8th OCT
#memory usage, disk usage, basic set functions, processor usage, print processes, ussage of grep command
#############################

set -x #this will start the script in debug mode

set -e #this will exit the script if there is an error

set -o pipefail #this will overcome the drawback of set -e

free -g #this is for printing the memory usage

df -h #for printing the disk space

nproc #for printing the resource usage

ps -ef #this will print all the processes running

ps -ef | grep amazon #this will print all the processes who contains amazon

ps -ef | grep amazon | awk -F" " '{print $2}' #this will print column 2 of previous result
