# Repository Strategies

Repositories hold our source code, documentation, infrastructure definitions, CI scripts, and build instructions. Most of our staff work with our repositories on a day-to-day basis and use them as the main tool for collaborating with colleagues.

## Monorepository vs multiple repositories

When working on independently deployable services or applications, we organize the projects as separate repositories (multirepo) or within a single repository (monorepo). A distinguished company using the monorepo approach is Google. The company evangelized managing its entire source across all projects within a single code repository. All engineers work within that monorepo.

### Code sharing

Independent products within an organization depend on shared code to solve common problems. A major advantage of the monorepo strategy is that the overlap of shared code is easier to manage. Large-scale changes and refactors within a single repository represent a working state. Refactors across multiple repositories require external knowledge about compatible snapshots.

Modern software products depend on packages, libraries, and binaries from third-party providers. Consuming artifacts of other products does not signal the need for a shared repository. However, substantial use of git submodules indicates hard dependencies on source code, which might benefit from consolidating the projects into a single repository.

Our engineers have read access to the entire source code across the organization and write privileges to their respective work. However, at a given scale, we provide tooling for efficient transfer and storage of data. We cannot expect an intern with a narrow range of responsibilities to download and save a decade of code changes across all products.

### Collaboration

Monorepos organically tear down communication silos across teams, but we deal with increased noise from collaborators on a daily basis. At a given size, we necessarily implement the concept of a merge queue, or throw linear history out the window. Merge queues rebase and integrate the changes asynchronously and one at a time. It becomes easier to enforce company-wide standards and static analysis. As a result, moving engineers between teams becomes less of a bother.

In monorepos, we encounter additional overhead with creating and handling CI workflows. We require additional dedicated personnel to ensure efficient automation runs in hermetic environments. However, a consolidated CD system means every team has the tools and know-how to deploy the entire system.

In the end, we go with the approach that requires the least amount of proprietary effort. Our organization's repository strategies mirror the team constellation and module composition of our product. A growing module within a repository might require a spin-out. An increase in shared code across services leads to consolidation.

## Repository onboarding

The freedom of choosing a way of work across teams complicates standardizing the onboarding process for new project collaborators. Hence, standardized processes give way to a shared entry point. A `README` file in the root of our project informs new engineers about how to work with the project. A well-written `README` indicates a high-quality product.

### Quickstart

Quickstart instructions explain how to get the project up and running in the fewest steps necessary. From installing dependencies to executing setup scripts and completing an example to verify the software is functioning properly. Beyond operating our project, contributors need to test, build, and run the project locally.

### Further documentation

A `README` file does not contain the entire documentation of our software. Any information beyond the setup process might be available within a docs directory of the project, an appended wiki, or a dedicated documentation page available through the browser. Our `README` lists the location of available tutorials, guides, references, and explanations.

### Support channels

Engineers self-discover the answer to nine out of ten questions by reading through the source code and the available documentation. To address the full Decalogue of woes, our `README` describes how to contact available support channels. In lieu of this, we consult the code owners file, which lists the responsible personnel authorized to integrate changes into the repository's trunk.

### Contribution guidelines

To merge changes, future contributors need to be aware of our integration processes. Contribution guidelines outline the steps for filing bug reports and feature requests, working on the code base, running automated CI tasks, and requesting code reviews. Additional guidelines might also cover the language used in pull requests and the practices of commenting and testing code for this project. To preempt questions or duplicate work, we share hyperlinks to the immediate roadmap and long-term backlog of our product.

### Distribution information

Consumers of our distribution require information about the product's distribution. The location of distribution artifacts, such as executables, libraries, packages, and container images, combined with the versioning scheme, ensures our users install the intended release.
