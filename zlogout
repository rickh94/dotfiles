if [ -f $HOME/.gcloud ] && [ -f $Home/.config/gcloud/credentials.db ]; then
  source $HOME/.bin/gcloud-logout
fi
/bin/rm -f $HOME/.pypirc
/bin/rm -f $HOME/.aws/credentials
/bin/rm -f $HOME/.exercism.json
/bin/rm -f $HOME/.config/hub
