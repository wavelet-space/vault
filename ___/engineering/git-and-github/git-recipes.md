# Git Recipes

### Rename branch

    git branch

### Delete branch

ignore merge

    git branch -d <branch>
    git branch -D <branch>

### Switch branch ignore changes

ignore changes (2.23+)

    git switch -f main

keep changes

    git stash push            # branch1
    git checkout <branch2>    # branch2
    # work on branch2
    git checkout <branch1>
    git stash pop


- https://stackoverflow.com/questions/1304626/git-switch-branch-and-ignore-any-changes-without-committing


## Push & Pull

## Merge conflicts