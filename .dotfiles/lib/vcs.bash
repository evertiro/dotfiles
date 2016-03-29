# SETUP GIT PROFILE
if [[ ! -z ${GIT_USER} && ! -z ${GIT_EMAIL} ]]; then
    which git &>/dev/null
    if [[ ${?} == '0' ]]; then
        git config --global user.name ${GIT_USER}
        git config --global user.email ${GIT_EMAIL}
    fi
fi

# SETUP BZR PROFILE
if [[ ! -z ${BZR_WHOAMI} && ! -z ${BZR_USER} ]]; then
    which bzr &>/dev/null
    if [[ ${?} == '0' ]]; then
        bzr whoami ${BZR_WHOAMI}
        bzr launchpad-login ${BZR_USER}
    fi
fi
