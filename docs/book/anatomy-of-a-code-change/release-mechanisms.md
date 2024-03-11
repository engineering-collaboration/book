# Release Mechanisms

Unlike other git workflows you might have come across, TBD does not encourage a permanent single release branch (There are however a form of release branches that we will talk about). As every merge into the `trunk` branch aims to be stable, we should theoretically be able to release at any commit from the trunk branch.

In practice, this is not desirable for every project, especially customer facing suites. For internal services it is not uncommon to have multiple releases per day.

Regardless of your release schedule, theoretically you want to be able to release at any time. This is the core goal that TBD and CI/CD works towards.

While your product team may favour monthly releases, this setup will enable you to do so. Move away from yearly releases.

## Who releases?

Releases should be done by code owners.
Add a way to circumvent the above rule for hotfixes

## The release process

Regardless of our release mechanism, we want to make sure to cover the processes.

### Release candidate

For large and complex services, environments or deployment pipelines it can be beneficial to distinguish between release candidates and releases.

Release candidates allow you to run testing processes or distiliining processes delayed or in parallel or batches. A successful release candidate workflow then triggers an actual release workflow.

Smaller workflows will likely find more success by just failing a release workflow.

### Large-scoped tests

All tests must pass in order for a release to be successful and signed.

This is typically when we want to execute the Large-Scoped Tests, as these tend to be time intensive.

# Tags

The most common way to mark and trigger releases is to tag a commit on the `trunk` branch with a certain format. Typically this is `v0.0.0` or `r0.0.0` and `rc0.0.0` for release candidates. Naturally, the format can be whatever makes most sense for our product or department.

This is the most straight forward way to implement a release workflow and all major VCS platforms come equipped with the tooling to listen to tags on certain branches.


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

# Live at `HEAD`

Live at head is the holy grail of TBD and CI/CD. The closer we can get to this, the more flexible and agile our entire company is.

This is difficult. Our testing and deployment strategies have to be solid. Even if Live-at-head is done manually with release tags, this is what we are aiming for when implementing TBD and CI/CD.

A green head is deployed and used


### Hotfix the previous release

It may occur that a certain release may receive some bug reports which cannot wait until the next version or cycle. In these cases the bugfix needs to be committed to the release branch in order to create a new version.

As we do not want to maintain multiple differing versions it is imperative to fix these bugs for the current development cycle. We do this as usual by creating a development branch, fixing the bug, submitting a merge request and merging our development branch back to main/master. One additional step is to **cherry pick** the changes of the bugfix to the release branch.

This may sometimes need some investigation as the bug may not be reproducible on the main/master branch. It will sometimes not be avoidable to do actual work on the release branch. Should this be the case verify that the fix makes it to main/master to avoid future regressions.

# Fix outdated releases

We try and avoid working on release branches. Before attempting any changes on outdated versions make sure that:

* The issue is not fixed in a later version
* The issue is fixed in a later version, but production vehemently argues against updating

There are two strategies on how to work on an outdated release branch.

## Cherry pick

It may be the case that our main branch and the maintained release branch have diverged significantly. In case that a reported bug is not reproducible on the main branch, check if a fix to the reported behavior was committed since the release branching. Should a fix have been committed, attempt to cherry pick the changes into the release branch.

## Branch from release

If no fix has been found the foremost priority is to get production unstuck by fixing the issue on the maintained version currently used by production. Create a branch from release and follow the typical integration steps to merge your fix back into release.

When fixing bugs for a maintained release version be certain that these changes are either redundant for the main branch, or applied to the main branch.
