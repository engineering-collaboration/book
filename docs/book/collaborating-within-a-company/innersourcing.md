---
title: Innersourcing
description: Innersourcing is the practice of sharing source code, practices, and documentation within an organization. Much like open-source projects, the motivation is to reduce duplicate work and increase velocity for market-mandated features.
---

# Innersourcing

Innersourcing is the practice of sharing tools, knowledge, code, practices, and documentation within an organization. Similar to consuming open-source projects, inner-source reduces duplicate work and speeds up development of differentiating product features. We provide time, space, and money to enable and encourage people from different teams with similar skills and expertise to come together to learn from each other and to develop their professional competencies.

Any employee may access the source code of any product of any team across the company. We encourage our engineers to suggest changes for shared libraries, implement those changes, and create a merge requests. Because this form of communication is not strictly tied to the design and building of operational software systems, Conway's law plays a less potent role, and freer cross-association between teams can take place.

Innersourcing done appropriately builds further trust between counterparts on other teams and encourages practitioners to communicate between departments. This kind of engagement rewards collaboration and organically encourages professional upskilling. The best thing we can do for our organization and people is to institute a culture of experimentation and learning and invest in the technical and management capabilities that enable it.

Setting up dedicated innersourcing communication channels helps teams to unblock themselves.  and distribute the burden of support questions.

## Discovering Code

High discoverability of projects and code on a broad scale avoids wasted time and work duplication. By introducing the habit of researching existing internal solutions before tackling problems, our organization avoids solving the same problems multiple times. When engineers reach out to each other with questions, we reduce silos between teams, disciplines, and departments.

Repositories hold our source code, documentation, infrastructure definitions, CI scripts, and build instructions. Most of our staff work with our repositories on a day-to-day basis and use them as the main tool for collaborating with colleagues.

When working on independently deployable services or applications, we organize the projects as separate repositories (multirepo) or within a single repository (monorepo). A distinguished company using the monorepo approach is Google. The company evangelized managing its entire source across all projects within a single code repository. All engineers work within that monorepo.

Independent products within an organization depend on shared code to solve common problems. A major advantage of the monorepo strategy is that the overlap of shared code is easier to manage. Large-scale changes and refactors within a single repository represent a working state. Refactors across multiple repositories require external knowledge about compatible snapshots.

Modern software products depend on packages, libraries, and binaries from third-party providers. Consuming artifacts of other products does not signal the need for a shared repository. However, substantial use of git submodules indicates hard dependencies on source code, which might benefit from consolidating the projects into a single repository.

Our engineers have read access to the entire source code across the organization and write privileges to their respective work. However, at a given scale, we provide tooling for efficient transfer and storage of data. We cannot expect an intern with a narrow range of responsibilities to download and save a decade of code changes across all products.

Monorepos organically tear down communication silos across teams, but we deal with increased noise from collaborators on a daily basis. At a given size, we necessarily implement the concept of a merge queue, or throw linear history out the window. Merge queues rebase and integrate the changes asynchronously and one at a time. It becomes easier to enforce company-wide standards and static analysis. As a result, moving engineers between teams becomes less of a bother.

In monorepos, we encounter additional overhead with creating and handling CI workflows. We require additional dedicated personnel to ensure efficient automation runs in hermetic environments. However, a consolidated CD system means every team has the tools and know-how to deploy the entire system.

In the end, we go with the approach that requires the least amount of proprietary effort. Our organization's repository strategies mirror the team constellation and module composition of our product. A growing module within a repository might require a spin-out. An increase in shared code across services leads to consolidation.

## Repository Onboarding

The freedom of choosing a way of work across teams complicates standardizing the onboarding process for new project collaborators. Hence, standardized processes give way to a shared entry point. A `README` file in the root of our project informs new engineers about how to work with the project. A well-written `README` indicates a high-quality product.

Quickstart instructions explain how to get the project up and running in the fewest steps necessary. From installing dependencies to executing setup scripts and completing an example to verify the software is functioning properly. Beyond operating our project, contributors need to test, build, and run the project locally.

A `README` file does not contain the entire documentation of our software. Any information beyond the setup process might be available within a docs directory of the project, an appended wiki, or a dedicated documentation page available through the browser. Our `README` lists the location of available tutorials, guides, references, and explanations.

Engineers self-discover the answer to nine out of ten questions by reading through the source code and the available documentation. To address the full Decalogue of woes, our `README` describes how to contact available support channels. In lieu of this, we consult the code owners file, which lists the responsible personnel authorized to integrate changes into the repository's trunk.

To merge changes, future contributors need to be aware of our integration processes. Contribution guidelines outline the steps for filing bug reports and feature requests, working on the code base, running automated CI tasks, and requesting code reviews. Additional guidelines might also cover the language used in pull requests and the practices of commenting and testing code for this project. To preempt questions or duplicate work, we share hyperlinks to the immediate roadmap and long-term backlog of our product.

Consumers of our distribution require information about the product's distribution. The location of distribution artifacts, such as executables, libraries, packages, and container images, combined with the versioning scheme, ensures our users install the intended release.

## Standardization

Autonomous vertical teams eliminate dependencies and handoffs to other teams for a successful application deployment. Yet teams do interact with one another, and team members collaborate within a team. To reduce friction across our organization, it makes sense to standardize a certain set of dynamic variables.

Standardization is a double-edged sword. Although it improves communication across the organization, we might inadvertently limit a team's capabilities to efficiently and creatively do their work.

<!-- vale write-good.Weasel = NO -->
- We only standardize what is strictly necessary.
- We only standardize the lowest common denominator of what is necessary.
- If there is an open-source solution, we use the open-source solution.
<!-- vale write-good.Weasel = YES -->

### Standardizing Schemas instead of Tools

As we hire across various domains, our teams trend towards using tools popular in their specialties. Imposing arbitrary restrictions dampens the productivity of our teams. Instead of standardizing platforms or tools, we standardize our schemas and data description languages.

By dictating schemas, we ensure our teams are utilizing the tools that are deemed most productive for the specific domain, but the output and input of data and products migrate well between teams.

Community-driven open-source projects like *OpenTelemetry* have become hugely popular schemas, and a wide spectrum of industry-leading platforms and tools support the import and export of *OpenTelemetry* data. By standardizing the format of our telemetry data, instead of the library and tools of our telemetry, our teams are flexible in their choice and needs of telemetry dashboards and search tools.

A popular selection of schemas for a broad set of use cases can be found at [schema.org](https://schema.org).
