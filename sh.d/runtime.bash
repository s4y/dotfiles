preexec () {
    if [[ -z $1 ]]; then
        unset LAST_START_TIME
        return
    fi
    LAST_START_TIME="`msuptime`";
}

precmd () {
    [[ -z $LAST_START_TIME ]] && return
    local runtime="$(($(msuptime)-$LAST_START_TIME))"
    if [[ $runtime -gt 100 ]]; then
        echo $'\e[94m'"$runtime"$'\e[0m'
    fi
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
