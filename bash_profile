#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

possible_paths=("$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.gem/ruby/2.4.0/bin" "$HOME/.node_modules/bin" "$HOME/go/bin" "$HOME/bin")

for poss in "$possible_paths"
do
  if [ -d "$poss" ]
  then
    PATH="$PATH:$poss"
  fi
done

export PATH
