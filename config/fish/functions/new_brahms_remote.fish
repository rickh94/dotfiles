# Defined in /tmp/fish.Si6HwI/new_brahms_remote.fish @ line 2
function new_brahms_remote
	set -l prevdir $PWD
	set -l newrepo $argv[1]
  mkdir $newrepo
  git init $newrepo
  ssh rick@brahms "git init --bare /home/rick/remotes/$newrepo.git"
  cd $newrepo
  git remote add origin "rick@brahms:remotes/$newrepo.git"
  cd $prevdir
end
