#!/bin/bash

SECRET_KEY="adam-lab.pem"
PUBLIC_DNS="ubuntu@ec2-3-67-195-219.eu-central-1.compute.amazonaws.com"

scp -i $SECRET_KEY ./EC2 $PUBLIC_DNS:~/
ssh -i $SECRET_KEY $PUBLIC_DNS
