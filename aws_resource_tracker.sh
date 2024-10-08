#!/bin/bash
#script to track the resource usage of some of the aws services
#s3, lambda, iam, ec2 
#this will also show the use of jq

set -x #this will start the script in debug mode

set -e #this will exit the script if there is an error

set -o pipefail #this will overcome the drawback of set -e
touch trackerReport
aws s3 ls > trackerReport #to liost down all the s3 buckets

aws lambda list-functions >> trackerReport #this will list the lambda functions

aws iam list-users | jq '.Users[].UserName' >>trackerReport  #this will list down the iam users

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >>trackerReport
