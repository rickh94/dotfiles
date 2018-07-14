function df-clean --description 'df without loop devices'
	df -h |grep -v "loop"
end
