#!/usr/bin/env bash

chmod 400 ../devops/ssh/deploy-preview.pem
ssh -i -o StrictHostKeyChecking=no ../devops/ssh/deploy-preview.pem ubuntu@ec2-34-244-153-202.eu-west-1.compute.amazonaws.com rm -rf /var/www/html/*
scp -r -o StrictHostKeyChecking=no -i ../devops/ssh/deploy-preview.pem ./build/* ubuntu@ec2-34-244-153-202.eu-west-1.compute.amazonaws.com:/var/www/html/