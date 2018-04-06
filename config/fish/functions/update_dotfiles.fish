function update_dotfiles
	set -l prevdir $PWD
echo "Updating Dotfiles"
cd ~/.dotfiles
if git status -s 
git add -A
git commit -m "update dotfiles" (date) (git status -s)""
git pull
git push
else
git pull
end
./install
cd $prevdir
end
