#!/usr/bin/env bash

echo $CIRCLE_SHA1
curl -X POST \
  'https://api.github.com/repos/alexadrien/deploy-preview-conf/commits/$CIRCLE_SHA1/comments?access_token=fc1d513e804fc7ac7b8e0946026c7f5406eaf6db' \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 6a8282ec-8e8f-4c0c-8275-82687cb05797' \
  -H 'cache-control: no-cache' \
  -d '{
  "body": "Great stuff"
}
'