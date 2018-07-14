function lsblk-clean
	lsblk |grep -v "loop"
end
