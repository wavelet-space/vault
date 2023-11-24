#!/bin/sh

# https://help.github.com/articles/changing-author-info/


git filter-branch -f --env-filter '
OLD_NAME="David Landa"
OLD_EMAIL="david.landa@#####"
CORRECT_NAME="David Landa"
CORRECT_EMAIL="david.landa@protonmail.com>"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    echo OK
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags