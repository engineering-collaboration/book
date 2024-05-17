---
title: Artifact management
description: How we manage a cornucopia of interdependent artifacts before, during, and after our build process.
---

# Artifact management

Building a release produces a cornucopia of interdependent artifacts for us to manage. Depending on our product, a single release may build:

- An executable binary across operating systems
- A static or dynamic library
- A container image
- Resource definitions for infrastructure deployment
- Static documentation
- Interactive documentation
- Test doubles for medium and large-scale tests
- Licenses, signings, certifications

We distribute builds to our customers and ensure all artifacts reference their relevant data. If our engineers struggle to find the appropriate documentation of the version they are working with, we severely hamper development velocity.

<!-- TODO: detail distribution practices for the different kinds of artifacts -->

## Upstream Dependencies

It is neither achievable, advisable, nor affordable to build every facet of our software internally. When our software reaches medium complexity, our build relies on both internal and external dependencies. By building upon existing solutions, we focus our efforts on solving problems for our customers. The "Not Invented Here Syndrome" is a decision-making error where we tend to value our own ideas above those conceived by people outside of our group.

Our software includes packages of third-party development kits, open-source solutions, and licensed products. We call these packages *upstream dependencies*. When introducing upstream dependencies, our team scrutinizes them for their licensing, security, and availability.

### Licensing

Inadvertently introducing unfavorable licenses into our software exposes us to legal obligations that severely affect our product. Popular copyleft licenses prohibit commercial use of derivative work or mandate the publication of the source code under the same license. Having to divulge the source code of our product due to an accidental licensing issue puts our organization in an uncomfortable position.

That being said, a recent rise of high-quality open-source software distributed under the MIT and Apache 2.0 license accelerates the development of private commercial products. To take advantage of existing solutions without relying on the legal expertise of our engineers, we build tools to verify imports and dependencies into our codebase. We do this before every release at a minimum or add it to our static analysis on pre-merge.

### Security

Consuming unvetted upstream dependencies provides an exploit pathway for supply chain attacks. Third-party code and binaries may introduce vulnerabilities into our software due to human error, heterogeneous systems, or malicious intentions. This issue has developed such an exposure that modern development tools offer solutions for detecting vulnerabilities out of the box. At a minimum, we use those tools.

Over the last half decade, an effort towards a standardized format has been made. Mirroring traditional supply chain management, the [software bill of materials (SBOM)](https://www.ntia.gov/page/software-bill-materials) has emerged as a key building block in software security and software supply chain risk management. When distributing our software, we list the various components and dependencies within our product and system.

### Availability

Relying on the internet for our dependencies means that somebody else owns the availability and consistency of our builds. For projects in early phases, we embrace the trade-off to reduce the overhead of managing our build and development infrastructure. Contrarily, mature projects rely on consistent quality and regularity achieved by owning our software's dependencies.

We create a hermetic environment with our dependent packages, libraries, and SDKs and make it available within our organization. Automated tools scan for security vulnerabilities and version updates of our third-party artifacts. Our engineers verify, download, and share updated versions of dependencies under their discretion.

Sometimes we discover a bug in an open-source project or find room for improvement in the current implementation. If appropriate, we instantiate a fork of the project in our organization's environment. A fork of a repository is a duplication of the source code with metadata references to the original project. We fix our issue internally and point our dependencies at our new internal solution. In the spirit of the open-source community, we share our work with the original project using the contribution guidelines.

We balance the rate of adoption of version updates to our dependencies. Accepting the latest release of each package increases our risk of introducing incompatible changes, while delaying adoption exposes us to security vulnerabilities and rising technical debt. Too much time between version bumps complicates the process of consolidating the new dependency version with our software and makes upstream fixes difficult.

## Build and Test dependencies

Owning our software dependencies is the first step of assuring consistent artifact quality and velocity. The next one is owning our build environment. When creating our binaries, we rely on certain tools and environments to be available. If our process runs install scripts and `apt-get` is down, we will not be able to create a release.

We rely on the homogeneity and isolation of our build procedures. Meaning, any previous action does not influence our current build process. Using containerization technology, we are able to create hermetic build environments offering the required tools. Once we are able to provide self-hosted hermetic environments, we tackle the issue of build time performance and resource optimization. For example, monolithic software designs seldom require a full rebuild and benefit from shared compilation caches.

## Infrastructure as Code (IaC)

Our software artifacts run on hardware. A truism worth noting since the latter influences the former. When dedicated personnel manually sets up hardware, a combination of CLI commands, scripts, and tools creates the final environment. The steps and their order only known to the person providing the hardware - even they will forget it.

IaC eliminates the above case by deterministically defining the hardware environment. At setup and during runtime. Configuration drift can be due to manual changes, software updates or errors, or entropy. Regularly check the desired configuration against its actual configuration and self-correct inconsistencies. Recreate server from scratch from the IaC recipe. desired state management

The "code" part of IaC is not limited to having and checking hardware definitions. But expanding our existing toolset to cover hardware needs. We version the IaC configs. Hard reference to the state of the source code. We can spin up the project and be certain of capabilities and operability. Audits. All versions can be restored to any time we would need it from the past

Use code integration process for hardware definition. We create feature branches, run tests, static analysis, and review changes.

## Semantic Versioning

<!-- vale Vale.Avoid = NO -->
<!-- vale write-good.Weasel = NO -->
<!-- you -->
<!-- likely -->
!!! quote "[semver.org](https://semver.org/)"
    *In the world of software management there exists a dreaded place called “dependency hell.” The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.*
<!-- vale write-good.Weasel = YES -->
<!-- vale Vale.Avoid = YES -->

Dependency management is a complex computational conundrum. The number of permutations of compatibilities present in modern-day software architectures makes automated technological approaches opaque and unreliable.

To move the burden of identifying version dependencies from technological tools to sociocultural supervision, we tag our releases following a pattern standardized as semantic versioning. With the titular practice, we infer the impact of changes from the structure of the release version `major.minor.patch`, e.g., `v1.23.45`.

- We increment the `major` version when we make incompatible API changes.
- We increment the `minor` version when we add functionality in a backward-compatible manner.
- We increment the `patch` version when we make backward-compatible bug fixes.

Semantic versioning is a best effort solution to dependency management. The practice includes flaws, and we accompany version bumps of our upstream dependencies with testing and security inspection. Assuming that releases are labeled accurately in the first place, Hyrum's law states that every public-facing behavior of an implementation will be relied upon, including incidental actions. Patch releases to our dependencies may not be compatible with our current system if they coincidentally modify non-deterministic data layouts or execution time.

Nevertheless, it's one of the better systems we have, and we would be foolhardy not to follow it.

## Change lists

As we shift the responsibility of dependency management from technological analysis to sociotechnical responsibility, we communicate changes in a human-readable way. Thus, every release is accompanied by a change list (or changelog), a text file describing the work done for the release, typically containing bullet points of new features and fixed bugs.

The practices of trunk-based development make automatic generation of change lists trivial. At release, we concatenate the titles and descriptions of our pull requests.
