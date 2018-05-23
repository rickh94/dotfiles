set  -l possible_paths $HOME/.local/bin $HOME/.cargo/bin $HOME/.gem/ruby/2.{4,5}.0/bin $HOME/.node_modules/bin $HOME/go/bin $HOME/bin /usr/sbin /sbin

add_to_path $possible_paths
