#!/usr/bin/env bash

chmod 400 ../devops/ssh/deploy
ssh -o StrictHostKeyChecking=no -i ../devops/ssh/deploy ubuntu@$TEMPORARY_EC2_URL rm -rf /var/www/html/*
scp -r -o StrictHostKeyChecking=no -i ../devops/ssh/deploy ./build/* ubuntu@$TEMPORARY_EC2_URL:/var/www/html/