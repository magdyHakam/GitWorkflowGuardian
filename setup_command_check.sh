#!/bin/bash

# Define the function to add to .bashrc or .bash_profile
read -r -d '' COMMAND_CHECK_FUNCTION << 'EOF'
function check_git_command() {
    if [[ $1 == git\ merge\ dev* ]]; then
        current_branch=\$(git rev-parse --abbrev-ref HEAD)
        if [[ \$current_branch != dev-* ]]; then
            echo "Warning: You are not on a 'dev-' branch."
            return 1
        fi
    elif [[ $1 == git\ merge\ stg* ]]; then
        current_branch=\$(git rev-parse --abbrev-ref HEAD)
        if [[ \$current_branch != stg-* ]]; then
            echo "Warning: You are not on a 'stg-' branch."
            return 1
        fi
    fi
    eval \$@
}
trap 'check_git_command \$BASH_COMMAND' DEBUG
EOF

# Append the function to .bashrc or .bash_profile
echo "$COMMAND_CHECK_FUNCTION" >> ~/.bashrc

# Reload .bashrc or .bash_profile
source ~/.bashrc

echo "Setup complete. The command check is now active."
