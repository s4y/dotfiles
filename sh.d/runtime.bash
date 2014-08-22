mstime () { echo "$(($(date +%s%N)/1000000))"; }

preexec () {
    if [[ -z $1 ]]; then
        unset LAST_START_TIME
        return
    fi
    LAST_START_TIME="`mstime`";
}

precmd () {
    [[ -z $LAST_START_TIME ]] && return
    echo
    echo -e "\e[90m$(($(mstime)-$LAST_START_TIME))\e[0m"
    unset LAST_START_TIME
}

PROMPT_COMMAND="precmd"

if [[ -n $BASH_VERSION ]]; then
    # http://superuser.com/a/175802/4096
    preexec_invoke_exec () {
        [ -n "$COMP_LINE" ] && return  # do nothing if completing
        [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return # don't cause a preexec for $PROMPT_COMMAND
        local this_command=`HISTTIMEFORMAT= history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//"`;
        preexec "$this_command"
    }
    trap 'preexec_invoke_exec' DEBUG
fi
