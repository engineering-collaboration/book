# Repository Strategies

Repositories hold our source code, documentation, infrastructure definitions, CI scripts, and build instructions. Most of our staff works with our repositories on a day-to-day basis and use them as the main tool for collaborating with colleagues.

## Monorepository vs multiple repositories

Our organization's repository strategies mirrors the team constellation and module composition of our product.

Our products are independently deployable and depend on artifacts of other products. We consume libraries and binaries of other repository. The use of submodules indicates hard dependencies that might benefit from consolidating code into a single repository.

Google evangelized the strategy of a monorepo. Meaning its entire source across all projects reside within a single code repository. All engineers work within that monorepo. It works for Google.

Large overlap of shared code is easier to manage in a single repository. Large-scale changes and refactors within a single repository represent a working state. Refactors across repositories requires external knowledge about compatible snapshots.

We organically tear down silos, but deal with increased noise of collaborators. At a given size, we implement the concept of a merge queue, or throw linear history out of the window. It becomes easier to enforce company wide standards and static analysis. Moving engineers between teams becomes less of a bother.

In the end, we go with the approach that requires the least amount of proprietary effort.

The CI/CD workflows become verbose and we ensure hermetic environments for each run. However, a consolidated CD system means we are able to deploy the entire system. Provided our CD runs are embedded within our repository. Larger projects rely on external CD tools.

## Monorepo

shared utils code
everybody has access automatically
no silos
large scale changes and refactoring
standards and static analysis
visibility
release of entire system

requires sparse checkout
lots of traffic
difficult to setup ci/cd
specific team ownership and rules

## Repository README

The freedom of choosing a way of work across teams complicates standardizing the onboarding process for new project collaborators. Hence, standardized processes give way to a shared entrypoint. A README file in the root of our project informs entrant engineers about how to work with the project. A well-written README indicates a high-quality product.

### Quickstart

Quickstart instructions explain how to get the project up and running in the least amount of steps necessary. From installing dependencies to executing setup scripts, and completing an example to verify the software is functioning properly. Beyond operating our project, contributors need to test, build, and run the project locally.

### Further documentation

A README file does not contain the entire documentation of our software. Any information beyond the setup process might be available within a docs directory of the project, an appended wiki, or a dedicated documentation page available through the browser. Our README lists the location of available tutorials, guides, references, and explanations.

### Support channels

Engineers self-discover the answer to nine out of ten questions by reading through the source code and the available documentation. To address the full Decalogue of woes, our README describes how to contact available support channels. In lieu, we consult the code owners file. A list of responsible personnel, authorized to integrate changes into the repository's trunk.

### Contribution guidelines

To merge changes, future contributors need to be aware of our integration processes. Contributions guidelines outline the steps of filing bug reports and feature requests, working on the code base, running automated CI tasks, and requesting code reviews. Additional guidelines might also cover the language used in Pull requests and the practices of commenting and testing code for this project. To preempt questions or duplicate work, we share hyperlinks to the immediate roadmap and long-term backlog of our product.

### Distribution information

Consumers of our distribution require information about the product's distribution. The location of distribution artifacts, such as executables, libraries, packages, and container images, combined with the versioning scheme ensure our users install the intended release.
