About git-hooks
=======

A tool to manage project, user, and global Git hooks for multiple git repositories.

It allows hooks to be installed inside git repositories, users home directory, and globally.  
When a hook is called by `git`, git-hooks will check each of these locations for the hooks to run.


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

After instalation add the `%USERPROFILE%\.git_hooks` folder to the PATH.


Uninstall 
=======

**Linux:** execute the `uninstall.sh` script and remove the instalation folder from the PATH inside the `~/.bash_profile` file.

**Windows:** execute the `win_uninstall.bat` script and remove the instalation folder from the PATH.


Usage
=======

**Linux:**

Run `git-hooks --install` in a git project tell it to use git-hooks hooks.

You can run `git-hooks --uninstall` at any time to revert to your previous hooks.  (These are usually the default hooks, which do nothing.)

Run `git-hooks --installglobal` to force any new git repository or any git repository you clone to have a reminder to install git hooks. (It can't be on by default for security reasons.)

**Windows:**

Same as above, except you have to run everything with 'git-hooks.sh' instead of 'git-hooks'.


Overview
========

Hooks are powerful and useful.  Some common hooks include:

- Verify that the commit message has a certain length.
- Spell check the commit message.
- Verify that the code builds.
- Verify that any new files contain a copyright with the current year in it.

Hooks can be very project-specific such as:

- Verify that the project still builds
- Verify that autotests matching the modified files still pass with no errors.
- Pre-populate the commit message with a "standard" format.
- Verify that any new code follows a "standard" coding style.

Or very person-specific hooks, such as:

- Don't allow a `push` to a remote repository after 1AM, in case I break something and will be asleep.
- Don't allow a commit between 9-5 for projects in `~/personal/`, as I shouldn't be working on them during work hours.

For more details about the different hooks available to you, check out:

	   http://www.kernel.org/pub/software/scm/git/docs/githooks.html



Locations
=========

git-hooks provide a way to manage and share your hooks using three locations:

 - **User hooks**, installed in `~/.git_hooks/`
 - **Project hooks**, installed in `.git/git_hooks/` in a project.
 - **Global hooks**, specified with the `hooks.global` configuration option.

To add a folder to the Global hooks configuration use the following command:

	   git config --global hooks.global $PWD/contrib/

You can even specify _multiple_ directories for your global hooks! Simply separate each path with spaces.


Creating hooks
==============

To keep things organized, git-hooks looks for scripts in **sub-directories** named after the git hook name.  For example, the commit-msg hook scripts may be located in the following folder:

	   ~/.git_hooks/commit-msg

When `git hooks` is run without arguments, it lists all hooks installed on your system.  It will run the hooks with the `--about` argument to generate the description shown.  

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
