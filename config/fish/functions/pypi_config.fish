function pypi_config
	echo "[distutils]" > $HOME/.pypirc
  echo "index-servers =" >> $HOME/.pypirc
  echo "  pypi" >> $HOME/.pypirc
  echo "  testpypi" >> $HOME/.pypirc
  echo "" >> $HOME/.pypirc
  echo "[pypi]" >> $HOME/.pypirc
  echo "username=rickh94" >> $HOME/.pypirc
  echo "password="(pass show pypi/live)
  echo "" >> $HOME/.pypirc
  echo "[testpypi]" >> $HOME/.pypirc
  echo "repository=https://test.pypi.org/legacy/" >> $HOME/.pypirc
  echo "username=rickh94" >> $HOME/.pypirc
  echo "password="(pass show pypi/testing) >> $HOME/.pypirc
  echo "" >> $HOME/.pypirc
  echo "# vim: se ft=dosini:" >> $HOME/.pypirc
end
