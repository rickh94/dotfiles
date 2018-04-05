function update_dotfiles
	set -l prevdir $PWD
echo "Updating Dotfiles"
cd ~/.dotfiles
if test ! -z (git status -s) 
git add -a
git commit -sm "update dotfiles (date) (git status -s)"
git pull
git push
else
git pull
end
./install
end
