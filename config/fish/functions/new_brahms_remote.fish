function new_brahms_remote
  set -l newrepo $argv[1]
  mkdir $newrepo
  git init $newrepo
  ssh rick@brahms.local "git init --bare /home/rick/remotes/$newrepo.git"
  cd $newrepo
  git remote add origin "rick@brahms.local:remotes/$newrepo.git"
end
