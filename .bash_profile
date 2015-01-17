export LANG="ru_RU.UTF-8"

export PS1=$'\\[\e[36m\\]\W\\[\e[0m\\] \\[\e[32m\\]\xe2\x86\x92\\[\e[0m\\] '
export SUDO_PS1=$'\\[\e[36m\\]\W\\[\e[0m\\] \\[\e[31m\\]\xe2\x86\x92\\[\e[0m\\] '

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export JAVA_HOME="$(/usr/libexec/java_home)"

# To use curl-ca-bundle certificates with OpenSSL:
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# For node.js: to have npm-installed binaries picked up
export PATH="/usr/local/share/npm/bin:$PATH"
# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ls="ls -Ghtr"
alias ll="ls -lA"

