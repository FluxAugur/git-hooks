#!/bin/bash

#create the .git_hooks folder in the user's home, downloads the git-hooks script and makes it executable
cd ~
mkdir .git_hooks
cd .git_hooks
wget #download the script
chmod +x git-hooks

#creates the commit-msg folder and downloads the commit-msg hook script
mkdir commit-msg
cd commit-msg
wget #download the hook
chmod +x 25characterlimit.sh


echo "export PATH=PATH:~/.git_hooks" >> ~/.bash_profile
export PATH=$PATH:~/.git_hooks

