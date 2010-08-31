export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/Developer/Tools:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=Cxfxcxdxbxcedeabagacad
# Omit commands beginning with a space from command history. Useful for command lines with passwords.
export HISTIGNORE=" *"
# When including this from a box-specific .bash_profile, set PROMPT_COLOR and ORNAMENT_COLOR at will
export PS1="\[\e[${PROMPT_COLOR:-47;1;30}m\]\u@\h [\W] \!\[\e[${ORNAMENT_COLOR:-0;32}m\]$\[\e[0m\] "

# YOUR ENJOYMENT MAY VARY
# When scanning through command history, show only command lines which began with the already-typed characters.
# This may taste better in your .inputrc file, just remove `bind` and the single quotes
bind '"\[A": history-sarch-backward'
bind '"\e[B": history-search-forward'

# Application-specific aliases
if [[ -e /Applications/TextMate.app ]]; then
	export VISUAL="mate -w"
	alias m="mate ."
fi
# Mac-specific aliases
if command -v sw_vers >/dev/null && [[ `sw_vers -productName` == "Mac OS X" ]]; then
	alias openports='sudo lsof -i -P | grep -i "listen"'
	alias o='open .'
fi

alias sre="screen -xr"
alias l='ls -l'
alias la='ls -la'
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
		rmdir `"pwd"`
		cd ..
	else
		echo "not empty"
	fi
}
