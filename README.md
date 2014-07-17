About git-hooks
=======

A tool to manage global git hooks for multiple git repositories.


Install (Linux)
=======

To install from a local copy execute the `local_install.sh` script.

To install directly from the github repo, execute the following commands:

```
wget https://raw.githubusercontent.com/SDW-CC/git-hooks/master/remote_install.sh
chmod +x remote_install.sh
./remote_install.sh

```


Install (Windows)
=======

To install from a local copy execute the `win_local_install.bat` script.

To install directly from the github repo, execute the following commands:

```
powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/SDW-CC/git-hooks/master/win_remote_install.bat', 'win_remote_install.bat') }"
win_remote_install.bat

```

After instalation add the `%USERPROFILE%\.githook` folder to the PATH.


Uninstall 
=======

**Linux:** execute the `uninstall.sh` script and remove the instalation folder from the PATH inside the `~/.bash_profile` file.

**Windows:** execute the `win_uninstall.bat` script and remove the instalation folder from the PATH.


Usage
=======

**Linux:**

Run `githook add` in a git project tell it to use git-hooks hooks.

You can run `githook remove` at any time to revert to your previous hooks.  (These are usually the default hooks, which do nothing.)

Run `githook add-global` to force any new git repository or any git repository you clone to use git-hooks hooks.

Run `githook remove-global` to force any new git repository or any git repository you clone to use the default hooks.

**Windows:**

Same as above, except you have to run everything with `githook.sh` instead of `githook`.


Creating hooks
==============

To keep things organized, git-hooks looks for scripts in **sub-directories** named after the git hook name.  For example, the commit-msg hook scripts may be located in the following folder:

**Linux**: `~/.githook/commit-msg`

**Windows** `%USERPROFILE%\.githook\commit-msg`

When `githook` is run without arguments, it lists all hooks installed on your system.  It will run the hooks with the `--about` argument to generate the description shown.  

When creating hooks please use the following template:

```
#!/bin/bash

function <insert function name here>
{
    <insert function body here>
}


case "${1}" in
    --about )
        echo -n "<add a description for your hook script>"
        ;;
    * )
        <call your function here> "$@"
        ;;
esac

```
