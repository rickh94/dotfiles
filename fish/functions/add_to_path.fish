function add_to_path
	for binpath in $argv
if test -d $binpath
contains -- $binpath $PATH; or set -gx PATH $binpath $PATH
end
end
end
