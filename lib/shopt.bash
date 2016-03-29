# SETUP SANE DEFAULTS
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob

set -o noclobber

[[ -t 0 ]] && stty -ctlecho
