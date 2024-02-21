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

linters, style checkers, and code analyzers to catch simple mistakes before manual review. use available tools, such as suggestions, AI
if a majority of reviews deal with line spaces, new lines, indentations, bracket positions, we need an automated linter


If someone does well at something and the praise they recieve is "Good hob, you're so smart", the emphasis on smartness pushes them toward a fixed mindset. If, on the other hand, someone is given the praise "Good job, you worked hard on that", they will associate the their successes with the effort they put in.

It's one thing to assume good intentions, but can we go further? What good intentions can I identify with that this person holds? What might their positive motivations be?

sync vs async

code reviews are not a platform for discussing implementation strategies

Request reviews by certain personell or personell groups. These reviews are essential for consistent high quality code integrations and horizontal distribution of knowledge. There are various strategies on who to request reviews from depending on team size and the nature of our changes.

It typically makes sense to involve people across two ends of a spectrum, e.g. one senior person and one junior person can share different insights during the review. Having people across departments review our code improves cross department collaboration and spreads the knowledge horizontally.

Should it appear that a major burden of the code reviews are done by a limited amount of number, consider implementing processes or tools that spreads review requests evenly across team members.

Feedback should be constructive and aimed at improving the code, not criticizing the person who wrote it. positive intent by the receiving party

suggest alternatives if necessary

## Receiving a code review

do not explain decisions in code review, fix code to be explanatory

positive intent by the receiving party
