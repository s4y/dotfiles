if [[ -n $ZSH_VERSION ]]; then
	DOTFILES=`dirname "$0"`
elif [[ -n $BASH_VERSION ]]; then
	DOTFILES=`dirname "${BASH_SOURCE[0]}"`
fi

if [[ -n $ZSH_VERSION ]]; then
	autoload -U compinit && compinit
	HISTSIZE=1000
	SAVEHIST=1000
	HISTFILE=~/.history
	INC_APPEND_HISTORY=1
	SHARE_HISTORY=1
	zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

	# Thanks, https://coderwall.com/p/jpj_6q
	autoload -U up-line-or-beginning-search
	autoload -U down-line-or-beginning-search
	zle -N up-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "^[[A" up-line-or-beginning-search # Up
	bindkey "^[[B" down-line-or-beginning-search # Down
fi

# Opt out of Homebrew analytics:
# https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

export PATH=$PATH:"$DOTFILES"/bin:~/bin
export CLICOLOR=1
export LSCOLORS=Cxfxcxdxbxcedeabagacad
export EDITOR=vim
export PAGER='less -SF'

# Thanks to https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend
HISTFILESIZE=16384
HISTSIZE=16384
HISTCONTROL=ignoreboth

# When including this from a box-specific .bash_profile, set PROMPT_COLOR and ORNAMENT_COLOR at will
if [[ -n $ZSH_VERSION ]]; then
	PS1=$'%{\e'"[${PROMPT_COLOR:-1;17}m%}%1~"$'%{\e[0m%}%{\e'"[${ORNAMENT_COLOR:-0;32}m%}:"$'%{\e[0m%} '
elif [[ -n $BASH_VERSION ]]; then
	PS1="\[\e[${PROMPT_COLOR:-1;17}m\]\W\[\e[0m\]\[\e[${ORNAMENT_COLOR:-0;32}m\]:\[\e[0m\] "
fi

set -o vi

# Mac-specific
if command -v sw_vers >/dev/null && [[ `sw_vers -productName` == "Mac OS X" ]]; then
	alias openports='sudo lsof -i -P | grep LISTEN'
	alias o='open .'
fi

alias sre="screen -xr"
alias l='ls -l'
alias la='ls -lA'
alias ..='cd ..'
alias wow='git status'
alias reload='. ~/.bashrc'

# mkcd -- create and change to a directory
function mkcd {
	if [ $# -ne 1 ]; then 
		echo "usage: mkcd directory_name" >&2
		return 1
	fi
	mkdir -p "${1}" && cd "${1}"
}

# Remove the working directory, if empty
function rmwd {
	local dir="$PWD"
	cd ..
	rmdir "$dir"
}

for file in "$DOTFILES"/sh.d/*; do
	builtin source $file
done
