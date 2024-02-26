# Code review

The practice of code review is a manual step in the CI/CD process. Our changes are inspected by another engineer for general readability and errors that slipped through our automated test suite. Everybody makes mistakes and two pairs of eyes is better than one.

Code reviews are an excellent point in time for gathering data for future automation. Identifying common mistakes and establishing automation practices to rectify these automatically for future development cycles lies at the heart of continuous improvement and the spirit of this book.

We review and improve the process of code reviews over time, as this practice has the potential to become a bottleneck for development velocity if our practices do not evolve with our needs.

## Benefits of code review

Unfortunately, code review is broadly (and misleadingly) understood to serve as a gating mechanism to assess changes by colleagues before these are added to our software product. While increasing code quality is most certainly an aspect of this practice, this kind of code "critique" thinking hampers development velocity and decreases the other beneficial factors of code reviews.

### Sharing knowledge

Whether we fix bugs or build features into our code base we expand our knowledge of the product code base and the solution for the domain problem. During the code review process we share the gained knowledge with our team members. In turn, the feedback and its resolution grows our insight into the respective domain.

Sharing knowledge horizontally moves the burden from individuals to teams, meaning even if our "specialist" is sick, on vacation, or has left our company, the work is competently done by the team.

### Building trust

Over time, having our code reviewed and reviewing our team member's code builds the mindset of a blameless culture. We dissociate our work done as being "our" code and move emotional connotations from our contributions to the work our team does as a whole.

The sooner we embrace a collective mindset, the sooner our team builds professional trust across contributors. Within an open collaborative environment, we not only share knowledge about implementations within the product; but by "showing our workings", every team member grows technical competencies.

### Increased code quality

Finally, yes, code reviews improve the quality of the code. Having multiple engineers with different experiences and backgrounds study each others work leads to implementations which are standardized, readable, and performant. A fresh pair of eyes is more likely to find potential errors.



## Types of code review

Depending on our organization's priorities we position the code review process at different stages.
Code reviews can be voluntary. We ask our colleagues to look over critical or drastic changes. Smaller changes that pass our testing suite we merge confidently.

### Pair programming

The earliest form of code review in the development cycle is practising pair programming. We partner engineers to tackle complicated or complex tasks together in the same editor. Whether sharing a physical machine, or remotely via screen share, the defining characteristic of pair programming is that only one person types.

While initially this seems as a redundancy of resources, when practicing pair programming for tasks requiring high cognitive load, the paper *The Costs and Benefits of Pair Programming* by Alistair Cockburn and Laurie Williams estimated that the overhead costs of purely development time for two developers working on a problem side-by-side are about 15% (instead of an expected 100%). These 15% are assuredly offset by the increase of code quality, code stability, and sharing of knowledge.

Alas, the relative cost of pair programming multiplies with increasing triviality of the problem.

### Pre-merge code review

Pre-merge code review are a form of manual quality assurance before approving a PR. After our changes have passed our automated test suite, we assign reviewers to the PR, who approve the code or request further changes to be made before the code is merged into main.

As we cannot expect our colleagues to be at our constant beck and call, pre-merge code review comes at the cost of development velocity. If every PR requires a review before it is merged, our integrations to main come to a halt, and the number of PRs pile up over the sprint.

Pre-merge code reviews are necessary for contributions originating from outside of our team. For organizations that do not operate in the industries of health care or aerospace engineering, reviewing every change done within a team is overkill.

### Post-merge code review

With post-merge reviews, we integrate our code changes from our development into main as soon as our automated pre-merge test suite passes. The changes are reviewed during the day at the convenience of our colleagues, and, should further changes be requested during the review, we open a new development branch to address the feedback. Post-merge reviews ensures steady development velocity, while still involving the team in changes.

Post-merge reviews are the de-facto standard for distributed teams and early stage projects.

### Eventual code review

Team internal post sprint presentations and code reviews. This process is additional to post-sprint presentations as outlined in [Planning work (WIP)]() in *The anatomy of managing a team*. Team members present their diffs since the last review in order and synchronously go over them, and, if necessary, request additional changes. This exercise can be done in parallel in small groups. In order to spread the knowledge these groups rotate.

### Choosing a strategy

[![Types of Code Review](../../../assets/images/book/anatomy-of-a-code-change/types-of-code-review.webp)](../../../assets/images/book/anatomy-of-a-code-change/types-of-code-review.png)

## Review process

We review code after it has passed our automated tests; from static analysis, over small-scoped tests and medium-scoped tests, to AI powered reviews. Frankly, it's difficult to think of a bigger waste of our engineers time than reviewing whitespace and code convention issues. These should be taken care of by automated linters and style checkers.

Every member of our team reviews code; it is not a practice done by a select few senior engineers or product owners. When we observe that a major burden of the code reviews is carried by a limited amount of colleagues, we implement processes or tools to spread review requests evenly across team members. Regardless of seniority, every engineer grows when reviewing code, or when their work is being reviewed. Relieving certain personell groups of code reviews, deprives them of professional and personal growth.

The more people we involve in code reviews, the broader we share product knowledge across the team, alas the more we potentially decelerate development velocity. When multiple people review code changes, we source them across the ends of the spectrum of seniority of disciplines. Junior engineers and senior engineers share different insights when reading code.

If possible, we prefer to do code reviews synchronously via screen share. By assessing the revisions together, we are able to discuss the work and request needed additional changes within minutes. Asynchronous reviews with comments and replies have the tendency to span days as notifications are missed. When reviewing asynchronously (e.g. due to geographic locations of team members), we move the process to post-merge, as not to hinder development.

### Giving a review

Code reviews are not the platform to discuss feature aspects or high-level implementation strategies. If we are interested in decisions made, not as an evaluation, but due to professional curiousity, we may consult the Design Document. Beyond documented decisions we always have the opportunity talk privately over a coffee to learn about the driving factors of the current solution.

A code review is not aimed to point out long-term strategies, but to highlight immediate changes necessary for the code to be executed safely and readable for immediate maintenance by members other than the original author.

When reviewing code we focus on constructive actionable feedback for improving the code, we do not direct any feedback at the person who wrote it. This practice applies to both requesting changes and approving code. We praise a person's work ("You did good work on this"), rather than the person themselves ("Good job, you are smart"). The former emphasis continued growth as a person and within a team, the latter applauds subjective work in what is a collaborative process. Letting your colleagues now the high esteem you hold them in is best left for annual performance reviews and when drinking an unprofessional amount of alcohol during a work gathering.

When requesting changes we make use of all tooling provided. From placing comments directly into the source code to typing out change suggestions.

Positive words are never wasted. When we come across work we deem pleasant, we comment upon this; be it well structured documentation, transparent tests, helpful error messages, informative design documents, or educational PR descriptions.

### Receiving a code review

First and foremost, we remove any emotional involvement into the process and our solution. The initial mindset of having ones work reviewed is comparable to being back in school and expecting favorable grades. Pre-merge mistakes in the world of professional software engineering do not lead to a failing grade, but only to professional growth. We embrace all feedback in the positive intent it was typed in.

As much as the setting is not school, it is also not a job interview. The statement "I do not understand what is happening here" is not solved by a detailed explanation in the PR comment section. Instead, we increase the readability of our work through comments, formatting, or naming, and ask whether the offending syntax is clearer now.
