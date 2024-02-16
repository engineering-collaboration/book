# Pull Requests

Once we are satisfied with the state of our development branch and believe our changes are ready to be integrated into main, we open a pull request (PR). PRs pave the way for successfully introducing high quality changes into our main branch and ultimately our product.

All serious source control platforms offer automation, tooling, and UIs for creating and reviewing PRs. We establish clear guidelines on how to structure our PRs and design a streamlined process with automated and manual steps for accepting a change. We do not advocate for any specific source control platform or their implementation of PRs. As with all things, differing solutions come with various pros and cons. That being said, at the very least our PRs consist of the following attributes.

## Title

The title is the first descriptive feature we see when reviewing a PR. We establish structural and syntactical guidelines for consistent PR titles across the department. Typically, these follow the same rules as [commits](./commits.md).

- We limit the subject line to 50 characters
- We capitalize the subject line
- We do not end the subject line with a period
- We use the present tense ("Add feature" not "Added feature")
- We use the imperative mood ("Move cursor to…" not "Moves cursor to…")

We avoid relying on branch names or PR title prefixes for kicking off automation procedures. We handle subjective automation by applying labels to our PR. Titles are read by humans, not computers. We might however consume PR titles for creating automated changelogs.

## Description

A short description highlighting what changed over the course of the development branch. A good description follows an approved structure for documenting changes. Communicate what this feature is trying to achieve. What is the reason for you to have worked on it. Typically this section is about two sentences to a paragraph.

Meta data exceeding a label is placed as comments in the first lines of the description. These are invisible to readers and will be loaded first by runners.

A good description starts with a short paragraph summarizing the changes. Should the changes be extensive, we begin with a TLDR; section. Asa  general rule, choose to share information that gives context for the code review and keep it short to reduce cognitive load.

Followed by all necessary URLs to resources, such as the task ticket and the design doc.

Relevant documentation of code should be contained to comments in the source code itself. However, in the context of the code integration it is a good idea to document any particular findings you made along the way and share why you made the decisions you did. Any quirks, outstanding to-do's or motivation behind necessary refactors should be mentioned in the description.

## Labels

Attaching labels to PR's improves its organzational capabilities. Using labels you can filter for PR's or kick off specific automation tasks. Labels can categorized by the nature of the development task (feature, bugfix, documentation), the severity of the changes (patch, minor, major), or organizational information (department, milestone, etc)

## Merging constraints

It makes sense to subjugate requested integrations to a certain amount of scrutiny. This scrutiny comes in the form of automated reviews and manual reviews to ensure high quality code integrations.

Provide context why a particular constrain exists to make it feel less arbitrary. People are less likely to push back against rules when there is a clear reason behind them.

### Automated Reviews

Identify opportunities for automation in the pull request process, such as code linting, testing, and code coverage analysis.

Opposed to tests that analyze code execution, static analysis reviews the syntax of the typed code.

**Static Analysis** verifies good practices of the implementation. It scores HOW the engineer structured their implementation. Use automated code quality checks, such as code linting and style checks, to ensure that the code meets the required standards. We talk about the intricacies of static analysis in the [static analysis chapter]().

**Lightweight Tests** verify the acceptance criteria of the implementation and check that the engineer has not unintentially introduced new bugs or regressions. We talk about the intricacies of testing strategies in the [testing chapter]().

A branch that passes tests is also referred to as being "green".

Ensure that the automation process is effective and meets the needs of the project and the project's stakeholders. This includes communicating regularly, sharing feedback, and working together to resolve issues. As with everything in this bool, continuously improve the automation process by identifying areas for improvement and implementing changes to optimize the process. Implementation practices evolve and your system should evolve with them.

### Manual Reviews

Request reviews by certain personell or personell groups. These reviews are essential for consistent high quality code integrations and horizontal distribution of knowledge. There are various strategies on who to request reviews from depending on team size and the nature of your changes.

We will discuss code reviews in greater depth in the next chapter.

## Templates

Most source control platforms offer the ability to write templates for PR's. Using templates you can guide fellow developers into an approved framework. Consider adding additional meta information in templates, such as:

- A to-do list for the PR
- Automatic label assignment
- Automatic reviewer assignements
- References to external resources, e.g. JIRA tickets

## Isolation of PRs

Use common sense to isolate seperate PR and bugfixes. We strive to increase productivity, not slow it down. Seperate PR's are not bureaucratic red tape, but A/B tests of rolling back changes enables us to test regression bugs vs bugs introduced in new features.

bugifxes and feautres
fixes across different bugs
