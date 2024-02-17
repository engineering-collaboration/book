# Pull Requests

Once we are satisfied with the state of our development branch and believe our changes are ready to be integrated into main, we open a pull request (PR). PRs pave the way for successfully introducing high quality changes into our main branch and ultimately our product. All serious source control platforms offer automation, tooling, and UIs for creating and reviewing PRs.

## Isolation of Pull Requests

Use common sense to isolate seperate PR and bugfixes. We strive to increase productivity, not slow it down. Seperate PR's are not bureaucratic red tape, but A/B tests of rolling back changes enables us to test regression bugs vs bugs introduced in new features.

bugifxes and feautres
fixes across different bugs
no refactors

## Outlining a Pull Request

We establish clear guidelines on how to structure our PRs and design a streamlined process with automated and manual steps for accepting a change. We do not advocate for any specific source control platform or their implementation of PRs. As with all things, differing solutions come with various pros and cons. That being said, at the very least our PRs consist of the following attributes.

### Title

The title is the first descriptive feature we see when reviewing a PR. We establish structural and syntactical guidelines for consistent PR titles across the department. Typically, these follow the same rules as [Commits](./commits.md).

- We limit the subject line to 50 characters
- We capitalize the subject line
- We do not end the subject line with a period
- We use the present tense ("Add feature" not "Added feature")
- We use the imperative mood ("Move cursor to…" not "Moves cursor to…")

We avoid relying on branch names or PR title prefixes for kicking off automation procedures. We handle subjective automation by applying labels to our PR. Titles are read by humans, not computers. We might however consume PR titles for creating automated changelogs.

### Description

We have the opportunity to share more detailed information within the description of a PR to highlight what changed over the course of the development branch. As with titles, a description follows an approved structure for documenting changes.

- If necessary, we place meta data exceeding the form of a label as comments in the first lines of the description. These are invisible to readers and will be loaded first by runners.
- The first visible part of a description consists of a short paragraph summarizing the changes. Should these changes be extensive, we begin with a TL;DR section. As a general rule, we choose to share information that gives context for the code review and keep it short to reduce cognitive load.
- To improve the context, we reference all necessary internal resources, such as the URLs to our ticket and the design doc. These are resources relating to our task itself, not resources relating to our implementation.
- Finally, we complete the description with information aimed for future documentation, rather than the code review. We document our decisions and findings as discussed in [Documenting Decisions](). We append benchmark data of libraries, note the pros and cons of our decision and discuss future TODOs. While relevant documentation of code should be contained to comments in the source code itself, this section covers information to verbose for code comments and helpful to colleagues searching for intention behind changes.

### Labels

We label PRs to kick off specific automation tasks, and to subsequently filter them for specific categories. Using labels, we describe the nature of the development task, the severity of the changes, organizational information, the status of our task, and whatever else makes sense to us.

As a label is only a single point of information we consider what information we append as a label. For enterprise scale organizations, certain data may be added as commented meta data into the description, and other data may be ill-formed to be attached to a PR in the first place and is better suited to be requested from a different platform.

## Merging constraints

We subjugate requested integrations to a certain amount of scrutiny. This scrutiny comes in the form of automated reviews and manual reviews to ensure high quality code integrations. A branch that passes tests is also referred to as being "green".

For every step we provide context why that particular constrain exists to make it feel less arbitrary. People are less likely to push back against rules when there is a clear reason behind them.

### Automated Reviews

Successful implementations of TBD and CICD into our organization center around automation and constant improvement of processes and said automation. The first gating process of analyzing code changes of a pull request executes light-weight operations to verify the state of our development branch.

[Static Analysis]() checks how we structure and write our implementation. Rather than executing the software, automated code-linting and style-checks ensure that our changes meet the required standards. This process identifies agreed upon standards, such as naming conventions, whitespace, and error handling and flags the use of blacklisted libraries, legacy code, or deprecated implementations.

Automated tests verify the functional runtime criteria of the implementation and warn us about introduced errors or regressions. The chapter [Testing](./testing/README.md) outlines a complete testing strategy for the lifecycle of a code change.

In the spirit of this book we continuously refine our automation process by identifying areas for improvement and regularly communicate within our team to optimize the process. As our system evolves, our integration processes evolve with it.

### Manual Reviews

After our code changes passed the automated reviews successfully, it's time for another pair of eyes to go over our work. We request reviews from (a group of) colleagues to verify our digital labor. Manual reviews increase readability of the code, catch mistakes missed by our automation suite and distribute knowledge of the software horizontally across our team.

We discuss these reviews in detail in the chapter [Code Reviews]().

## Templates

Most source control platforms offer the ability to write templates for PR's. Using templates you can guide fellow developers into an approved framework. Consider adding additional meta information in templates, such as:

- A to-do list for the PR
- Automatic label assignment
- Automatic reviewer assignements
- References to external resources, e.g. JIRA tickets
