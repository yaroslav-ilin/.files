set -g -x fish_greeting ''

set LANG "ru_RU.UTF-8"
# set CLICOLOR 1
# set LSCOLORS "GxFxCxDxBxegedabagaced"
set BROWSER "open -a firefox"

# Python
set -gx PYTHONDONTWRITEBYTECODE true
set -gx PYTHONPATH /usr/local/lib/python2.7/site-packages

# Android
set -gx ANDROID_HOME /usr/local/opt/android-sdk

# For node.js: to have npm-installed binaries picked up
set -gx PATH /usr/local/share/npm/bin $PATH

# Heroku Toolbelt
set -gx PATH /usr/local/heroku/bin $PATH

# rbenv
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Homebrew
set -gx PATH /usr/local/bin $PATH

