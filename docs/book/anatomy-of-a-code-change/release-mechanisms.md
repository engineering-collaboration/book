# Release Mechanisms

We identified requirements, planned and implemented our changes, integrated our work into our software and passed all tests thrown at our software thus far. Time has come to showcase our team's prowess to the public.

Building our product with the practices detailed in this book, we are able to release our software hassle-free at any time. The decision of when to release depends on business and product factors, not technological limits.

Internal services not uncommonly deploy multiple releases per day. As autonomous vertical teams we create and deploy releases of our software without dependencies and handoffs to other teams.

## Release candidate

When we have decided on releasing the current state of our software, we flag it as a release candidate. In an ideal world, the release candidate is promoted to the published release without any further changes. In reality, further modifications are necessary; either to fix unwanted behavior, or to distill additional information for distribution.

We subject our release candidate to the pre-release testing suite we established in our [Testing Strategy](./testing/testing-strategy.md), ranging from static analysis, small-, medium-, and large-scoped tests, benchmark tests, and manual tests to verify the quality of our release. A passing release candidate paired with positive manual reports green-lights our release process of the candidate automatically, or informs our team to manually perform the release of our approved software changes.

The release procedure packages and signs our binary build, writes the changelog, compiles the up-to-date documentation, and uploads all created artifacts to our distribution platform.

## Releasing via tags

Within trunk-based development (TBD) release candidates are most commonly referenced via tags to the commit on our main branch. A Git tag following a standardized pattern (e.g. `rc*.*.*`) kicks off our testing suite for our release version (e.g. `rc1.23.4`). Verified candidates mark the same commit for release with a release tag `v1.23.4`.

Unsuccessful release candidates require additional changes and we follow our TBD practices of creating a development branch to work on a patch, create a pull request, merge our changes and flag the resulting commit as a new release candidate `rc1.23.5`.

Release procedures typically generate meta information related to our release. Data bundled into our distributed binary is treated as ephemeral and deposed of after the process has completed, but we serialize lasting data and add it to our source code via automated pull requests. 

Naturally, the tag patterns used in this chapter are subject to change as they follow the needs of our organizations release strategy.

## Releasing via branches

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

## Live at `HEAD`

Live at head is the holy grail of TBD and CI/CD. The closer we can get to this, the more flexible and agile our entire company is.

This is difficult. Our testing and deployment strategies have to be solid. Even if Live-at-head is done manually with release tags, this is what we are aiming for when implementing TBD and CI/CD.

A green head is deployed and used


## Hotfix the previous release

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
