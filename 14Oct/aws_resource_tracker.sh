#!/bin/bash
#Author : Sangram Kadav
#Date: 14th Oct 2024

set -x #this will start the code in debug mode

set -e

set -o pipefail

#this is the script to get the usage of aws resources associated
#resources include iam, ec2, s3,lambda
#this will also give demonstartration of jquery to filter results

aws s3 ls > aws_usage_report  #to list down all the s3 buckets

aws lambda list-functions >>aws_usage_report #to list lambda functions

aws iam list-users | jq '.Users[].UserName' >> aws_usage_report #to list iam users

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> aws_usage_report #to get the instance IDs of ec2 instances available


