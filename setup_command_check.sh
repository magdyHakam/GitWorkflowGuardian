#!/bin/bash

# Function definition to be added to .bashrc or .bash_profile
COMMAND_CHECK_FUNCTION=$(cat << 'EOF'
git_merge_check() {
    # Read allowed directories from an external file into an array
    IFS=$'\n' read -d '' -r -a allowed_dirs < ~/allowed_dirs.txt

    # Get the current working directory
    local current_dir=$(pwd)

    # Check if the current directory is in the list of allowed directories
    local is_allowed_dir=0
    for dir in "${allowed_dirs[@]}"; do
        if [[ $current_dir == $dir* ]]; then
            is_allowed_dir=1
            break
        fi
    done

    # Only proceed if in an allowed directory
    if [[ $is_allowed_dir -eq 1 ]]; then
        local branch_prefix=${1:0:3}
        local current_branch=$(git rev-parse --abbrev-ref HEAD)

        if [[ $current_branch != $branch_prefix-* ]]; then
            echo -e "\033[1;31mWarning: git merge $branch_prefix can only be run from a branch starting with '$branch_prefix-'.\033[0m"
        else
            command git merge "$@"
        fi
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
