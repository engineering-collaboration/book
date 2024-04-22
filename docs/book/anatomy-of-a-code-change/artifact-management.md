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

Consuming unvetted upstream dependencies provides an exploit pathway for supply chain attacks. Third-party code and binaries may introduce vulnerabilities into our software due to human error, heterogeneous systems, or malicious intentions. This issue developed such an exposure that a lot of development tools offer solutions of detecting vulnerabilities out of the box. At a minimum, we use them.

Over the last years an effort towards a standardized format has been made. Mirroring traditional supply chain management, the [software bill of materials (SBOM)](https://www.ntia.gov/page/software-bill-materials) has emerged as a key building block in software security and software supply chain risk management. When distributing our software, we list the various components and dependencies within our product and system.

### Availability

Relying on the internet for our dependencies means that somebody else owns the availability and consistency of our builds. For projects in early phases, we embrace the trade-off to reduce the overhead of managing our build and development infrastructure. Contrarily, we ship mature project with a consistent quality and regularity achieved by owning our software's dependencies.

We create a hermetic environment with our dependent packages, libraries, and SDKs and make it available within our organization. Automated tools scan for security vulnerabilities and version updates of our third-party artifacts. Our engineers verify, download and share updated versions of dependencies under their discretion.

Sometimes we discover a bug in an open-source project, or find room for improvement in the current implementation. If appropriate, we instantiate a fork of the project in our organization's environment. A fork of a repository is a duplication of the source code with meta-data references to the original project. We fix our issue internally point our dependencies at our new internal solution. In the spirit of the open source community, we share our work with the original project using the contribution guidelines.

We balance the rate of adoption of version updates to our dependencies. Accepting the latest release of each package increases our risk of introducing incompatible changes, delaying adoption exposes us to security vulnerabilities and rising technical debt. Too much time between version bumps complicates the process of consolidating the new dependency version with our software. It also makes upstream fixes difficult.

## Build and Test dependencies

Owning our software dependencies is the first step of assuring consistent artifact quality and velocity. The next one is owning our build environment. When creating our binaries, we rely on certain tools and environments to be available. If our process runs install scripts and `apt-get` is down, we will not be able to create a release.

We also rely on the homogeneity and isolation of our build procedures. Meaning, any previous action does not influence our current build process. Using containerization technology, we are able to create hermetic build environments offering the required tools. Once we are able to provide self-hosted hermetic environments we tackle the issue of build time performance and resource optimization. Especially monolith software designs seldomly require a full rebuild and benefit from shared compilation caches.

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

## Change lists

As we shift the responsibility of dependency management from technological analysis to sociotechnical responsibility, we communicate changes in a human-readable way. Thus, every release is accompanied by a change list (or change log), a text file describing the work done for the release. Typically, bullet points of new features and fixed bugs.

The practices of trunk-based development make an automatic generation of change lists trivial. At release, we concatenate the titles and descriptions of our pull requests.
