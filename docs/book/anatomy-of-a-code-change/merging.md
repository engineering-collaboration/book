# Merging

Merging is a little different between VCS solutions. This chapter does include git commands.

A merge is a command that combines two or more branches into one. It takes the changes from the specified branch (called the "source" branch) and applies them to the current branch (called the "destination" branch). Git Merge creates a new commit that represents the merged state of both branches. This is the most common way to merge branches in Git.

There are multiple ways of transferring changes from one branch to another in git. In this chapter we will go over those strategies and cover the scenarios in which they are useful and what to look out for.

## Linear history

When merging changes into software, we ensure a linear history of our project. The parent commit of our development branch is the latest commit on main. A linear history sequentially chronicles the evolution of our software and streamlines future reactionary development.

Sometimes we introduce unexpected breaking changes. A non-linear history makes it extremely difficult to identify and immediately roll back the offending commit. If left unattended, a non-linear history breaches the point of illegibility and emerges as being utterly useless. Future bug fixes and tracking changes over a period time devolve into frustratingly hair-pulling endeavors.

## Rebase

We sprouted our development branch off the latest commit of main when sowing the seeds our work. Chances are, while developing our feature, our colleagues integrated their tasks into the main branch, thus cultivating a merge of our botanical offshoot into a non-linear history in the trunk branch.

In order to rectify our entanglement we rebase our work on the latest commit on main, fix occurring merge conflicts, and integrate our changes after successfully passing our automated test suite. A rebase precedes any merge into our main branch.

!!! note
    When rebasing a branch we create new commits on our local machine that do no longer mirror the state of our remote repository. We either force push (with-lease) our changes, overriding the state of the remote repository or create a new branch from the head of our development branch and rebase and push that one; abandoning our development branch.

## Squash and merge

Squashing an arbitrary amount of consecutive commits combines and replaces those changes into a single commit. By consolidating work-in-progress commits or bilaterally annulling commits we reduce noise in our project history.

Most source control platforms offer the option of a server side *Squash and Merge* approach when integrating changes of a completed pull request (PR). The procedure squashes all commits of our development branch and appends our changes to the main branch as a single commit.

For short-lived development branches focusing on fixing or adding a single responsibility, the development steps are less important than the changes themselves and the commits may be squashed and merged. Complex issues are documented as inline comments or within the PR description.

With an hypothetical average of ten commits per development branch; by squashing, we reduce the growth of commits over time from 10,000 commits to 1,000 commits.

## Merge commit

On occasion, the complexity of achieving a tasks or the volume of changes across multiple files requires chronological cataloging for transparency. Merge commits allow us to preserve the development commits we created within the repository without clobbering the main branch.

The particular branching view of a merge commit allows us to either ignore the development commits when analyzing the main branch via `git log` or `git bisect`, or step into them if we are interested in the history of the changes.

As advanced users of version control tools we may follow the practices outlined within [this GitHub blog article](https://github.blog/2022-06-30-write-better-commits-build-better-projects/) about structuring a story of our commits before merging via merge commit.

## Cherry picking

The act of cherry picking commits cannot in good conscience be described as a merge. It is however, an additional way of transferring select commits between branches. The command `git cherry-pick` allows us to append an existing commit to our current `HEAD`.

Optionally, cherry picking applies the contents of a commit to our current workspace, rather than appending a commit itself. This permits us to edit the content or revert unwanted modifications bundled within the cherry-picked change before creating a new commit in our development branch.

## Resolving conflicts

Rebasing our feature branch prompts us more often than than merge commit. Worth it for linear history.

If Git is able to automatically merge the changes without any conflicts, it will create a new commit that represents the merged state of both branches. This commit will have two parent commits: one from the master branch and one from the feature-branch.

If there are conflicts between the changes in the two branches, Git will pause the merge process and ask you to resolve the conflicts manually. You can do this by opening the files with conflicts, editing them to resolve the conflicts, and then running git add on the changed files to stage them for commit. Once you have resolved all conflicts, you can run git commit to create the merge commit and complete the merge.
