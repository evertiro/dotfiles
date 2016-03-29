alias ls='ls --group-directories-first --color=auto -h'
alias reload='source ~/.bash_profile'

# DEBIAN SPECIFIC
if which apt-get &>/dev/null; then
    alias apt-get='sudo apt-get'
fi
