function update_dotfiles
	set -l prevdir $PWD
  echo "Updating Dotfiles"
  cd ~/.dotfiles
  if git status -s
    git add -A
    set -l message (date)\n"update dotfiles"\n(git status -s)
    git commit -m "$message"
    git pull
    git push
  else
    git pull
  end
  ./install
  cd $prevdir
end
