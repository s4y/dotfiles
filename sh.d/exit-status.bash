if [[ -n $BASH_VERSION ]]; then

    PS1='$(code=$?; [[ $code != 0 ]] && echo "\[\e[31m\]$code \[\e[00m\]")'"$PS1"

elif [[ -n $ZSH_VERSION ]]; then

	PROMPT=$'%(?..%{\e[0;31m%}%?%{\e[0;0m%} )'"$PROMPT"

fi
