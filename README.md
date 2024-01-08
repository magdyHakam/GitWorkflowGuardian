# Git Merge Command Checker

## What is it?
A simple yet powerful Bash script to enhance safety and accuracy in your Git workflow. This script intercepts `git merge` commands to ensure they're only executed when you're on the correct branch.

## Why Use It?
- **Branch Safety**: Prevents accidental merges into `dev` or `stg` branches unless you're on a branch that starts with `dev-` or `stg-`.
- **Error Minimization**: Reduces the risk of merging into the wrong branch, which can be crucial in large projects or teams.
- **Easy to Integrate**: Seamlessly fits into your existing Git workflow.

## How to Install?
1. Clone the repository: `git clone https://github.com/yourusername/git-merge-command-checker.git`
2. Navigate to the cloned directory: `cd git-merge-command-checker`
3. Run the installation script: `./setup_command_check.sh`

## How Does It Work?
The script adds a function and alias to your `.bashrc` or `.bash_profile` that checks each `git merge` command. If you try to merge `dev` or `stg` but your current branch doesn't start with the respective prefix, it stops the merge and displays a warning.

## Contributions
Feel free to clone, fork, or contribute to the repository. Any feedback or suggestions are highly appreciated!
