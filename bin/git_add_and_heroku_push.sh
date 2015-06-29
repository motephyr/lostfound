#!/bin/bash

if [ $1 ]; then
  rake assets:precompile
  git add .
  git commit -m $1
  echo "commit -m '${1}' "
else
  echo 'just push have commited'
fi
git push heroku master
heroku run rake db:migrate
