# Merging

A merge is a command that combines two or more branches into one. It takes the changes from the specified branch (called the "source" branch) and applies them to the current branch (called the "destination" branch). Git Merge creates a new commit that represents the merged state of both branches. This is the most common way to merge branches in Git.

There are multiple ways of transfering changes from one branch to another in git. In this chapter we will go over those strategies and cover the scenarios in which they are useful and what to look out for.

## Resolving conflicts

If Git is able to automatically merge the changes without any conflicts, it will create a new commit that represents the merged state of both branches. This commit will have two parent commits: one from the master branch and one from the feature-branch.

If there are conflicts between the changes in the two branches, Git will pause the merge process and ask you to resolve the conflicts manually. You can do this by opening the files with conflicts, editing them to resolve the conflicts, and then running git add on the changed files to stage them for commit. Once you have resolved all conflicts, you can run git commit to create the merge commit and complete the merge.

## linear history

## rebase

# Rebase

The ideal approach when working with source control is to have managable pieces of changes which are coherent and able to build. After branching out of your trunk
Rebasing a branch rewrites the history of those commits on the rebase destination.

It is generally a good idea to rebase your development branch before merging it to main, regardless of your merging strategy. The idea is to have feature changes grouped by merges. 

## Rebase and merge

This strategy moves all the commits of your development branch into the main branch. The resulting git history displays all commits as if they were made on the main branch in the first place.

## Force push

Feel free to force push your dev branch.

NEVER force push main unless you are absolutely sure what you are doing. Typically you need CODEOWNER privileges to be able to push to main in the first place.

## squash

# Squash

A squash command combines the commits 


## merge commit

Advanced users of version control tools may follow the practices outlined within [this GitHub](https://github.blog/2022-06-30-write-better-commits-build-better-projects/) blog article about structuring a story of your commits before merging via merge commit.

## cherry pick


# Summary

It is very likely that you want to rebase regardless of your merging strategy

- Rebase branch and integrate
- Rebase branch and merge commit
- Rebase branch, squash branch and integrate