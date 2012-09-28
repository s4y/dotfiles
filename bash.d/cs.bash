# Jump to projects in your source directory (e.g. ~/src/). $SRC_DIR must be set.
if [[ $SRC_DIR ]]; then
    function cs { cd "$SRC_DIR/$1"; }
    function __complete_cs {
        COMPREPLY=( $(cd "$SRC_DIR" ; compgen -o dirnames -- "${COMP_WORDS[COMP_CWORD]}") );
    }
    complete -F __complete_cs cs
fi
