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

Projects with a high number of contributors or a lengthy release process benefit moving from releasing via tags to releasing via branches. However, when talking of release branches we do not propose a single long living release branch to merge into. After clearing our test suite, every candidate spawns an individual branch to reference the commit on main we plan to distribute.

Isolating our release branch from our main branch steadies developer velocity and change integration to our software for the small overhead of introducing an additional conceptual branch model. We detach feature development from finishing our deployment evaluation and distill our software distribution free of irrelevant noise.

The steadily growing number of release branches reduces legibility of the project unless a filtering mechanism screens these when listing repository branches. Besides verbosity, an pervasive display of multiple release branches institutes a mindset of long-term support for each version and fragments our workforce and deliveries. We aim to consolidate all consumers to the latest version of our product. No change is exclusive to a release branch and not available in our main branch.

## Live at `HEAD`

Live at head represents the holy grail of TBD and CI/CD. Every integration to our main branch passing our test suites is built and deployed. This deployment strategy both requires and strengthens the integration and testing discipline of our team. Knowing that our CI/CD processes publishes our integrations immediately, puts the stability of the product to the forefront of our mind when working on changes.

Live at head only succeeds with robust and continuously improving automation suites for testing, analysis, documentation, and contract verification between teams. While the approach is not sensible for all types of software products, the technical ability to achieve the state guarantees our competence to react to market demands as feasibly as possible.

## Hotfixes

The world is messy and does not follow "good practices". as engineers we enable our teams, not discipline them on using deprecated items; there's time in the post mortem for it. Sometimes things are on fire, and need to be put out with what is at hand, not wait for the fire department to wield the massive truck through a busy city centre.

The engineer on call must be able to build and release, override processes set in place.

It may occur that a certain release may receive some bug reports which cannot wait until the next version or cycle. In these cases the bugfix needs to be committed to the release branch in order to create a new version.

As we do not want to maintain multiple differing versions it is imperative to fix these bugs for the current development cycle. We do this as usual by creating a development branch, fixing the bug, submitting a merge request and merging our development branch back to main/master. One additional step is to **cherry pick** the changes of the bugfix to the release branch.

This may sometimes need some investigation as the bug may not be reproducible on the main/master branch. It will sometimes not be avoidable to do actual work on the release branch. Should this be the case verify that the fix makes it to main/master to avoid future regressions.

# Fix outdated releases

We always make production changes this way, starting in master; that’s because how the code gets into production is as important as the code that ultimately gets there. If we were to hotfix production directly, we might accidentally forget to bring a change back to master for the next release. But by bringing changes into master first, we ensure that we never have regressions in production.

We try and avoid working on release branches. Before attempting any changes on outdated versions make sure that:

* The issue is not fixed in a later version
* The issue is fixed in a later version, but production vehemently argues against updating

There are two strategies on how to work on an outdated release branch.

## Cherry pick

It may be the case that our main branch and the maintained release branch have diverged significantly. In case that a reported bug is not reproducible on the main branch, check if a fix to the reported behavior was committed since the release branching. Should a fix have been committed, attempt to cherry pick the changes into the release branch.

## Branch from release

If no fix has been found the foremost priority is to get production unstuck by fixing the issue on the maintained version currently used by production. Create a branch from release and follow the typical integration steps to merge your fix back into release.

When fixing bugs for a maintained release version be certain that these changes are either redundant for the main branch, or applied to the main branch.
