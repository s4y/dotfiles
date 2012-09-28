DOTFILES=`dirname "${BASH_SOURCE[0]}"`

export PATH="$DOTFILES"/bin:~/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=Cxfxcxdxbxcedeabagacad
export EDITOR=vim
# Omit commands beginning with a space from command history. Useful for command lines with passwords.
export HISTIGNORE=" *"
# When including this from a box-specific .bash_profile, set PROMPT_COLOR and ORNAMENT_COLOR at will
export PS1="\[\e[${PROMPT_COLOR:-47;1;30}m\]\u@\h [\W] \!\[\e[${ORNAMENT_COLOR:-0;32}m\]$\[\e[0m\] "

set -o vi

# Application-specific aliases
alias g=git
if [[ -e /Applications/TextMate.app ]]; then
	alias m="mate ."
fi
# Mac-specific aliases
if command -v sw_vers >/dev/null && [[ `sw_vers -productName` == "Mac OS X" ]]; then
	alias openports='sudo lsof -i -P | grep -i "listen"'
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

# sc -- Jump to a project in your neighborhood source cache (usually ~/src/). SOURCECACHE must be set.
#   sc          # change directories to the root of the source cache
#   sc project  # change directories to `project`. If `project` does not exist, equivalent to `sc` (with an error)
if [[ $SOURCECACHE ]]; then
	function sc {
		if [[ -n $1 ]]; then
			if [[ -d "${SOURCECACHE}/${1}" ]]; then
				cd "${SOURCECACHE}/${1}"
			else
				cd ${SOURCECACHE}
				echo -e "${1}: Not found" 1>&2
			fi
		else
			cd ${SOURCECACHE}
		fi
	}
fi

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
	if (shopt -s nullglob dotglob; f=(*); ((! ${#f[@]}))); then
		# directory is empty
		rmdir "`pwd`"
		cd ..
	else
		echo "not empty"
	fi
}

for file in "$DOTFILES"/bash.d/*; do
	builtin source $file
done
