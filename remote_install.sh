#!/bin/bash

#create the .git_hooks folder in the user's home, downloads the git-hooks script and makes it executable
mkdir ~/.githook
wget -P ~/.githook https://raw.githubusercontent.com/sdwolf/git-hooks/master/githook
wget -P ~/.githook https://raw.githubusercontent.com/sdwolf/git-hooks/master/LICENSE
wget -P ~/.githook https://github.com/SDWolf/git-hooks/blob/master/README.md
chmod +x ~/.githook/githook

#creates the commit-msg folder and downloads the commit-msg hook script
mkdir ~/.githook/commit-msg
wget -P ~/.githook/commit-msg https://raw.githubusercontent.com/sdwolf/git-hooks/master/hooks/commit-msg/25characterlimit.sh
chmod +x ~/.githook/commit-msg/25characterlimit.sh

echo "export PATH=\$PATH:~/.githook" >> ~/.bash_profile
