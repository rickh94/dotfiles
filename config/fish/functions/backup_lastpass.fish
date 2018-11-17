# Defined in /tmp/fish.JXDVnn/backup_lastpass.fish @ line 1
function backup_lastpass
	aws_config
  python3 $HOME/bin/backup_lastpass.py
end
