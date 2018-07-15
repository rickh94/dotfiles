# Defined in /tmp/fish.1MOoU8/gnvim.fish @ line 2
function gnvim --description 'open file in nvim in new window'
	alacritty -t "nvim: $argv" -e nvim $argv >/dev/null ^/dev/null &
  disown %(jobs |grep 'alacritty -t "nvim $argv" -e nvim $argv' |awk '{print $1}')
end
