# Defined in /tmp/fish.lS6AFG/gnvim.fish @ line 1
function gnvim --description 'open file in nvim in new window'
	konsole -e nvim $argv &
  disown %(jobs |grep 'konsole -e nvim $argv' |awk '{print $1}')
end
