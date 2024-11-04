---
title: Code Reviews
description: Beyond quality assurance, code reviews provide us a tool for encouraging blameless interaction and a blameless culture within our team.
---

# Code Reviews

The practice of code review is a manual step in the CI/CD process. Our changes are inspected by another engineer for general readability and errors that may have slipped through our automated test suite. Everybody makes mistakes, and two pairs of eyes are better than one.

Code reviews are an excellent point in time for gathering data for future automation. Identifying common mistakes and establishing automation practices to rectify these automatically for future development cycles lie at the heart of continuous improvement and the spirit of this book. We review and improve the process of code reviews over time, as this practice has the potential to become a bottleneck for development velocity if our practices do not evolve with our needs.

## Benefits of Code Review

<!-- code review in the sense of "code study" rather than "code critique" -->

Alas, it is to be said, code review is broadly (and misleadingly) understood to serve as a gating mechanism to assess changes by colleagues before these are added to our software product. While increasing code quality is most certainly an aspect of this practice, this kind of code "critique" thinking hampers development velocity and diminishes the other beneficial factors of code reviews. Beyond quality assurance, code reviews provide us a tool for encouraging blameless interaction and a blameless culture within our team.

### Sharing Knowledge

Whether we fix bugs or build features, we expand our knowledge of the product codebase and the solution for the domain problem. During the code review process, we share the gained knowledge with our team members. In turn, the feedback and its resolution grow our insight into the respective domain.

Sharing knowledge horizontally shifts the burden from individuals to teams, meaning that even if our "specialist" is sick, on vacation, or has left our company, the work is competently done by the team. As knowledge is shared horizontally, we reduce pressure on individuals and diversify responsibilities across our organization. This approach enables us to ensure consistent career progression as we remove hard dependencies of members within set positions.

### Building Trust

Over time, having our code reviewed and reviewing our team members' code builds the mindset of a blameless culture. We dissociate our work done as being "our" code and move emotional connotations from our contributions to the work our team does as a whole.

The sooner we embrace a collective mindset, the sooner our team builds professional trust across contributors. Within an open collaborative environment, we not merely share knowledge about implementations within the product; but by "showing our workings", every team member refines their technical competencies.

Teams that build in public, share work-in-progress, and confidently ask for the opinions of their peers uncover potential concerns earlier in the development phase and thus reduce the overall cost of producing working software.

### Increased Code Quality

Ultimately, yes, code reviews directly improve the quality of the code at hand. Having multiple engineers with different experiences and backgrounds study each other's work leads to implementations that are standardized, readable, and efficient. A fresh pair of eyes is more inclined to find potential errors.

The immediate increase in code quality comes at an expense. It is our responsibility to measure and evaluate the short-term and long-term benefits of code reviews on the impact of development velocity. The next section describes different shapes of code review and the merits and drawbacks they coalesce.

## Types of Code Review

Code reviews come in different shapes and sizes, and it is up to us to establish suitable processes for our teams and products.

### Pair Programming

During pair programming, we partner engineers to develop complicated or complex tasks together in the same editor. Whether sharing a physical machine or remotely via screen share, the defining characteristic of pair programming is that a single person types.

While initially, this seems like a redundancy of resources, when practicing pair programming for tasks requiring high cognitive load, the paper *The Costs and Benefits of Pair Programming* by Alistair Cockburn and Laurie Williams estimated that the overhead costs of purely development time for two developers working on a problem side-by-side are about 15% (instead of an expected 100%). These 15% are assuredly offset by the increase in code quality, code stability, and sharing of knowledge.

The relative cost of pair programming multiplies with increasing triviality of the problem and is thus best reserved for consuming cognitive conundrums. The technique limits the gains of collaboration and the exchange of knowledge to the two participating parties.

### Pre-Merge Review

Pre-merge code reviews are a form of manual quality assurance before approving a PR. After our changes have passed our automated test suite, we assign reviewers to the PR, who approve the code or request further changes to be made before the code is merged into main.

As we cannot expect our colleagues to be at our constant beck and call, pre-merge code review comes at the cost of development velocity. If every PR requires a review before it is merged, our integrations to main come to a halt, and the number of PRs piles up over the sprint.

Pre-merge code reviews are necessary for contributions originating from outside of our team. For organizations that do not operate in the industries of health care or aerospace engineering, reviewing every change done within a team is overkill.

### Post-Merge Review

With post-merge reviews, we integrate our code changes from our development into main as soon as our automated pre-merge test suite passes. The changes are reviewed within a reasonable time at the convenience of our colleagues. Should further changes be requested during the review, we open a new development branch to address the feedback.

Post-merge reviews ensure steady development velocity, while still involving the team in changes and are the de-facto standard for distributed teams and early stage projects. Although immediacy of reviews is less of an issue compared to pre-merge reviews, we benefit from tooling to distribute reviews evenly across the team and remind us of assigned reviews.

### Eventual Review

Team internal post-sprint presentations and code reviews. This process is additional to post-sprint presentations as outlined in [Planning work (WIP)]() in *Collaborating within a Team*. Team members present their diffs since the last review in order and synchronously go over them, and, if necessary, request additional changes. The difference to post-merge reviews is that eventual reviews are a scheduled event in which the entire team participates.

To minimize the impact on time, this exercise can be done in parallel in small groups. We shuffle the members for small groups in order to spread the knowledge across our team. This type of code review covers multiple changes over a period of time, and we may block an appropriate amount of hours to review the changes synchronously.

The eventual code review presents the code within the full context it is being executed, but due to the scope of the changes, it is made up of ambiguous diffs. Successful eventual code reviews rely on the discipline of our team and consistent accommodation within our sprint plans.

### Choosing a Strategy

We mold our strategy to the needs of our product lifecycle, team composition, team distribution, and industry, and review code at the relevant stages of our integration process. While there's an argument to be made that pair-programming teams present their work to the team down the line, we do not stack code reviews for a set of changes. Code review strategies are not accumulative.

[![Types of Code Review](../../../assets/images/book/collaborating-within-a-codebase/types-of-code-review.webp)](../../../assets/images/book/collaborating-within-a-codebase/types-of-code-review.png)

Pair programming tackles complex tasks efficiently; high-security teams benefit from pre-merge reviews; post-merge reviews support high-velocity teams and teams distributed across time zones; periodical planned eventual reviews work great for established products and teams comprised of senior engineers.

## Review Process

<!-- vale write-good.Weasel = NO -->
<!-- Frankly -->
We review code after it has passed our automated tests; from static analysis, over small-scoped tests and medium-scoped tests, to AI-powered reviews. Frankly, it's difficult to think of a bigger waste of our engineers' time than reviewing whitespace and code convention issues. These should be taken care of by automated linters and style checkers.
<!-- vale write-good.Weasel = YES -->

Every member of our team reviews code; it is not a practice done by a select handful of senior engineers or product owners. When we observe that a major burden of the code reviews is carried by a limited number of colleagues, we implement processes or tools to spread review requests evenly across team members. Regardless of seniority, every engineer grows when reviewing code or when their work is being reviewed. Relieving certain personnel groups of code reviews deprives them of professional and personal growth.

The more people we involve in code reviews, the broader we share product knowledge across the team, alas the more we potentially decelerate development velocity. When multiple people review code changes, we source them across the ends of the spectrum of seniority of disciplines. Junior engineers and senior engineers share different insights when reading code.

If possible, we prefer to do code reviews synchronously via screen share. By assessing the revisions together, we are able to discuss the work and request needed additional changes within minutes. Asynchronous reviews with comments and replies have the tendency to span days as notifications are missed. When reviewing asynchronously (e.g., due to geographic locations of team members), we move the process to post-merge, as not to hinder development.

### Giving a Review

Code reviews are not the platform to discuss feature aspects or high-level implementation strategies. If we are interested in decisions made, not as an evaluation, but due to professional curiosity, we may consult the Design Document. Beyond documented decisions, we always have the opportunity to talk privately over a coffee to learn about the driving factors of the current solution.

A code review is not aimed to point out long-term strategies but to highlight immediate changes necessary for the code to be executed reliably and be readable for immediate maintenance by members other than the original author.

<!-- vale Vale.Avoid = NO -->
<!-- you -->
When reviewing code, we focus on constructive actionable feedback for improving the code; we do not direct any feedback at the person who wrote it. This practice applies to both requesting changes and approving code. We praise a person's work ("You did good work on this"), rather than the person themselves ("Good job, you are smart"). The former emphasizes continued growth as a person and within a team, the latter applauds subjective work in what is a collaborative process. Letting our colleagues know the high esteem we hold them in is best left for annual performance reviews and when drinking an unprofessional amount of alcohol during a work gathering.
<!-- vale Vale.Avoid = YES -->

When requesting changes, we make use of all tooling provided. From placing comments directly into the source code to typing out change suggestions.

Positive words are never wasted. When we come across work we deem pleasant, we comment upon this; be it well-structured documentation, transparent tests, helpful error messages, informative design documents, or educational PR descriptions.

### Receiving a Code Review

We prepare by removing any emotional involvement in the process and our solution. The initial mindset of having one's work reviewed is comparable to being back in school and expecting favorable grades. Pre-merge mistakes in the world of professional software engineering do not lead to a failing grade but to professional growth. We embrace all feedback in the positive intent it was typed in.

As much as the setting is not school, it is also not a job interview. The statement "I do not understand what is happening here" is not solved by a detailed explanation in the PR comment section. Instead, we increase the readability of our work through comments, formatting, or naming, and ask whether the offending syntax is clearer after our edits.
