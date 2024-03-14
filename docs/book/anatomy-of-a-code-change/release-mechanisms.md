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

Live at head represents the holy grail of TBD and CI/CD. Every integration to our main branch passing our test suites is built and deployed. This deployment strategy both requires and strengthens the integration and testing discipline of our team. Knowing that our CI/CD processes publishes our integrations on merge leads to a focus on product stability when working on changes.

Live at head <!-- write-good.Weasel = NO -->only<!-- vale write-good.Weasel = YES --> succeeds with robust and continuously improving automation suites for testing, analysis, documentation, and contract verification between teams. While the approach is not sensible for all types of software products, the technical ability to achieve the state guarantees our competence to react to market demands as feasibly as possible.

## Hotfixes

It has been our experience that we sometimes produce illicit behavior in our software. Despite all our good intentions, competent code review, and a plethora of automated tests, we do and will continue to introduce errors into our workings. Predominantly low-impact issues we address serenely for our next planned release.

Other times, production is on fire and serenity nowhere to be found. In the spirit of cooperation we are awoken at 3 a.m. and informed of a surplus of errors originating from our software. After a brief introduction to the problem we concur the findings.

Our immediate task demands to have production running again. If production consumes our software as a dependency initial success might be found in altering the dependent version; either roll-back to a functioning state, or, if consuming an outdated version and the error has been fixed since then, bumping the offending dependency. When rolling back and rolling back over is not an option, it is time to rub the sleep out of our eyes and get to work.

### Fixing a current release

An oversight, or ambiguous requirement caught up with us in the end. We follow the same procedure as any bug fix, spawn a development branch from latest main, eliminate the error, add a test to avoid a reappearance, create a PR, pass the test suite, **SKIP** a possible pre-merge code review, integrate our changes, and hit the release button.

### Fixing an outdated release

Our costumer depends on a year-old version and makes heavy use of deprecated functionality. The risk of updating to a newer release is deemed as significant and uncomfortable. The reasoning of ignored deprecation warnings until launch day at 3 a.m. is unclear and we discreetly write down the need for a future post-mortem.

We locate the commit dating back to the release on our main branch and, if we're not working with release branches, create a new branch for our fix. As our first action, we examine our changelogs whether the reported error has been resolved in our software since the time of the release. Should we find this to be the case, we replicate the fix to our newly created outdated release branch. Preferably by cherry-picking the remedying commit, otherwise by copying the solution manually.

We might find that over the course of our latest releases, we, in fact, have not tackled our vexatious issue. In which case, we get to work as we would with any change and create a development branch from the latest commit on main. Even if the current request relates to an outdated release, we patch the issue on our main branch first before cherry-picking the resolution to the outdated release branch. This way we ensure the problem does not reappear as a future regression.

### Overriding protections

During crises we are responsible to support and enable our colleagues and clients and require the full trust and privileges within our team to solve the problems at hand. Should immediate action be in opposition to everyday processes, we are authorized and able to override these with no slumbering peers picking up the phone.
