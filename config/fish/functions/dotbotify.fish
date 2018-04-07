# Defined in /tmp/fish.st3sjG/dotbotify.fish @ line 2
function dotbotify --description 'add file to dotbot'
	set -l prevdir $PWD
  set -l oldpath (readlink -f $argv[1] | sed "s@$HOME@\~@")
  set -l newpath (echo $argv[2] | sed 's@.*/.dotfiles/@@ ; s@"@@')
  mv $argv[1] $HOME/.dotfiles/$newpath
  sed -i.bak "/- link:/a\\
    $oldpath: $newpath" $HOME/.dotfiles/install.conf.yaml
  cd $HOME/.dotfiles
  git add $newpath
  git add install.conf.yaml
  git commit -m "add $newpath to dotfiles"
  ./install
  cd $prevdir
end
