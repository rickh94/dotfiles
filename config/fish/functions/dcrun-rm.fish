function dcrun-rm
	docker-compose run --rm $argv[1] sh -c "$argv[2..-1]"
end
