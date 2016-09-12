export LC_CTYPE=ru_RU.UTF-8
export LANG=ru_RU.UTF-8

source ~/.bashrc
source ~/.files/git-prompt.sh

# export PS1=$'\\[\e[36m\\]\W\\[\e[0m\\] \\[\e[32m\\]\xe2\x86\x92\\[\e[0m\\] '
# export SUDO_PS1=$'\\[\e[36m\\]\W\\[\e[0m\\] \\[\e[31m\\]\xe2\x86\x92\\[\e[0m\\] '

export PROMPT_COMMAND='__git_ps1 "\w\\[\e[32m\\]" "\\[\e[0m\\] \$ "'
export PROMPT_DIRTRIM=3
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# bash autocomplete must ignore any *.deps.js
export FIGNORE='.deps.js'

# export JAVA_HOME="$(/usr/libexec/java_home)"

# To use curl-ca-bundle certificates with OpenSSL
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# For node.js: to have npm-installed binaries picked up
# export PATH="/usr/local/share/npm/bin:$PATH"
# Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Homebrew
export PATH="/usr/local/bin:$PATH"

alias ls="ls -Ghtr"
alias ll="ls -lA"

alias svn="colorsvn"

