#!/bin/bash

echo "Before removing git-hooks from your system make syre to run: 'git-hooks --uninstall' on all your repos"
echo "This can also be done manually. The backup hooks folder is called hooks.old and can be found in the .git folder in your repos"
read -p "Do you really wish to remove git-hooks: " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf ~/.git_hooks
    echo "Git-hooks was removed from your system"
    echo "Please proceed to remove the ~/.git_hooks folder from the PATH by editing the ~/.bahs_profile file"
else
    echo "Uninstall aborted!"
fi
