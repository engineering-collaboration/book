# Merging

A merge is a command that combines two or more branches into one. It takes the changes from the specified branch (called the "source" branch) and applies them to the current branch (called the "destination" branch). Git Merge creates a new commit that represents the merged state of both branches. This is the most common way to merge branches in Git.

There are multiple ways of transfering changes from one branch to another in git. In this chapter we will go over those strategies and cover the scenarios in which they are useful and what to look out for.

## Resolving conflicts

If Git is able to automatically merge the changes without any conflicts, it will create a new commit that represents the merged state of both branches. This commit will have two parent commits: one from the master branch and one from the feature-branch.

If there are conflicts between the changes in the two branches, Git will pause the merge process and ask you to resolve the conflicts manually. You can do this by opening the files with conflicts, editing them to resolve the conflicts, and then running git add on the changed files to stage them for commit. Once you have resolved all conflicts, you can run git commit to create the merge commit and complete the merge.
