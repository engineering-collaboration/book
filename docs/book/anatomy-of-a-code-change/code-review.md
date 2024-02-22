# Code review

learn from previous reviews and use this knowledge to improve the code review process. This includes identifying common mistakes and establishing good practices for code development.

## Benefits of code review

Code review is mainly understood to serve as a gating mechanism to assess changes by colleagues before these are added to our software product. While increasing code quality is most certainly an aspect of this practice, this kind of code "critique" thinking hampers development velocity and decreases the other beneficial factors of code reviews.

### Sharing knowledge

Whether we fix bugs or build features into our code base we expand our knowledge of the product code base and the solution for the domain problem. During the code review process we share the gained knowledge with our team members. In turn, the feedback and its resolution grows our insight into the respective domain. Sharing knowledge horizontally moves the burden from individuals to teams, meaning even if our "specialist" is sick, on vacation, or has left our company, the work is competently done by the team.

### Building trust

Over time, having our code reviewed and reviewing our team member's code builds the mindset of a blameless culture. We dissacioate our work done as being "our" code and move emotional connotations from our contributions to the work our team does as a whole. The sooner we embrace a collective mindset, the sooner our team builds professional trust across incidividual contributors. Within an open collaborative environment, we not only share knowledge about implementations within the product; but by "showing our workings", every team member grows technical competencies.

### Increased code quality

## Types of code review

Depending on our organization's priorities we position the code review process at different stages.
Code reviews can be voluntary. We ask our colleagues to look over critical or drastic changes. Smaller changes that pass our testing suite we merge confidently.

### Pair programming

The earliest form of code review in the development cycle is practising pair programming. We partner engineers to tackle complicated or complex tasks together in the same editor. Whether sharing a physical machine, or remotely via screen share, the important characteristic is that only one person types.

While initially this seems as a reduncancy of resources, when practicing pair programming for tasks requirign high cognitive load, the development time is shortened and the resulting code quality is improved.

**The Costs and Benefits of Pair Programming**  
Alistair Cockburn and Laurie Williams  

### Pre-merge code review

As we cannot expect our colleagues to be at our constant beck and call, pre-merge code review comes at the cost of development velocity. If every PR requires a review before it is merged, our integrations to main come to a halt, and the number of PRs pile up over the sprint. Pre-merge code reviews are necessary for contributions originating from outside of our team, but if our organization does not operate in the industries of health care or aerospace engineering, reviewing every change done by our team is overkill.

### Post-merge code review

With post-merge reviews, we integrate our code changes from our development into main as soon as our automated pre-merge test suite passes. The changes are reviewed during the day at the convenience of our colleagues, and, should further changes be requested during the review, we open a new development branch to address the feedback. Post-merge reviews ensures steady development velocity, while still involving the team in changes.

### Eventual code review

Team internal post sprint presentations and code reviews. This process is additional to post-sprint presentations as outlined in [Planning work (WIP)]() in *The anatomy of managing a team*. Team members present their diffs since the last review in order and synchronously go over them, and, if necessesary, request additional changes. This exercise can be done in parallel in small groups. In order to spread the knowledge these groups rotate.

## Reviewing code

We review code as soon as it has passed our automated tests; from static analysis, over small-scoped tests and medium-scoped tests, to AI powered reviews. Frankly, it's difficult to think of a bigger waste of our engineers time than reviewing whitespace and code convention issues. These should be taken care of by automated linters and style checkers.

Every member of our team reviews code; it is not a practice done by a select few senior engineers or product owners. When we observe that a major burden of the code reviews is carried by a limited amount of colleagues, we implement processes or tools to spread review requests evenly across team members. Regardless of seniority, every engineer grows when reviewing code, or when their work is being reviewed. Relieving certain personell groups of code reviews, deprives them of professional and personal growth.

The more people we involve in code reviews, the broader we share product knowledge across the team, alas the more we potentially decelerate development velocity. When multiple people review code changes, we source them across the ends of the spectrum of seniority of disciplines. Junior engineers and senior engineers share different insights when reading code.

Code reviews are not the platform to discuss feature aspects or high-level implementation strategies. If we are interested in decisions made, not as an evaluation, but due to professional curiousity, we may consult the Design Document. Beyond documented decisions we always have the opportunity talk privately over a coffee to learn about the driving factors of the current solution.

A code review is not aimed to point out long-term strategies, but to highlight immediate changes necessary for the code to be executed safely and readable for immediate maintenance by members other than the original author.

If possible, we prefer to do code reviews synchronously via screen share. By assessing the revisions together, we are able to discuss the work and request needed additional changes within minutes. Asynchronous reviews with comments and replies have the tendency to span days as notifications are missed. When reviewing asynchronously (e.g. due to geographic locations of team members), we move the process to post-merge, as not to hinder development.

When reviewing code we focus on constructive actionable feedback for improving the code, we do not direct any feedback at the person who wrote it. This practice applies to both requesting changes and approving code. We praise a person's work ("You did good work on this"), rather than the person themselves ("Good job, you are smart"). The former emphasis continued growth as a person and within a team, the latter applauds subjective work in what is a collaborative process. Letting your colleagues now the high esteem you hold them in is best left for annual performance reviews and when drinking an unprofessional amount of alcohol during a work gathering.

When requesting changes we make use of all tooling provided. From placing comments directly into the source code to typing out change suggestions.

Positive words are never wasted. When we come across work we deem pleasant, we comment upon this; be it well structured documentation, transparent tests, helpful error messages, informative design documents, or educational PR descriptions.

## Receiving a code review

do not explain decisions in code review, fix code to be explanatory

positive intent by the receiving party
