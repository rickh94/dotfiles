# Defined in /tmp/fish.0TL8Yv/mount-clean.fish @ line 2
function mount-clean --description 'show mounted devices without snaps'
	mount | grep -v "snapd" | grep -v "cgroup"
end
