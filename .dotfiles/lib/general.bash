# BASH/SUDO COMPLETION
if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
    which sudo &>/dev/null && complete -cf sudo
fi

# BASH 4 HAS ./** SUPPORT
[[ ${BASH_VERSINFO[0]} -ge 4 ]] && shopt -s globstar

# MAKE LESS MORE FRIENDLY
[[ -x /usr/local/bin/lesspipe.sh ]] && eval "$(lesspipe)"

# USE DIRCOLORS
[[ -x dircolors ]] && eval `dircolors -b`

# SETUP SSH-AGENT/KEYCHAIN
if [[ -f ${HOME}/.ssh/id_rsa ]]; then
    eval `ssh-agent`

    which keychain &>/dev/null
    if [[ ${?} == '0' ]]; then
      keychain -Q -q ${HOME}/.ssh/id_rsa
      [[ -f ${HOME}/.keychain/${HOSTNAME}-sh ]] && source ${HOME}/.keychain/${HOSTNAME}-sh
    fi
fi
