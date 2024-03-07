# Merging

A merge is a command that combines two or more branches into one. It takes the changes from the specified branch (called the "source" branch) and applies them to the current branch (called the "destination" branch). Git Merge creates a new commit that represents the merged state of both branches. This is the most common way to merge branches in Git.

There are multiple ways of transfering changes from one branch to another in git. In this chapter we will go over those strategies and cover the scenarios in which they are useful and what to look out for.

## Resolving conflicts

If Git is able to automatically merge the changes without any conflicts, it will create a new commit that represents the merged state of both branches. This commit will have two parent commits: one from the master branch and one from the feature-branch.

If there are conflicts between the changes in the two branches, Git will pause the merge process and ask you to resolve the conflicts manually. You can do this by opening the files with conflicts, editing them to resolve the conflicts, and then running git add on the changed files to stage them for commit. Once you have resolved all conflicts, you can run git commit to create the merge commit and complete the merge.

## Linear history

When merging changes into software, we ensure a linear history of our project. The parent commit of our development branch is the latest commit on main. A linear history sequentially chronicles the evolution of our software and streamlines future reactionary development.

Sometimes we introduce unexpected breaking changes. A non-linear history makes it extremely difficult to identify and immediately roll back the offending commit. If left unattended, a non-linear history breaches the point of illegibility and emerges as being utterly useless. Future bug fixes and tracking changes over a period time devolve into frustratingly hair-pulling endeavors.

## Rebase

We sprouted our development branch off the latest commit of main when sowing the seeds our work. Chances are, while developing our feature, our colleagues integrated their tasks into the main branch, thus cultivating a merge of our botanical offshoot into a non-linear history in the trunk branch.

In order to rectify our entanglement we rebase our work on the latest commit on main, fix occurring merge conflicts, and integrate our changes after successfully passing our automated test suite. A rebase precedes any merge into our main branch.

!!! note
    When rebasing a branch we create new commits on our local machine that do no longer mirror the state of our remote repository. We either force push (with-lease) our changes, overriding the state of the remote repository or create a new branch from the head of our development branch and rebase and push that one; abandoning our development branch.

# Squash and merge

A squash command combines the commits 

## Merge commit

Advanced users of version control tools may follow the practices outlined within [this GitHub](https://github.blog/2022-06-30-write-better-commits-build-better-projects/) blog article about structuring a story of your commits before merging via merge commit.

## cherry pick


# Summary

It is very likely that you want to rebase regardless of your merging strategy

- Rebase branch and integrate
- Rebase branch and merge commit
- Rebase branch, squash branch and integrate