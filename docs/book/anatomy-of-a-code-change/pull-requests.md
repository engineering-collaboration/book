# Pull Requests

Once we are satisfied with the state of our development branch and believe our changes are ready to be integrated into main, we open a pull request (PR). PRs pave the way for introducing high-quality changes into our main branch and ultimately our product. All serious source control platforms offer automation, tooling, and UIs for creating and reviewing PRs.

## Outlining a Pull Request

We establish clear guidelines on how to structure our PRs and design a streamlined process with automated and manual steps for accepting a change. We do not advocate for any specific source control platform or their implementation of PRs. As with all things, differing solutions come with various pros and cons. That being said, PRs tend to consist of the following attributes.

### Title

The title is the first descriptive feature we see when reviewing a PR. We establish structural and syntactical guidelines for consistent PR titles across the department. Typically, these follow the same rules as [Commits](./commits.md).

- We limit the subject line to 50 characters
- We capitalize the subject line
- We do not end the subject line with a period
- We use the present tense ("Add feature" not "Added feature")
- We use the imperative mood ("Move cursor to…" not "Moves cursor to…")

We avoid relying on branch names or PR title prefixes for kicking off automation procedures. We handle subjective automation by applying labels to our PR. Titles are read by humans, not computers. We might, however, consume PR titles for creating automated changelogs.

### Description

We have the opportunity to share more detailed information within the description of a PR to highlight what changed over the course of the development branch. As with titles, a description follows an approved structure for documenting changes.

- If necessary, we place metadata exceeding the form of a label as comments in the first lines of the description. These are invisible to readers and will be loaded first by runners.
- The first visible part of a description consists of a short paragraph summarizing the changes. Should these changes be extensive, we begin with a TL;DR section. As a general rule, we choose to share information that gives context for the code review and keep it short to reduce cognitive load.
- To improve the context, we reference all necessary internal resources, such as the URLs to our ticket and the design doc. These are resources relating to our task itself, not resources relating to our implementation.
- Lastly, we complete the description with information aimed for future documentation, rather than the code review. We document our decisions and findings as discussed in [Documenting Decisions](). We append benchmark data of libraries, note the pros and cons of our decision, and discuss future to-dos. While relevant documentation of code should be contained in comments in the source code itself, this section covers information too verbose for code comments and helpful to colleagues searching for the intention behind changes.

### Labels

We label PRs to kick off specific automation tasks and to subsequently filter them for specific categories. Using labels, we describe the nature of the development task, the severity of the changes, organizational information, the status of our task, and whatever else makes sense to us.

As a label represents a single point of information, we consider what information we append as a label. For enterprise-scale organizations, certain data may be added as commented metadata into the description, and other data may be ill-formed to be attached to a PR in the first place and is better suited to be requested from a different platform.

## Merging Constraints

We subject requested integrations to a certain amount of scrutiny. This scrutiny comes in the form of automated reviews and manual reviews to ensure high-quality code integrations. A branch that passes tests is also referred to as *being green*.

For every step, we provide context as to why that particular constraint exists to make it feel less arbitrary. People are less inclined to push back against rules when there is a clear reason behind them.

### Automated Reviews

Successful implementations of TBD and CICD into our organization center around automation and constant improvement of processes and said automation. The first gating process of analyzing code changes of a pull request executes lightweight operations to verify the state of our development branch.

[Static Analysis]() checks how we structure and write our implementation. Rather than executing the software, automated code-linting and style-checks ensure that our changes meet the required standards. This process identifies agreed-upon standards, such as naming conventions, whitespace, and error handling, and flags the use of disallowed libraries, legacy code, or deprecated implementations.

Automated tests verify the functional runtime criteria of the implementation and warn us about introduced errors or regressions. The chapter [Testing](./testing/README.md) outlines a complete testing strategy for the lifecycle of a code change.

In the spirit of this book, we continuously refine our automation process by identifying areas for improvement and communicate within our team to optimize the process. As our system evolves, our integration processes evolve with it.

### Manual Reviews

After our code changes pass the automated reviews, another pair of eyes examines our work. We request reviews from (a group of) colleagues to verify our digital labor. Manual reviews increase the readability of the code, catch mistakes missed by our automation suite, and distribute knowledge of the software horizontally across our team.

We discuss these reviews in detail in the chapter [Code Reviews]().

## Templates

Wherever possible, we reduce the workload of composing PRs by offering templates and boilerplate content. Using templates, we pave the way for our engineers to follow standardized titles, descriptions, labels, and assign reviewers. We list often-forgotten tasks for our engineers to check before opening a PR.

When creating standard templates, we keep the internal structure of description paragraphs to a minimum. The less we assume of changes, the more broadly applicable it is. We standardize the headlines and formatting of PR description templates by the four points discussed above.

Beyond static text templates, our organization may offer dynamic tooling building sophisticated PRs via the API of our source control platform in combination with internal platforms. Furthermore, generative text tools are a high productivity replacement for static boilerplate content when describing code changes of our PR.

## Pull Request Isolation

When creating a PR, we do not mix solutions across tasks. If a feature happens to fix a bug, we certainly reference it, but otherwise, we create separate PRs for fixes across different bugs, work on various features, refactors of code, and whitespace issues.

An amalgamation of labor happens when we come across faulty code while working on our feature. In this case, we proceed by creating another branch from the latest main, fix the bug in question, open a PR for our fix, and integrate it into main. If our fix passes the process and tests, we rebase our feature branch to the latest main and continue our work.

The isolation of PRs increases code stability and transparency. We strive to increase productivity, not introduce unnecessary bureaucratic red tape. Frequent integrations to main executing our automated test suite help us map issues to specific implementations. Code reviews containing multiple fixes and refactors increase cognitive load and time investment by reviewers. Bug fixes or features that are mixed with whitespace alterations introduce unnecessary noise when comparing the differences to the current working solution.
