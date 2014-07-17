#!/bin/bash

#creates the .git_hooks folder in the user's home
mkdir ~/.githook

#copies the githook script and make it executable
cp githook ~/.githook
chmod +x ~/.githook/githook

#copies the uninstall script and make it executable
cp uninstall.sh ~/.githook
chmod +x ~/.githook/uninstall.sh

#copies the readme and licence scripts
cp README.md ~/.githook
cp LICENSE ~/.githook

#creates the commit-msg folder
mkdir ~/.githook/commit-msg

#copies the commit-msg hook script and make it executable
cp hooks/commit-msg/25characterlimit.sh ~/.githook/commit-msg
chmod +x ~/.githook/commit-msg/25characterlimit.sh

#adds the .git-hooks file to the path and makes sure it is loaded
echo "export PATH=\$PATH:~/.githook" >> ~/.bash_profile
