function doctl_config
	set -l dotoken (pass show digitalocean/couperin-do-token)
sed -i "1i access-token: $dotoken" $HOME/.config/doctl/config.yaml
end
