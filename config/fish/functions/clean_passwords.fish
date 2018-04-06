function clean_passwords
  /bin/rm -f $HOME/.aws/credentials
  /bin/rm -f $HOME/.exercism.json
  /bin/rm -f $HOME/.pypirc
  /bin/rm -f $HOME/.config/hub
end
