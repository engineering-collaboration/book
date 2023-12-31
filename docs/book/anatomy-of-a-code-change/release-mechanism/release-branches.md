# Release branches

The first and foremost thing to note here is that when talking about release branches in TBD, we are NOT talking about a single permanent release branch as seen in other git workflows.

```
What's the problem with a single dedicated release branch?
```

If tags cannot satisfy the complex workflows we have for our release, we use the more powerful reference type in git of branches. Why would we want to do this?

- We know our release will be a LTS and will require multiple secluded commits
- Our distill process is complex and will require multiple automated commits

Noisy branches, we will need to implement some filtering when viewing branches.

What is important?

There should never be changes in a release branch that is not in main
commits on release branches are only bug fixes, not features, never bump the major or minor version on a release branch
If storage permits it, archive release branches into separate repos after release cycles

Release branches make the process more complex and more likely to introduce regression bugs.

Long term support versions of app, argument to be made to move to seperate repository.

 The head of the version specific release branch is the latest published patch of that minor version.
