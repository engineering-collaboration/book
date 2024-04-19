# Artifact management

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


## Upstream Dependencies

It is neither achievable, advisable, nor affordable to build every facet of our software internally. When our software reaches medium complexity, our build relies on both internal and external dependencies. By building upon dependencies, we focus our efforts on solving problems for our customers. The "Not Invented Here Syndrome" is a decision-making error where we tend to value our own ideas above those conceived by people outside of our group.

Our software includes packages of third-party development kits, open-source solutions, and licensed products. We call these up-stream dependencies. Our teams scrutinize our up-stream dependencies for their licensing, security, and availability.

### Licensing

Inadvertently introducing unfavorable licenses into our software exposes us to legal obligations that severely affect our product. Popular copyleft licenses prohibit commercial use of derivative work or mandate the publication of the source code under the same license. That being said, a recent rise of high-quality open-source software distributed under MIT and Apache 2.0 license accelerates our development of private commercial products.

In order to take advantage of existing solutions, without relying on the legal expertise of our engineers, we build tools to verify imports and dependencies into our codebase. We do this before every release at a minimum, or add it to our static analysis on pre-merge.

### Security

Consuming unvetted upstream dependencies provides an exploit pathway for supply chain attacks. Third-party code and binaries may introduce vulnerabilities into our software due to human error, heterogeneous systems, or malicious intentions.

[SBOMS](https://www.ntia.gov/page/software-bill-materials)
dependency bot
codacy, npm vulnerabilities


On top of manual due diligence, we employ technology and automation to verify the security and authorized usage of our dependencies.

### Availability

Relying on the internet for our dependencies means that somebody else owns the availability and consistency of our builds.
fixing errors, features
down stream maintenance

## Semantic Versioning

!!! quote "[semver.org](https://semver.org/)"
    *In the world of software management there exists a dreaded place called “dependency hell.” The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.*

Dependency management is a complex computational conundrum. The amount of permutations of compatibilities present in modern day software architectures makes automated technological approaches opaque and unreliable.

To move the burden of identifying version dependencies from technological tools to sociocultural supervision, we tag our releases following a pattern standardized as semantic versioning. With the titular practice, we infer the impact of changes from the structure of the release version `major.minor.patch`, e.g. `v1.23.45`.

- We increment the `major` version, when we make incompatible API changes.
- We increment the `minor` version, when we add functionality in a backward compatible manner.
- We increment the `patch` version, when we make backward compatible bug fixes.

Semantic versioning is a best effort solution to dependency management. The practice includes flaws and we accompany version bumps of our upstream dependencies with testing and security introspections. Assuming that releases are labeled correctly in the first place, Hyrum's law states that every public-facing behavior of a implementation will be relied upon, including incidental actions. Patch releases to our dependencies may be not compatible with our current system, if they coincidentally modify non-deterministic data layouts or execution time.

Nevertheless, it's one of the better systems we currently have and we would be foolhardy not to follow it.

## Build and Test dependencies

Hermetic environments. Caching. Pinned versions of build software.

The same for the environment of our build machines, if our hermetic environment runs install scripts and `apt-get` is down, we will not be able to build and release.

## Changelists

Communicate to humans what changed
