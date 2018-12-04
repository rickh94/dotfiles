# Defined in /tmp/fish.HwfDaN/hub_config.fish @ line 2
function hub_config
	echo "---" > $HOME/.config/hub
echo "github.com:" >> $HOME/.config/hub
echo "- user: rickh94" >> $HOME/.config/hub
echo "  oauth_token: " (pass show github.com/hub-token) >> $HOME/.config/hub
echo "  protocol: \"\"" >> $HOME/.config/hub
echo "" >> $HOME/.config/hub
echo "# vim: se ft=yaml:" >> $HOME/.config/hub
end
