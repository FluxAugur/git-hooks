#git-hooks

A tool to manage project, user, and global Git hooks for multiple git repositories.

git-hooks lets hooks be installed inside git repositories, users home directory, and globally.  When a hook is called by git, git-hooks will check each of these locations for the hooks to run.

************************************
##Install

Add git-hooks to your PATH environment variable so 'git hooks' can be run. In `~/.bashrc` ( for example ):  

    # Load Git-hook
    export PATH=$PATH:/opt/git-hooks

This assume you have installed git-hooks in /opt folder.

Run 'git hooks --install' Inside a git project to change that projects git hooks to use git-hooks hooks.  'git hooks --uninstall' can be run at any time to go back to the old hooks that were installed before (typically the default which does nothing).

************************************
##Overview

Hooks can be very powerful and useful. Some common hooks include:

- Spell check the commit message.
- Check that the code builds.
- Verify that any new files contain a copyright with the current year in it.

Hooks can be very project specific such as:

- Verify that the project still builds
- Verify that autotests matching the modified files still pass with no errors.
- Pre-populate the commit message with the 'standard' format.
- Verify that any new code follows the 'standard' coding style.

or very specific to one person such as:

- Don't allow a push to a remote repository after 1am in case I break something and will be asleep.
- Don't let me commit between 9-5 for projects in ~/personal/ as I shouldn't be working on them during work hours.

For more details on the different Git hooks that can be installed checkout the online documentation at http://www.kernel.org/pub/software/scm/git/docs/githooks.html

************************************
##Locations

git-hooks provide a way to manage and share your hooks by allowing for the installation of hooks in three locations:

- User hooks that are installed in ~/.git_hooks/
- Project hooks that are installed in the .githooks directory inside of each project.
- Global hooks that are specified with the hooks.global configuration option.
     The contrib directory includes a number of useful hooks and can be set by doing the following:  
     `git config --global hooks.global {git-hooks folder}/contrib/`  
   Global hooks can be also specified 'per project' ( this options will override the global one ):  
     `git config hooks.global {git-hooks folder}/contrib/`

Multiple global hooks directories can be specified by using a space between each path.

************************************
##Creating hooks

To keep things organized git-hooks looks for scripts in sub directories named after the git hook name.  For example this project has the following pre-commit script in the following location:

git_hooks/pre-commit/bsd

When you run `git hooks list` it will list all of the hooks installed on the system.  It will run the hooks with the --about argument to generate the description that is shown.  Checkout the hooks in contrib for some examples.

************************************
##Enabling / Disabling hooks

Sometimes could be great to just have some hooks enabled, while others are not useful. To reach this I've included two new function: `--enable` and `--disable` ( see `git hooks -h` for more ). This functions can be used to enable or disable specific hook scripts.
Example:  
    
    $ git hooks list
    Git hooks ARE installed in this repository.

    Listing User, Project, and Global hooks:
    ---
    /home/$USER/.git_hooks:

    /home/$USER/code/git/project/.githooks:
     E  post-checkout/db-import - Import the database linked to the specified branch
     E  post-commit/db-dump - Dump the database after each commit

Now this 2 hooks are enabled ( notice the 'E' at the beginning of the line ). Now I can disable one of them using:  
    
    $ git hooks -d db-import

This will make git hooks search in the hooks folders a hook with name 'db-import' and disable it ( this means simply a chmod -x on the file ).
Now this is wath you get:  
    
    $ git hooks list
    Git hooks ARE installed in this repository.

    Listing User, Project, and Global hooks:
    ---
    /home/$USER/.git_hooks:

    /home/$USER/code/git/project/.githooks:
      D post-checkout/db-import - Import the database linked to the specified branch
     E  post-commit/db-dump - Dump the database after each commit

You can also disable ALL HOOKS with a single command:  
    
    $ git hooks -d

To enable a hook use `git hooks -e [HOOK NAME]`, or to enable ALL HOOKS use `git hooks -e`.