# Oh  My Zsh {{{

if [ -d $HOME/.oh-my-zsh ]; then
    export ZSH=$HOME/.oh-my-zsh

    ZSH_THEME="omega-minimal"
    ENABLE_CORRECTION="true"

    plugins=(
	catimg
        colorize
	cp
	git
	npm
	sudo
	systemd
	tmux
    )

    source $ZSH/oh-my-zsh.sh
fi

# Oh My Zsh }}}

# Exports {{{

unsetopt correct_all
export EDITOR='vim'
export VISUAL='vim'
[ -z $SSH_TTY ] && export BROWSER=chromium || BROWSER=lynx

# Exports }}}

# Setup ssh-agent/keychain {{{

if [ -f $HOME/.ssh/id_rsa ]; then
    eval `ssh-agent`
    if which keychain &>/dev/null; then
	keychain -Q -q $HOME/.ssh/id_rsa
	[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
    fi
fi

# Setup ssh-agent/keychain }}}

# Setup vcs info {{{

# Setup git config
if which git &>/dev/null; then
    git config --global user.name "Evertiro"
    git config --global user.email "dgriffiths@evertiro.com"
fi

# Setup bzr config
if which bzr &>/dev/null; then
    bzr whoami "Daniel J Griffiths <dgriffiths@section214.com>"
    bzr launchpad-login dgriffiths
fi

# Setup vcs info }}}

# Handler for xclip {{{

if which xclip &>/dev/null; then
    alias xcopy='xclip -sel clip'
fi

# Handler for xclip }}}

# Aliases {{{

if which vim &>/dev/null; then
    alias vi="vim"
fi

if [ -f $HOME/.zshrc ]; then
    alias reload="source $HOME/.zshrc"
fi

alias ..="cd .."
alias ...="cd ../.."
alias back="cd $OLDPWD"
alias grep="grep -n --color=auto"
alias psearch="ps aux | grep"
alias ssh="ssh -A"
alias sudo="sudo "

case ${OSTYPE} in
    darwin*)
	alias ls="ls -Gh"
	;;
    *)
	alias ls="ls --group-directories-first --color=auto -h"
	;;
esac

# Aliases }}}

# Arch specific {{{

if which pacman &>/dev/null; then
    if which yaourt &>/dev/null; then
	alias pacman="yaourt"
    else
	alias pacman="sudo pacman"
    fi
fi

# Arch specific }}}

# Debian specific {{{

if which apt &>/dev/null; then
    alias apt="sudo apt"
    alias apt-get="sudo apt-get"

    # Setup Ubuntu packaging tools
    export DEBFULLNAME="Daniel J Griffiths"
    export DEBEMAIL="dgriffiths@section214.com"
fi

# Debian specific }}}
