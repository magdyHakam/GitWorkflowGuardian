# Git Merge Command Checker

## Description
A Bash script that enhances safety in Git workflows by restricting `git merge` commands for specific branches to certain directories. It prevents accidental merges into `dev` or `stg` branches unless you're on a branch that starts with `dev-` or `stg-`, and you're working within specified directories.

## Why Use It?
- **Branch Safety**: Ensures that merges into `dev` or `stg` branches are made only from the respective `dev-` or `stg-` branches.
- **Directory Specific**: Limits the execution of these merge commands to specified directories, adding an extra layer of safety.
- **Error Minimization**: Reduces the risk of unintended merges, which is crucial for large projects or teams.

## Prerequisites
- Bash shell
- Git installed

## Installation
1. Clone the repository: `git clone https://github.com/yourusername/git-merge-command-checker.git`
2. Navigate to the cloned directory: `cd git-merge-command-checker`
3. Run the installation script: `./setup_command_check.sh`

## Configuration
1. Create a file named `allowed_dirs.txt` in your home directory (`~/allowed_dirs.txt`).
2. Add the absolute paths of the directories where you want the script to be active, one per line.
   Example:
`/path/to/your/project1
/path/to/your/project2`
3. The script will read this file and only activate the merge checks in these directories.

## How It Works
The script adds a function to your `.bashrc` or `.bash_profile` that:
- Checks each `git merge` command.
- Verifies if the command is attempting to merge `dev` or `stg`.
- Checks if the current working directory is listed in `~/allowed_dirs.txt`.
- If the conditions are met, and you are on the correct branch, it allows the merge. Otherwise, it displays a warning and prevents the merge.

## Contributions
Your contributions are welcome! Feel free to fork the repository, make changes, and submit pull requests. For any suggestions or feedback, please open an issue in the repository.

## License
[MIT License](LICENSE)