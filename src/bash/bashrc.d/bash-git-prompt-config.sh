#!/usr/bin/env bash
# ~/.bashrc.d/bash-git-prompt-config.sh

# shellcheck disable=2034



# BASH-GIT-PROMPT CONFIGURATION
# - source: https://github.com/magicmonty/bash-git-prompt

#if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
#source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
#fi


if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
# Set config variables first
   GIT_PROMPT_ONLY_IN_REPO=1
    # - avoid fetching remote status
# GIT_PROMPT_FETCH_REMOTE_STATUS=0
    # - avoid searching for changed files in submodules
# GIT_PROMPT_IGNORE_SUBMODULES=1
    # - avoid setting virtual environment infos for node/python/conda environments
# GIT_PROMPT_WITH_VIRTUAL_ENV=0
    # show upstream tracking branch

# GIT_PROMPT_SHOW_UPSTREAM=1
# GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # = can be no, normal or all; determines counting of untracked files
# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # - avoid printing the number of changed files
# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # - support Git older than 1.7.10
# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
#source ~/.bash-git-prompt/gitprompt.sh
source /usr/local/opt/bash-git-prompt/share/gitprompt.sh
fi

