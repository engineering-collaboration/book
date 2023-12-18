# Pull Requests

Pull Requests (PR) aka Merge Requests are a proven strategy of ensuring a high level of quality when integrating new work into the main branch. Most distributions of source control system offer some sort of web absed user interface for creating PR's.

The PR is the major process of how code changes are introduced to the product. To streamline this process, define clear guidelines for the pull request process, including the steps that need to be automated, the tools that will be used, and the expected outcomes.

### Title

Establish and communicate guidelines for PR titles to ensure consistency across development. These guidelines may cover structural and syntactial language properties of the title.

Avoid relying on PR titles for automation procedures and try to move these dependencies from title prefixes to labels. Titles are read by humans, not computers.

### Description

A short description highlighting what changed over the course of the development branch. A good description follows an approved structure for documenting changes. Communicate what this feature is trying to achieve. What is the reason for you to have worked on it. Typically this section is about two sentences to a paragraph.

Relevant documentation of code should be contained to comments in the source code itself. However, in the context of the code integration it is a good idea to document any particular findings you made along the way and share why you made the decisions you did. Any quirks, outstanding to-do's or motivation behind necessary refactors should be mentioned in the description.

Asa general rule, choose to share information that gives context for the code review and keep it short to reduce cognitive load.

### Labels

Attaching labels to PR's improves its organzational capabilities. Using labels you can filter for PR's or kick off specific automation tasks. Labels can categorized by the nature of the development task (feature, bugfix, documentation), the severity of the changes (patch, minor, major), or organizational information (department, milestone, etc)

## Merging constraints

It makes sense to subjugate requested integrations to a certain amount of scrutiny. This scrutiny comes in the form of automated reviews and manual reviews to ensure high quality code integrations.

Provide context why a particular constrain exists to make it feel less arbitrary. People are less likely to push back against rules when there is a clear reason behind them.

### Automated Reviews

Identify opportunities for automation in the pull request process, such as code linting, testing, and code coverage analysis.

Opposed to tests that analyse code execution, static analyses reviews the syntax of the typed code.

**Static Analysis** verifies good practices of the implementation. It scores HOW the engineer structured their implementation. Use automated code quality checks, such as code linting and style checks, to ensure that the code meets the required standards. We talk about the intricacies of static analyses in the [static analyses chapter]().

**Lightweight Tests** verify the acceptance criteria of the implementation and check that the engineer has not unintentially introduced new bugs or regressions. We talk about the intricacies of testing strategies in the [testing chapter]().

A branch that passes tests is also referred to as being "green".

Ensure that the automation process is effective and meets the needs of the project and the project's stakeholders. This includes communicating regularly, sharing feedback, and working together to resolve issues. As with everything in this bool, continuously improve the automation process by identifying areas for improvement and implementing changes to optimize the process. Implementation practices evolve and your system should evolve with them.

### Manual Reviews

Request reviews by certain personell or personell groups. These reviews are essential for consistent high quality code integrations and horizontal distribution of knowledge. There are various strategies on who to request reviews from depending on team size and the nature of your changes.

It typically makes sense to involve people across two ends of a spectrum, e.g. one senior person and one junior person can share different insights during the review. Having people across departments review your code improves cross department collaboration and spreads the knowledge horizontally.

Should it appear that a major burden of the code reviews are done by a limited amount of number, consider implementing processes or tools that spreads review requests evenly across team members.

We will discuss code reviews in greater depth in the next chapter.


## Templates

Most source control platforms offer the ability to write templates for PR's. Using templates you can guide fellow developers into an approved framework. Consider adding additional meta information in templates, such as:

- A to-do list for the PR
- Automatic label assignment
- Automatic reviewer assignements
- References to external resources, e.g. JIRA tickets
