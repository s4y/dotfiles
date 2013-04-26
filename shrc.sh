if [[ -n $ZSH_VERSION ]]; then
	DOTFILES=`dirname "$0"`
elif [[ -n $BASH_VERSION ]]; then
	DOTFILES=`dirname "${BASH_SOURCE[0]}"`
fi

export PATH="$DOTFILES"/bin:~/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=Cxfxcxdxbxcedeabagacad
export EDITOR=vim
# Omit commands beginning with a space from command history. Useful for command lines with passwords.
export HISTIGNORE=" *"

# When including this from a box-specific .bash_profile, set PROMPT_COLOR and ORNAMENT_COLOR at will
if [[ -n $ZSH_VERSION ]]; then
	PS1=$'%{\e'"[${PROMPT_COLOR:-48;5;17}m%}%m [%1~]"$'%{\e[0m%} %{\e'"[${ORNAMENT_COLOR:-0;32}m%}$"$'%{\e[0m%} '
elif [[ -n $BASH_VERSION ]]; then
	PS1="\[\e[${PROMPT_COLOR:-48;5;17}m\]\h [\W]\[\e[0m\] \[\e[${ORNAMENT_COLOR:-0;32}m\]$\[\e[0m\] "
fi

set -o vi

# Application-specific aliases
alias g=git
if [[ -e /Applications/TextMate.app ]]; then
	alias m="mate ."
fi
# Mac-specific aliases
if command -v sw_vers >/dev/null && [[ `sw_vers -productName` == "Mac OS X" ]]; then
	alias openports='sudo lsof -i -P | grep LISTEN'
	alias o='open .'

	function pref {
		if [ $# -ne 1 ]; then
			echo "usage: pref preference_pane" >&2
			return 1
		fi
		for lib in '/System/Library' '/Library' '~/Library'; do
			pane="$lib/PreferencePanes/$1.prefPane"
			if [[ -e $pane ]]; then
				open "$pane"
				return 0
			fi
		done
		echo "No preference pane named “$1” found"
		return 2
	}
fi

alias sre="screen -xr"
alias l='ls -l'
alias la='ls -lA'
alias ..='cd ..'

# cl -- change to and list the contents of a directory. Arguments 2-n are passed to ls.
function cl { cd $1; shift; ls $@; }

# mkcd -- create and change to a directory
function mkcd {
	if [ $# -ne 1 ]; then 
		echo "usage: mkcd directory_name"
	elif [ -d "${1}" ]; then
		echo "(directory already existed)"
		cd "$1"
	elif [ -e "${1}" ]; then
		echo "file exists"
	else
		mkdir "${1}" && cd "${1}"
	fi
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
