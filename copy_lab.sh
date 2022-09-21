#!/bin/bash

SECRET_KEY="adam-lab.pem"
PUBLIC_DNS="ubuntu@ec2-3-67-195-219.eu-central-1.compute.amazonaws.com"

scp -i $SECRET_KEY ./lab_files/docker-compose.yaml $PUBLIC_DNS:~/lab_files/
scp -i $SECRET_KEY ./lab_files/Dockerfile $PUBLIC_DNS:~/lab_files/
scp -i $SECRET_KEY ./lab_files/init.sh $PUBLIC_DNS:~/lab_files/
scp -i $SECRET_KEY ./lab_files/dev_server_run.sh $PUBLIC_DNS:~/lab_files/
ssh -i $SECRET_KEY $PUBLIC_DNS
