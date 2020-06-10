set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/go:/usr/lib/go

set -x VISUAL 'nvim'
set -x EDITOR 'nvim'
set -x PAGER 'less'

fish_default_key_bindings




# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
#[ -f /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
#[ -f /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
#[ -f /home/rick/.config/yarn/global/node_modules/tabtab/.completions/slss.fish ]; and . /home/rick/.config/yarn/global/node_modules/tabtab/.completions/slss.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#eval /home/rick/.pyenv/versions/anaconda3-2019.10/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
#
status --is-interactive; and source (pyenv init -|psub)

# vim: se wrap:
