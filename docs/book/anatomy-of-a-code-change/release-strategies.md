# Release Strategies

The nomenclature between the individual steps of delivering software varies across our industry. For the sake of this book we define the terms and the chronology as follows:

- **Release**: A release builds and packages our software via the Release Mechanisms discussed in the previous chapter. The entire release process arches across pre-release testing, deployment, and delivery.
- **Deployment**: We define deployment as a subprocess of the release proceedings. Once a release candidate passed our automated testing suite, we deploy it for manual testing or to a staging environment. After verifying the intended improvements and a ensuring a lack of regressions, we promote the deployment to a deliverable.
- **Delivery**: Clearing the deployment criteria, we launch our delivery automation system to distribute our built and tested artifacts. At the end of our delivery, our released changes have replaced the previous distributed implementation.

The above cycle completes a CI/CD automation system. For a continuous improvement culture we monitor and observe our deliveries in production and include actionable feedback for the next cycle. Critically, we avoid siloing our development teams from operations and monitoring. Our feature developers rely on production usage metrics to make good decisions.

Not all industries and software organizations follow the above distinction. Depending on deliverable scope, intended target audience, or distributed artifacts the steps above may be skipped, merged, altered, or extended. Using the above nomenclature as a baseline, we build a release pipeline modelled after our needs.

## Artifact management

Building a release produces a cornucopia of artifacts for various distributions, all of which related to each other and are administered together. Depending on our product single release may build:

- An executable binary
- A static or dynamic library
- A container image
- Resource definitions for IaC
- Static Documentation
- Interactive Documentation
- Test doubles for medium and large scale tests
- Licenses, signings, certifications

The above list showcases interdependency between artifacts of a release. The artifacts reference hard versions of each other and are useless if not found or drift. Our storage reference hard versions of the release artifacts and are available separately. Documentation of a specific version is available.

## Dependency Management

Besides self-dependent artifacts, our build relies on vertical or down-stream dependencies. Dependency management is complex and a problem not solved to date.

Dependency management has become somewhat of a complex computational conundrum. Increasing intricacy of software products and platforms

Dependencies are hard
Communicate to tools what changed

### Semantic Versioning

!!! quote "[semver.org](https://semver.org/)"
    *In the world of software management there exists a dreaded place called “dependency hell.” The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.*

To move the burden of identifying version dependencies from technological tools to sociocultural supervision, we tag our releases following a pattern standardized as semantic versioning. With the titular practice we infer the impact of changes from the structure of the release version `major.minor.patch`, e.g. `v1.23.45`.

- We increment the `major` version, when we make incompatible API changes.
- We increment the `minor` version, when we add functionality in a backward compatible manner.
- We increment the `patch` version, when we make backward compatible bug fixes.

Semantic versioning is a best effort solution to dependency management. The practice includes flaws and we accompany version bumps of our upstream dependencies with testing and security introspections. Assuming that releases are labeled correctly in the first place, Hyrum's law states that every public-facing behavior of a implementation will be relied upon, including incidental actions. Patch releases to our dependencies may be not compatible with our current system, if they coincidentally modify non-deterministic data layouts or execution time.

Nevertheless, it's one of the better systems we currently have and we would be foolhardy not to follow it.

### Downstream Dependencies

SBOMS
Relying on the internet for our dependencies means that somebody else owns the availability and consistency of our builds.


## Changelists

It is a good idea to
Communicate to humans what changed


## Deployment strategies

  - Blue-green deployment
  - Tech streams
  - Alpha Beta releases

## Delivery strategies

As Netflix no longer delivers packaged DVDs to our mailbox, we have moved beyond the era of "down for maintenance". No dedicated release personnel handles physical leavers and switches to provide our update to the customers.

  - Canary releases
  - parallell run
  - rolling upgrades
  - feature toggles
  - zero-downtime


automation
feedback

how often
what time
demographic
geographic

Generally reduce lead time.

If you have releases every week, it matters less if an engineer misses a deadline. The feature is shipped the week after.


