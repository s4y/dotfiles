# "This ain't JayvaScript!" / "It won't compile!" / "I'm scared!" #

This, my friends, is my common `.bash_profile`. It's a fun and friendly set of aliases, functions, and default options for your command line. You can add it to your home directory as `.bash_profile`, bur I'd suggest including it from your existing `.bash_profile` in a way that'll give you more freedom:

    export SOURCECACHE=~/src
    if [[ -f ${SOURCECACHE}/sidniciousrc/bash_profile ]]; then
    	. ${SOURCECACHE}/sidniciousrc/bash_profile
    fi

Setting that `SOURCECACHE` variable to the location of your source code also unlocks the `sc` feature of sidniciousrc, described below.

# What do I get? #

- Helpful aliases including `sre` (resume last `screen` session), `l` (`ls -l`), `la` (`ls -la`), and `..` (`cd ..`)!
- Mac-specific aliases like `openports` (show yer open ports) and `o` (open the working directory in the Finder)!
- *bonus!* The TextMate-specific alias `m` (open the working directory as a TextMate project)!
- Color output is enabled by default for most commands!
- Command lines starting with a space are *omitted from your command history* for those super-secret tasks!
- The up and down arrow keys now *search* your command history for commands starting with the characters you've already typed! `^R` without all the hassle!
- A simple, per-machine-colorizable prompt (optionally set `PROMPT_COLOR` and `ORNAMENT_COLOR` in the parent `.bash_profile`)!
- The `sc` function to quickly jump to the source code directory of *any of your projects*!
- The `cl` function, to change to and list the contents of a directory *in one step*!
- And two *surprise functions* available to only those of you who read the darn thing!

Comments, complaints, and additions are welcome!