===========
 git-hooks
===========


----------------------------------------------------------------------------------
A tool to manage project, user, and global Git hooks for multiple git repositories
----------------------------------------------------------------------------------

SYNOPSIS
========

    git hooks

DESCRIPTION
===========

git-hooks lets hooks be installed inside git repositories, users home directory, and globally.  When a hook is called by git, git-hooks will check each of these locations for the hooks to run.

OVERVIEW
========

Hooks can be very powerful and useful.  Some common hooks include:
 * Spell check the commit message.
 * Check that the code builds.
 * Verify that any new files contain a copyright with the current year in it.

Hooks can be very project specific such as:
 * Verify that the project still builds
 * Verify that autotests matching the modified files still pass with no errors.
 * Pre-populate the commit message with the 'standard' format.
 * Verify that any new code follows the 'standard' coding style.

or very specific to one person such as:

 * Don't allow a push to a remote repository after 1am in case I break something and will be asleep.
 * Don't let me commit between 9-5 for projects in ~/personal/ as I shouldn't be working on them during work hours.

For more details on the different Git hooks that can be installed checkout the online documentation at http://www.kernel.org/pub/software/scm/git/docs/githooks.html

LOCATIONS
=========

git-hooks provide a way to manage and share your hooks by allowing for the installation of hooks in three locations:
 * User hooks that are installed in ~/.githooks/
 * Project hooks that are installed in the .githooks directory inside of each project.
 * Global hooks that are specified with the hooks.global configuration option
   
   Multiple global hooks directories can be specified by using a space between each path.

The contrib directory includes a number of useful hooks and can be set by doing the following:
        > git config --global hooks.global $PWD/contrib/

CREATING HOOKS
==============

To keep things organized git-hooks looks for scripts in sub directories named after the git hook name.  For example this project has the following pre-commit script in the following location:

githooks/pre-commit/bsd

When you run 'git hooks' with no arguments it will list all of the hooks installed on the system.  It will run the hooks with the --about argument to generate the description that is shown.  Checkout the hooks in contrib for some examples.

OPTIONS
=======

--install       Replace existing hooks in this repository with a call to git hooks run [hook].  Move old hooks directory to hooks.old
--uninstall     Remove existing hooks in this repository and rename hooks.old back to hooks
--help, -h      Show help

SEE ALSO
========

 * http://www.kernel.org/pub/software/scm/git/docs/githooks.html
