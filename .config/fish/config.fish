set -g -x fish_greeting ''

set -gx LANG "ru_RU.UTF-8"
set -gx EDITOR "vim"
set -gx BROWSER "open -a firefox"

# Python
set -gx PYTHONDONTWRITEBYTECODE true
set -gx PYTHONPATH /usr/local/lib/python2.7/site-packages

# Java
set -gx JAVA_HOME (/usr/libexec/java_home)

# Android
set -gx ANDROID_HOME /usr/local/opt/android-sdk

# rbenv
# set -gx PATH $HOME/.rbenv/bin $PATH
# set -gx PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1

# Homebrew
set -gx PATH /usr/local/bin $PATH

# Heroku Toolbelt
# set -gx PATH /usr/local/heroku/bin $PATH

# alias
function svn
    colorsvn $argv
end

