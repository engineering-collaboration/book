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