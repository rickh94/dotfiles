if [ -f $HOME/.gcloud ]; then
  source $HOME/.bin/gcloud-logout
fi
/bin/rm -f $HOME/.pypirc
/bin/rm -f $HOME/.aws/credentials
