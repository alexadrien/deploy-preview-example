#!/usr/bin/env bash

ssh -i ../devops/ssh/deploy-preview.pem ubuntu@ec2-34-244-153-202.eu-west-1.compute.amazonaws.com rm -rf /var/www/html/*
scp -r -i ../devops/ssh/deploy-preview.pem ./build/* ubuntu@ec2-34-244-153-202.eu-west-1.compute.amazonaws.com:/var/www/html/