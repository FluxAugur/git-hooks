#!/bin/bash
#
# An example hook script to check the commit log message.
# Called by "git commit" with one argument, the name of the file
# that has the commit message.  The hook should exit with non-zero
# status after issuing an appropriate message if it wants to stop the
# commit.  The hook is allowed to edit the commit message file.
#
# To enable this hook, rename this file to "commit-msg".

# Uncomment the below to add a Signed-off-by line to the message.
# Doing this in a hook is a bad idea in general, but the prepare-commit-msg
# hook is more suited to it.
#
# SOB=$(git var GIT_AUTHOR_IDENT | sed -n 's/^\(.*>\).*$/Signed-off-by: \1/p')
# grep -qs "^$SOB" "$1" || echo "$SOB" >> "$1"

# This example catches duplicate Signed-off-by lines.

function check_commit_length
{
    declare -r message_limit=25
    message_file=$1
    message=$(<$message_file)
    size=${#message}
    echo $status
    if [ "$size" -lt "$message_limit" ]
    then
      echo "Error error error .... "
      echo "Commit message is shorter than the default limit $message_limit"
      echo "Commit message:"
      echo "$message"
      echo ""
      echo "Have a nice day!"
      exit 1
    fi
}


case "${1}" in
    --about )
        echo -n "Checks if a commit has a length of at least 25 characters."
        ;;
    * )
        check_commit_length "$@"
        ;;
esac
