if [[ -n $BASH_VERSION ]]; then

	function print_exit_status {
		local code="$?"
		[[ $code -ne 0 ]] && echo -en "\033[31m$code \033[00m"
	}
	PROMPT_COMMAND=print_exit_status

elif [[ -n $ZSH_VERSION ]]; then

	PROMPT=$'%(?..\e[0;31m%?\e[0;0m )'"$PROMPT"

fi
