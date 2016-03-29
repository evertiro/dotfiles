# GIT DIRTY FLAG FOR PROMPT
git_dirty_flag() {
    git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "*"}'
}

# PARSE GIT BRANCH FOR PROMPT
parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
