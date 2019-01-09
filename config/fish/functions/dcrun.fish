# Defined in /tmp/fish.RpwoQW/dcrun.fish @ line 1
function dcrun
	docker-compose run $argv[1] sh -c "$argv[2..-1]"
end
