# Set Prompt
if [[ `id -un` != root ]]; then
    PS1="[${GR}\u@\h${BL} \W${GR}\$(parse_git_branch)\$(git_dirty_flag)${NONE}]$ "
else
    PS1="[${GR}\u@\h${BL} \W${GR}\$(parse_git_branch)\$(git_dirty_flag)${NONE}]# "
fi
