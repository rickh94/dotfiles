function aws_config
	mkdir ~/.aws
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id = (pass show aws/primary/ID)" >> ~/.aws/credentials
echo "aws_secret_access_key = (pass show aws/primary/secret)" >> ~/.aws/credentials
echo "" >> ~/.aws/credentials
echo "# vim: se ft=dosini:" >> ~/.aws/credentials
end
