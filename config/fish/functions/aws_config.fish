<<<<<<< HEAD
# Defined in /tmp/fish.JKlzK2/aws_config.fish @ line 2
=======
# Defined in /tmp/fish.AJFzP3/aws_config.fish @ line 2
>>>>>>> 432575ee340a78a7f31315de6ed1f33b748d4cef
function aws_config
	/bin/mkdir ~/.aws ^/dev/null
  echo "[default]" > ~/.aws/credentials
  echo "aws_access_key_id =" (pass show aws/primary/ID) >> ~/.aws/credentials
  echo "aws_secret_access_key =" (pass show aws/primary/secret) >> ~/.aws/credentials
  echo "" >> ~/.aws/credentials
  echo "# vim: se ft=dosini:" >> ~/.aws/credentials
end
