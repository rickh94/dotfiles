#set -x PATH $PATH $HOME/.local/bin $HOME/.bin $HOME/.cargo/bin $HOME/.gem/ruby/2.4.0/bin $HOME/.node_modules/bin $HOME/go/bin
#set -x PATH $PATH $HOME/.local/bin $HOME/.bin #$HOME/.cargo/bin $HOME/.gem/ruby/2.4.0/bin $HOME/.node_modules/bin $HOME/go/bin
set -x GOROOT /usr/lib/go
set -x GOPATH $HOME/go /usr/lib/go
set -x SSH_ASKPASS "/usr/bin/ksshaskpass"

set -x VISUAL 'vim'
set -x EDITOR 'vim'
set -x PAGER 'less'
set -x MAKEFLAGS '-j4'

fish_default_key_bindings
#fish_vi_key_bindings

#if which pass
#  set -x BORG_PASSPHRASE=(pass show borg/(hostname))
#end

#if test -f $HOME/.borg_repo
#  set -x BORG_REPO=(cat $HOME/.borg_repo)
#end

# vim: se wrap:
