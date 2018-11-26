set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/go:/usr/lib/go
set -x SSH_ASKPASS /usr/bin/ksshaskpass

set -x VISUAL 'nvim'
set -x EDITOR 'nvim'
set -x PAGER 'less'
set -x TERM 'konsole-256color'

fish_default_key_bindings

if test -f /usr/bin/pass
  set -x BORG_PASSPHRASE (pass show borg/(hostname))
end

if test -f $HOME/.borg_repo
  set -x BORG_REPO (cat $HOME/.borg_repo)
end


# vim: se wrap:

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /home/rick/.node_modules/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish