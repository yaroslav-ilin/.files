# improve some default behaviors
alias cp='cp -iv'
alias mv='mv -iv' 
alias mkdir='mkdir -pv'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias lr='ls -RF | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias ll='ls -FAltrh'

cd() { builtin cd "$@"; ls -1Fcr; }

alias tmux="tmux attach || tmux new"
alias svn="colorsvn"

alias rm-DS_Store='find . -name *.DS_Store -type f -delete'

alias grep-js='grep -rn --exclude-dir=.svn --exclude-dir=examples --exclude-dir="*.i18n" --color=auto --include="*.js"'
alias grep-css='grep -rn --exclude-dir=.svn --exclude-dir=examples --color=auto --include="*.css" --include="*.less"'

# -----
# macOS
# -----

alias upgrade="sudo softwareupdate -i -a && brew update && brew upgrade"

#   cdf:  'cd' to frontmost window of macOS Finder
#   -----------------------------------------------
cdf () {
    currFolderPath=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath"
}

# ------
# Ubuntu
# ------

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

