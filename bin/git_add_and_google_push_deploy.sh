if [ $1 ]; then
  rake assets:precompile
  git add .
  git commit -m $1
  echo "commit -m '${1}' "
else
  echo 'just push have commited'
fi
git push bucket master
cap production deploy
