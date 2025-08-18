# Merge Requests

We fixed the bug. We completed the feature. We underestimated the effort of our task and want to integrate the first code changes. Regardless, it works on our machine and we're ready to integrate our changes into the `main` branch. To ensure we only merge high-quality code into our main branch and ultimately our product, we scrutinize any additions into our trunk via a gate-keeping mechanism called a *Merge Request* (MR). All serious source control platforms offer automation, tooling, and UIs for creating and reviewing MRs.

A MR allows developers to provide context for their changes. We can provide information as to why the new code was necessary, attach links to tickets and bug reports, and provide any media to explain the expected behavior. We run automated tools and automated tests and request manual and AI driven code reviews. MRs are the first milestone in the life cycle of a code change for continuous integration.

## Metadata

The first encounter to any MR is its title. Not only do our coworkers read it, our automation tooling consumes the MR title for different tasks. We use it as the message for merge commits, we include them in automated release notes, and when sharing the link to a MR, the title builds the foundation for the social content preview. Short, concise, and descriptive titles improve the readability and traceability of our changes.

!!! note "A quick guide on merge request titles"
    Writing MR titles follows the same principles as writing commit messages. 

    - We limit the title to 50 characters
    - We capitalize the title
    - We do not end the title with a period
    - We use the present tense ("Add feature" not "Added feature")
    - We use the imperative mood ("Move cursor to…" not "Moves cursor to…")

    A properly formed MR title completes the sentence "*If applied, this change will ...*":

    *If applied, this change will* Cap the number of threads for concurrent uploads ✅  
    *If applied, this change will* Capped the number of threads for concurrent uploads ❌  
    *If applied, this change will* Concurrent uploads now cap the number of threads ❌  

    When penning our MR title, we try to convey the most context with the least amount of characters. Thus we avoid the following practices:

    - We do not clutter the title with references to external tasks, organizational tags, or flags to launch automation tools. Prefixes and suffixes decrease the legibility of our carefully crafted title.
    - Instead of using the ingrained yet slothful "add", "remove", "update", or "refactor", we improve our messages by starting the title with a representative verb.
    - The title conveys why the code changed, not how it changed. We do not include any reference to the implementation strategy. The code changes themselves convey that information.

    Suboptimal | Better
    -|-
    [bugfix][224] Update authentication flow to be streamlined | Redirect users to the visited page after sign-in
    [JIRA-1123] Add authentication for the user with OpenID | Authenticate user via OpenID
    [dev-tests] Refactor cache to use redis instead of mongo | Reduce latency for cached content

Subsequent to the title, a MR description allows us to append any information we deem helpful to contextualize the code changes. Should these changes be extensive, we preamble the description with a summary paragraph. Following the summary, we expand upon why our code changes were necessary and how we expect the behavior of our software to change after our merge. We append any appropriate data, such as benchmark data to showcase performance improvements, hyperlinks to our task management tool, and references to our design documentation or reference implementation.

We document our findings and the decisions we made while working on our task. We explain the pros, cons, and consequences of our decisions and highlight what circumstances would make us revisit our solution. We document our decisions as discussed in the previous chapter. While relevant documentation of code should be contained in comments in the source code itself, this section covers information too verbose for code comments and helpful to colleagues searching for the intention behind changes.

Most modern CI platforms allow users to create labels or key-value pairs for MRs. We assign labels to our MR to kick off specific automation tasks and filter them for specific categories. The labels describe the nature of the development task, the severity of the changes, organizational information, or the status of our task. If no dedicated labels are available, we place metadata as comments in the first lines of the description. These are invisible to readers and will only be consumed by automation runners.

## Merge constraints

We establish clear guidelines on how to structure our PRs and design a streamlined process with automated and manual steps for accepting a change. We do not advocate for any specific source control platform or their implementation of PRs. As with all things, differing solutions come with various pros and cons. That being said, PRs tend to consist of the following attributes.

We subject requested integrations to a certain amount of scrutiny. This scrutiny comes in the form of automated reviews and manual reviews to ensure high-quality code integrations. A branch that passes tests is referred to as *being green*.

For every step, we provide context as to why that particular constraint exists to make it feel less arbitrary. People are less inclined to push back against rules when there is a clear reason behind them.

### Static Analysis

Static analysis scans the code as text without actually executing it. It verifies that we follow agreed-upon conventions in our solution to maintain consistent readability, avoid bugs, and prevent security vulnerabilities before running our code. Static analysis is run at every step of our code change: pre-merge, post-merge, and pre-release.

The most fundamental form of static analysis uses pattern matching to ensure our compliance with internally agreed-upon code formatting. We follow our organization's conventions regarding the type of whitespace, indentation, maximum line length, naming of objects, etc. We execute code linters specific to the programming language and extend these to cover the needs of our team.

Maintaining a consistent code base reduces friction when integrating our work within and across our teams by reducing the cognitive load when reading code. People can focus on the content of what is being written if the syntax layout is identical to the layout of their work.

Aside from programmatic syntax, we utilize static analysis practices for documentation. Pattern matching enforces practices that enrich embedded documentation by flagging improperly formatted comments across functions and objects. External documentation follows style guides that we enforce by configuring our static analysis tools.

Data flow analysis informs us about unused variables, uninitialized variables, and null pointer dereferences before we execute our code to discover crashes. Race conditions in multithreading environments are infamously difficult to spot and fix when the problem arises in production and can be prevented to a degree with sophisticated static analysis.

Call graph analysis flags potential performance bottlenecks and visualizes dependencies and call stacks. Configuring our analysis tool allows us to enforce organization-wide rules in the areas of flow control, for example, unsanctioned error handling. Dependencies to libraries with security violations expose a potential <!-- vale alex.ProfanityMaybe = NO -->attack<!-- vale alex.ProfanityMaybe = YES --> vector to malicious third parties. Static analysis highlights problematic dependencies before executing the code and endangering our system.

Resource leak detection in static analysis flags missing closures of objects, allocated memory, or network connections. These aspects severely affect the runtime stability of our system and subject us to high-security risks. Hostile actors piggyback on open database connections or memory layouts to read exposed data or inject unintended behavior.

We define goals for static analysis and monitor the progress over time. Propitiously, the output of this process lends itself to distinctly measurable metrics. We track the number and nature of issues detected, as well as the time it takes to address them. When migrating away from certain libraries, we deprecate the use of these to guard against new dependencies popping up across the organization.

Our tools do not merely flag misuse of certain aspects but offer solutions. Wherever possible, we automate resolutions of static analysis issues. Every manual step creates cognitive load which opens the door to frustration and failure to follow standardized practices.

Throughout the organization, we enforce high-impact issues and severe security vulnerabilities with static analysis; we wield it as a scalpel, not a hammer. A facilitating team of security and performance experts creates the smallest common denominator in collaboration with stakeholders across the organization.

Aside from prime issues, every team configures tooling to minimize noise and maximize development velocity. As with anything in the CI/CD mindset, static analysis practices evolve. We remove noisy configurations, add new rules to face novel problems, and adjust the severity of recommendations over time.


## Merging

When multiple people work on the same project, other people may have introduced changes to `main` since we last diverged from the branch. If others worked on the same file as us, these changes might collide. We need to resolve these conflicts.

*Git* merges compatible changes automatically. Resolving conflicts, however, requires manual intervention. We compare the clashing lines of changes and rectify the discord by editing the changes to accept a change from either source or manually edit a functioning resolution containing workings of both origins.

When rebasing changes, we find ourselves recurrently resolving the same lines across commits; such is the nature of this process. We minimize our rebasing effort by integrating changes frequently into main, rebasing our development branch frequently, squashing development commits of our development branch.

Depending on the discipline, the concept of repository streams, and branch isolation, merging changes differs between version control solutions. Universally, we discuss the idea of re-integrating changes into our main software product or uniting changes of differing origins.

!!! note
    Since merging varies between tooling, we focus on the practices within Git. This chapter is one of the rare exceptions that includes technical commands and ties to a specific platform.

*Git* includes various strategies for converging changes to a single destination branch. Ungoverned, our project might grow in unnecessary complexity, include opaque processes, or lose information relevant for future fixes. This chapter details merging policies for successful long-term integrations in trunk-based development.

### Linear History

Regardless of our approach, when merging changes into software, we ensure a linear history of our project. The parent commit of our development branch is the latest commit on main. A linear history sequentially chronicles the evolution of our software and streamlines future reactionary development.

[![Linear History](../../../assets/images/book/collaborating-within-a-codebase/linear-history.webp)](../../../assets/images/book/collaborating-within-a-codebase/linear-history.png)

Sometimes, we introduce unexpected breaking changes. A non-linear history complicates identifying and reverting an offending commit. If left unattended, a non-linear history breaches the point of illegibility and emerges as being utterly useless. Future bug fixes and tracking changes over a period of time devolve into frustratingly hair-pulling endeavors.

We sprouted our development branch off the latest commit of the main when sowing the seeds of our work. Chances are, while developing our feature, our colleagues integrated their tasks into the main branch, thus putting us in the position of cultivating a non-linear history should we merge our botanical offshoot into the trunk unchanged.

In order to rectify our entanglement, we rebase our work on the latest commit on main, fix occurring conflicts, and integrate our changes after passing our automated test suite. A rebase precedes any merge into our main branch.

[![Rebase](../../../assets/images/book/collaborating-within-a-codebase/rebase.webp)](../../../assets/images/book/collaborating-within-a-codebase/rebase.png)

!!! note
    When rebasing a branch, we create new commits on our local machine that no longer mirror the state of our remote repository. We either force-push (with-lease) our changes, overriding the state of the remote repository, or create a new branch from the head of our development branch and rebase and push that one, abandoning our development branch. We do so with the respect and caution required when rewriting project history in a collaborative environment.

<!-- TODO: (Daniel) Add merge queues -->

### Squash and Merge

Squashing an arbitrary number of consecutive commits combines and replaces those changes into a single commit. By consolidating work-in-progress commits or bilaterally annulling commits, we reduce noise in our project history.

Most source control platforms offer the option of a server-side *Squash and Merge* approach when integrating changes of a completed pull request (PR). The procedure squashes all commits of our development branch and appends our changes to the main branch as a single commit.

For short-lived development branches focusing on fixing or adding a single responsibility, the development steps are less important than the changes themselves, and the commits may be squashed and merged. Complex issues are documented as inline comments or within the PR description.

With a hypothetical average of ten commits per development branch, by squashing, we reduce the growth of commits over time from 10,000 commits to 1,000 commits.

### Merge Commit

On occasion, the complexity of achieving a task or the volume of changes across multiple files requires chronological cataloging for transparency. Merge commits allow us to preserve the development commits we created within the repository without clobbering the main branch.

The particular branching view of a merge commit allows us to either ignore the development commits when analyzing the main branch via `git log` or `git bisect`, or step into them if we are interested in the history of the changes.

[![Merge Commit](../../../assets/images/book/collaborating-within-a-codebase/merge-commit.webp)](../../../assets/images/book/collaborating-within-a-codebase/merge-commit.png)

[This *GitHub* blog article](https://github.blog/2022-06-30-write-better-commits-build-better-projects/) details practices for advanced users of *Git* about structuring a story of our commits when merging our work via a merge commit. The well-written paper outlines how thematically organized commits increase the readability of changes by spanning the dramatic arc of our development process; from partial implementations to tests, refactors, polish, and documentation.

### Cherry-Picking

The act of cherry-picking commits cannot, in good conscience, be described as a merge. It is, however, an additional way of transferring select commits between branches. The command `git cherry-pick` allows us to append an existing commit to our current `HEAD`.

Optionally, cherry-picking applies the contents of a commit to our current workspace, rather than appending a commit itself. This permits us to edit the content or revert unwanted modifications bundled within the cherry-picked change before creating a new commit in our development branch.

## Templates

Wherever possible, we reduce the workload of composing PRs by offering templates and boilerplate content. Using templates, we pave the way for our engineers to follow standardized titles, descriptions, labels, and assign reviewers. We list often-forgotten tasks for our engineers to check before opening a PR.

When creating standard templates, we keep the internal structure of description paragraphs to a minimum. The less we assume of changes, the more broadly applicable it is. We standardize the headlines and formatting of PR description templates by the four points discussed above.

Beyond static text templates, our organization may offer dynamic tooling building sophisticated PRs via the API of our source control platform in combination with internal platforms. Furthermore, generative text tools are a high productivity replacement for static boilerplate content when describing code changes of our PR.

## MR Isolation

When we do find ourselves having introduced unexpected changes to a production service with a large-scoped change and development commits, clean commits support future engineers in fixing problems more efficiently and reduce frustration in stressful situations.

Keeping commits inherently consistent streamlines work and improves comparing changes. The changes committed relate to each other and associate with the commit message. As most IDEs visualize the commit message and changes per code line, isolated commits with a well-formed commit message transparently communicate changes. Combining multiple bug fixes and feature development changes into a single commit message muddies the communicated intent of our change.

As we isolate computational changes, we also avoid wedging in housekeeping alterations. Refactors, variable or method naming updates, and whitespace fixes are committed separately from behavior updates to improve the readability of critical diffs.


When creating a PR, we do not mix solutions across tasks. If a feature happens to fix a bug, we certainly reference it, but otherwise, we create separate PRs for fixes across different bugs, work on various features, refactors of code, and whitespace issues.

An amalgamation of labor happens when we come across faulty code while working on our feature. In this case, we proceed by creating another branch from the latest main, fix the bug in question, open a PR for our fix, and integrate it into main. If our fix passes the process and tests, we rebase our feature branch to the latest main and continue our work.

The isolation of PRs increases code stability and transparency. We strive to increase productivity, not introduce unnecessary bureaucratic red tape. Frequent integrations to main executing our automated test suite help us map issues to specific implementations. Code reviews containing multiple fixes and refactors increase cognitive load and time investment by reviewers. Bug fixes or features that are mixed with whitespace alterations introduce unnecessary noise when comparing the differences to the current working solution.