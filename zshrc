# Rick's zshrc. using antibody and some plugins
# and stuff.
export TERM='xterm-256color'
# This is the antibody init script. Has to be first.
# Don't fucking move it.
source <(antibody init)
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle olivierverdier/zsh-git-prompt
antibody bundle bhilburn/powerlevel9k powerlevel9k

export SSH_ASKPASS="/usr/bin/ksshaskpass"

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

# makeflags
export MAKEFLAGS='-j4'

# Borg passphrase
if [ -f $HOME/.borg_passphrase ]; then
  source $HOME/.borg_passphrase
fi

# keychain if present
if [ -f $HOME/.keychaincommand ]; then
  source $HOME/.keychaincommand
fi

#if which pass; then
#  export

# Prompt
#export PROMPT='%F{red}%n%f@%F{cyan}%m%f %F{yellow}$(collapsed_path -l)%f
#%# '
#export RPROMPT='$(git_super_status)'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VIRTUALENV_BACKGROUND='005'
if [[ "$(hostname)" == 'couperin' ]]; then
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='011'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='008'
  export DIGITALOCEAN_ACCESS_TOKEN="$(pass show digitalocean/couperin-do-token)"
elif [[ "$(hostname)" == 'beethoven' ]]; then
  export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='006'
  export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='015'
  export DIGITAL_OCEAN_ACCESS_TOKEN="$(pass show digitalocean/beethoven-do-token)"
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
HISTSIZE=2000
SAVEHIST=1000
setopt extended_history

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
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias rename='rename -v'
alias ls='ls -F --color=always'
alias grep='egrep --color=always'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias rm='rm -iv'
alias h='history'
alias less='less -N'
alias vi='vim'
alias rename='perl-rename -v'
alias tryrename='perl-rename --dry-run'
alias du='du -h'
alias df='df -h'
alias tarsnap='sudo tarsnap'
alias systemctl='sudo systemctl'
alias ppush='git push && git push public'
alias dd='dd status=progress'
alias prettyjson='python -m json.tool'
#alias l='exa'
#alias ll='exa -l'
#alias lgit='exa -l --git'
#alias la='exa -a'
#alias lla='exa -la'
#alias lless='exa -la | less'
alias chmod='chmod -v'
alias chown='chown -v'
alias randomgarbage='echo $RANDOM | sha256sum |cut -c1-7'

# Global aliases
alias -g G='| grep'
alias -g L='| less'

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handler {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found --no-failure-msg -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found --no-failure-msg -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi


source $HOME/.zprofile

if [ -x $HOME/.command-not-found.zsh ]; then
  source $HOME/.command-not-found.zsh
fi
# vim: se ft=sh:
