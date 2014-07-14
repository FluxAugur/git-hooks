#!/bin/bash

#creates the .git_hooks folder in the user's home
mkdir ~/.git_hooks

#copies the git-hooks script and make it executable
cp git-hooks ~/.git_hooks
chmod +x ~/.git_hooks/git-hooks

#copies the uninstall script and make it executable
cp uninstall.sh ~/.git_hooks
chmod +x ~/.git_hooks/uninstall.sh

#copies the readme and licence scripts
cp README.md ~/.git_hooks
cp LICENSE ~/.git_hooks

#creates the commit-msg folder
mkdir ~/.git_hooks/commit-msg

#copies the commit-msg hook script and make it executable
cp git_hooks/commit-msg/25characterlimit.sh ~/.git_hooks/commit-msg
chmod +x ~/.git_hooks/commit-msg 25characterlimit.sh

#adds the .git-hooks file to the path and makes sure it is loaded
echo "export PATH=PATH:~/.git_hooks" >> ~/.bash_profile
export PATH=$PATH:~/.git_hooks

#usage instructions
echo "git-hooks was successfully installed"
echo "use 'git-hooks --install' in a git repo to activate it"