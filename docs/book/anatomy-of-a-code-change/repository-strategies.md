# Repo

Our organization's repository strategies mirrors the team constellation and module composition of our product.

Our products are independently deployable and depend on artifacts of other products. We consume libraries and binaries of other repository. The use of submodules indicates hard dependencies that might benefit from consolidating code into a single repository.

Google evangelized the strategy of a monorepo. Meaning its entire source across all projects reside within a single code repository. All engineers work within that monorepo. It works for Google.

Large overlap of shared code is easier to manage in a single repository. Large-scale changes and refactors within a single repository represent a working state. Refactors across repositories requires external knowledge about compatible snapshots.

We organically tear down silos, but deal with increased noise of collaborators. At a given size, we implement the concept of a merge queue, or throw linear history out of the window. It becomes easier to enforce company wide standards and static analysis. Moving engineers between teams becomes less of a bother.

In the end, we go with the approach that requires the least amount of proprietary effort.

The CI/CD workflows become verbose and we ensure hermetic environments for each run. However, a consolidated CD system means we are able to deploy the entire system. Provided our CD runs are embedded within our repository. Larger projects rely on external CD tools.

mixing source code, CI, CD, artifact storage, docs platform, project tracking

## Monorepo

+ shared utils code
+ everybody has access automatically
+ no silos
+ large scale changes and refactoring
+ standards and static analysis
+ visibility
+ release of entire system

- requires sparse checkout
- lots of traffic
- difficult to setup ci/cd

## Multiple repos

+ team ownership and rules

## Standardize onboarding

Regardless of our repository design strategy, a common project consists of source code, documentation, and instructions for CI/CD processes. Throughout our organization, teams have the freedom to work in a way most suitable to them. The variation across teams complicates standardized onboarding for project collaborators across teams. Hence, a standardized process give way to a shared entrypoint. A README file in the root of our project informs entrant engineers about working with our source code and covers:

Quickstart instructions to get project running in the least amount of steps necessary. From installing dependencies to running setup scripts and running and example to verify our software is functioning properly. Beyond running our project, contributors need to test, build, and run the project locally.

The location of documentation beyond the README. Further information and references might be available within a docs directory of the project, an appended wiki, or a dedicated documentation page available through the browser.

Engineers self-discover the answer to nine out of ten questions by reading through the source code and the available documentation. To address the full Decalogue of woes, our README describes how to contact available support channels. In lieu, we consult the code owners file. A list of responsible personnel, authorized to integrate changes into the repository's trunk.

- Contribution guidelines PR, test, reviews etc CI/CD including the artifact location.
