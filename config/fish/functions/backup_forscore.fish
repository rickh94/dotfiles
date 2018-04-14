function backup_forscore
	set -l tmp (mktemp -d /tmp/ipad-backup-XXXXXX)
set -l archive $HOME/Documents/backup_of_ipad/backup_(date +"%Y_%m_%d").tar.xz
echo "Copying Files"
/bin/cp * $tmp
cd $tmp
pwd
echo "creating tar archive"
tar -cJF $archive *
echo "copying to remote"
scp $archive rick@brahms:mobile_backups/rick_ipad/forscore
end
