[[ -z $BASH_VERSION ]] && return # Only supports bash

# Back and forward commands for cd

BACK_DIRS=()
FORWARD_DIRS=()
function cd {
	local dir="$PWD"
	if builtin cd "$@"; then
		BACK_DIRS=( "$dir" "${BACK_DIRS[@]}" )
		FORWARD_DIRS=()
	else
		return $?
	fi
}
function b(){
	if [[ ${#BACK_DIRS[@]} > 0 ]]; then
		local dir="$PWD"
		if builtin cd "${BACK_DIRS[0]}"; then
			BACK_DIRS=("${BACK_DIRS[@]:1}")
			FORWARD_DIRS=( "$dir" "${FORWARD_DIRS[@]}" )
			builtin dirs +0
		else
			return $?
		fi
	else
		echo "$FUNCNAME: nowhere to go" >&2
		return 1
	fi
}
function f(){
	if [[ ${#FORWARD_DIRS[@]} > 0 ]]; then
		local dir="$PWD"
		if builtin cd "${FORWARD_DIRS[0]}"; then
			BACK_DIRS=( "$dir" "${BACK_DIRS[@]}")
			FORWARD_DIRS=("${FORWARD_DIRS[@]:1}")
			builtin dirs +0
		else
			return $?
		fi
	else
		echo "$FUNCNAME: nowhere to go" >&2
		return 1
	fi
}

HISTIGNORE="b:f:$HISTIGNORE"
