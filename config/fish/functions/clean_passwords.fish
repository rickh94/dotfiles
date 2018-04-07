# Defined in /tmp/fish.eDt3h1/clean_passwords.fish @ line 2
function clean_passwords
	/bin/rm -f $HOME/.aws/credentials
  /bin/rm -f $HOME/.exercism.json
  /bin/rm -f $HOME/.pypirc
  /bin/rm -f $HOME/.config/hub
  sed -i '/access-token/d' $HOME/.config/doctl/config.yaml
end
