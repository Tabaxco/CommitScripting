# Commit Script
A simple Bash script to help automate staging, committing, and pushing changes to a Git repository with default values and user-friendly prompts.
## Features
* Prompt for the target directory (defaults to current directory).
* List all files in the directory for reference.
* Prompt for files to commit (defaults to all files).
* Prompt for a commit message (uses a default message if none is provided).
* Automates git add, git commit, and git push.
## Usage
**1.** Make sure the script is usable:
```
chmod +x commitscripting.sh
```
**2.** Run the script:
```
./commitscripting.sh
```
**3.** Follow the prompts:
* Enter the path to your repository (press Enter to use the current directory).
* Enter files to commit (press Enter to commit all).
* Enter a commit message (press Enter to use the default).
The script will stage, commit, and push your changes automatically.
## Usage
```
Enter the desired path: /home/user/my-repo
Chosen path: /home/user/my-repo

Files:
file1.txt  file2.txt  script.sh
Files to commit: file1.txt file2.txt
Staging: file1.txt file2.txt

Write your commit message: Added initial scripts
Message: Added initial scripts
```
## Notes
* **Make sure** you have **Git installed** and **configured with a remote repository**.
* If you press Enter without typing a commit message, the script will use the default message.
* Designed for **single-user workflows** — be **careful** when working with shared branches.
