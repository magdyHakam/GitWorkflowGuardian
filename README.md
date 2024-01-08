# Git Command Checker

This repository contains a script (`setup_command_check.sh`) that enhances the safety of Git operations in bash by preventing certain commands from being executed unless specific conditions are met.

## Prerequisites
- Bash shell
- Git installed

## Installation
1. Clone this repository: `git clone [URL]`
2. Navigate to the cloned directory: `cd git-command-checker`
3. Make the script executable: `chmod +x setup_command_check.sh`
4. Run the script: `./setup_command_check.sh`

## How it Works
The script appends a function to your `.bashrc` file that checks each command before execution. If the command is `git merge dev` and the current branch does not start with `dev-`, it will abort and display a warning.

## Contributing
Feel free to fork this repository and submit pull requests or open issues for suggestions and improvements.
