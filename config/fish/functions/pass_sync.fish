function pass_sync
	echo "updating passwords"
  if pass git status -s
    pass git add -A
    pass git commit -m 'add manual pasword changes'
  end
  pass git pull
  pass git push
  aws_config
  set -l prevdir $PWD
  cd $HOME
  tar -cJf /tmp/password-backup.tar.xz .password-store/*
  set -l sum (openssl md5 -binary /tmp/password-backup.tar.xz|base64)
  aws s3api put-object --bucket ricks-password-bucket --body /tmp/password-backup.tar.xz --key password-backup.tar.xz --content-md5 $sum --server-side-encryption AES256 --storage-class STANDARD_IA
  cd $prevdir
end
