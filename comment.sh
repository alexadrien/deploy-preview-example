#!/usr/bin/env bash

echo "https://api.github.com/repositories/174213864/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN_COMMENTS"
curl -X POST \
  "https://api.github.com/repositories/174213864/commits/$CIRCLE_SHA1/comments?access_token=$GITHUB_TOKEN_COMMENTS" \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 6a8282ec-8e8f-4c0c-8275-82687cb05797' \
  -H 'cache-control: no-cache' \
  -d "{
  \"body\": \"Feature available here : http://$TEMPORARY_EC2_URL\"
}
"