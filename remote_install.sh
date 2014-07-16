#!/bin/bash

#create the .git_hooks folder in the user's home, downloads the git-hooks script and makes it executable
cd ~
mkdir .git_hooks
cd .git_hooks
wget https://raw.githubusercontent.com/SDW-CC/git-hooks/master/git-hooks
chmod +x git-hooks

#creates the commit-msg folder and downloads the commit-msg hook script
mkdir commit-msg
cd commit-msg
wget https://raw.githubusercontent.com/SDW-CC/git-hooks/master/git_hooks/commit-msg/25characterlimit.sh
chmod +x 25characterlimit.sh

echo 'export PATH=PATH:~/.git_hooks' >> ~/.bash_profile

#usage instructions
echo "git-hooks was successfully installed"
echo "use 'git-hooks --install' in a git repo to activate it"
