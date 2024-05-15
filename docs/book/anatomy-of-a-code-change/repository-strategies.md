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

## The basics of a repository

Regardless of your repository design strategy, your typical repository should cover 

- Code
- Versioning
- Wiki and Docs
- Codeowners
- Communication and support channels
- Artifacts


## Standardize onboarding

Certain domains have established good practices when it comes to Documentation.

Instead of standardizing documentation practices and platforms we instead standardize a README which provides directions and locations of where to find the desired information.



Ensure consistent tooling throughout teams (at a minimum) and schemas throughout organizations.

- Code
- Versioning
- Wiki and Docs
- Codeowners
- Communication and support channels
- Artifacts