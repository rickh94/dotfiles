function hub_config
	echo "---" > $HOME/.config/hub
echo "github.com:" >> $HOME/.config/hub
echo "- oauth_token: " (pass show github/hub-token) >> $HOME/.config/hub
echo "user: rickh94" >> $HOME/.config/hub
echo "" >> $HOME/.config/hub
echo "# vim: se ft=yaml:" >> $HOME/.config/hub
end
