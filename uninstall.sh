#!/bin/bash

echo "Before removing githook from your system make syre to run: 'githook remove' on all your repos"
echo "This can also be done manually. The backup hooks folder is called hooks.old and can be found in the .git folder in your repos"
read -p "Do you really wish to remove githook? " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf ~/.githook
    echo "githook was removed from your system"
    echo "Please proceed to remove the '~/.githook' folder from the PATH by editing the '~/.bahs_profile' file"
else
    echo "Uninstall aborted!"
fi
