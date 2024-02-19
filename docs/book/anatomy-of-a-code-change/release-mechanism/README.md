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
