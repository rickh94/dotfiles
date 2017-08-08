# Rick's zshrc. using antibody and some plugins
# and stuff.
#
# This is the antibody init script. Has to be first.
# Don't fucking move it.
export TERM="xterm-256color"
source <(antibody init)
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle olivierverdier/zsh-git-prompt
antibody bundle bhilburn/powerlevel9k powerlevel9k

# Declare the variable for zsh highlight tweaks. That's kind of important.
typeset -A ZSH_HIGHLIGHT_STYLES

# change globbing to more readable color
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan,bold'

# check mail on spool
export MAIL=/var/spool/mail/rick
#mail -H

# correction
setopt correct

# pager/visual
export VISUAL='vim'
export PAGER='less'

# Borg passphrase
if [ -f ~/.borg_passphrase ]; then
  source ~/.borg_passphrase
fi
# in case zprofile wasn't sourced
source ~/.zprofile

# keychain if present
if [ -f ~/.keychaincommand ]; then
  source ~/.keychaincommand
fi

# Prompt
#export PROMPT='%F{red}%n%f@%F{cyan}%m%f %F{yellow}$(collapsed_path -l)%f
#%# '
#export RPROMPT='$(git_super_status)'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VIRTUALENV_BACKGROUND='005'
if [[ "$(hostname)" == 'couperin' ]]; then
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='002'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'
elif [[ "$(hostname)" == 'beethoven' ]]; then
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='006'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='015'
elif [[ "$(hostname)" == 'brahms' ]]; then
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='005'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='015'
else
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='007'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='000'
fi
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv context dir root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs background_jobs dir_writable)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_MODE='awesome-patched'

# set mpv driver
export VDPAU_DRIVER=va_gl

# save some time
export AUR=https://aur.archlinux.org
export BITBUCKET=git@bitbucket.org:Rickh94
export GITHOME=git@github.com:rickh94

# Bunch of Options
#
# share history, ignore duplicates
HISTFILE=$HOME/.zhistory
setopt append_history share_history append_history hist_expire_dups_first
HISTSIZE=1200
SAVEHIST=1000
setopt extended_history

# automatically cd from just dir
setopt autocd

# some quick replacement in file names
autoload -U zmv

# completion!!
autoload compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:::::' completer _complete _approximate


# complete from history
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey "^X^K" hist-complete

# extended glob
setopt extendedglob

# edit command line in editor
autoload edit-command-line && zle -N edit-command-line
bindkey '\ee' edit-command-line


# aliases
alias pgrep='pgrep -a'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -a'
alias lla='ls -la'
alias llah='ls -lah'
alias dirs='dirs -v'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias rename='rename -v'
alias ls='ls -F --color=always'
alias grep='grep --color=always'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias rm='rm -i'
alias h='history'
alias less='less -N'
alias vi='vim'
alias rename='perl-rename -v'
alias tryrename='perl-rename --dry-run'
#alias open='gvfs-open'
alias trash='gvfs-trash'
alias du='du -h'
alias df='df -h'
alias tarsnap='sudo tarsnap'
alias systemctl='sudo systemctl'
alias ppush='git push && git push public'
alias dd='dd status=progress'
alias prettyjson='python -m json.tool'
alias ll='exa -l'
alias lgit='exa -l --git'
alias la='exa -a'
alias lla='exa -la'
alias l='exa'
alias lless='exa -la | less'

# Global aliases
alias -g G='| grep'
alias -g L='| less'

# added by travis gem
[ -f /home/rick/.travis/travis.sh ] && source /home/rick/.travis/travis.sh
