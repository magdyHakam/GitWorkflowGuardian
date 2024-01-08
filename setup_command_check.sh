#!/bin/bash

# Function definition to be added to .bashrc or .bash_profile
COMMAND_CHECK_FUNCTION=$(cat << 'EOF'
git_merge_check() {
    local branch_prefix=${1:0:3}
    local current_branch=$(git rev-parse --abbrev-ref HEAD)

    if [[ $current_branch != $branch_prefix-* ]]; then
        echo "Warning: git merge $branch_prefix can only be run from a branch starting with '$branch_prefix-'."
    else
        command git merge "$@"
    fi
}

git() {
    if [[ $1 == "merge" && ($2 == "dev" || $2 == "stg") ]]; then
        git_merge_check "$2"
    else
        command git "$@"
    fi
}

EOF
)

# Append the function to .bashrc or .bash_profile
echo "$COMMAND_CHECK_FUNCTION" >> ~/.bashrc

# Reload .bashrc or .bash_profile
source ~/.bashrc

echo "Setup complete. The command check is now active."
