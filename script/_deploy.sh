set -e
set -x

# True if changes have been made in the db/migrate directory since last deploy
have_migrations()
{
  if [ -z "$1" ]
  then
    echo "must specify remote to check for migrations" 1>&2
    return 1
  else
    remote=$1
  fi


  heroku run rake db:migrate:status --remote $remote | sed 's/^ *//' | grep "^down"
  return $?
}


heroku pgbackups:capture -e --remote $REMOTE
git push $REMOTE $SOURCE:master

if have_migrations $REMOTE
then
  heroku maintenance:on --remote $REMOTE
  echo ">>> The Site is DOWN `date` <<<"
  heroku run rake db:migrate --remote $REMOTE
  heroku restart --remote $REMOTE
  heroku maintenance:off --remote $REMOTE
  echo ">>> The site is back UP `date` <<<"
fi

if [ -n "$CLEAR_CACHE" ]
then
  heroku run rails runner 'Rails.cache.clear' --remote $REMOTE
fi
