#!/usr/bin/env sh

# abort on errors
set -e

cd .vuepress/dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git config --global user.email "flrx.dev@gmail.com"
git config --global user.name "Cirrus CI: Flrx Validator"
git init
git add -A
git commit -m 'deploy'
git remote add origin https://$DEPLOYMENT_TOKEN@github.com/flrx/validator.git
git push -f -u origin master:gh-pages

cd -