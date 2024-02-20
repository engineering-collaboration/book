# Code review

## When

Depending on our organization's priorities we position the code review process at different stages.

Pair programming

As we cannot expect our colleagues to be at our constant beck and call, pre-merge code review comes at the cost of development velocity. If every PR requires a review before it is merged, our integrations to main come to a halt, and the number of PRs pile up over the sprint. Pre-merge code reviews are necessary for contributions originating from outside of our team, but if our organization does not operate in the industries of health care or aerospace engineering, reviewing every change done by our team is overkill.

With post-merge reviews, we integrate our code changes from our development into main as soon as our automated pre-merge test suite passes. The changes are reviewed during the day at the convenience of our colleagues, and, should further changes be requested during the review, we open a new development branch to address the feedback. Post-merge reviews ensures steady development velocity, while still involving the team in changes.

Team internal post sprint presentations and code reviews.


Code reviews can be voluntary. We ask our colleagues to look over critical or drastic changes. Smaller changes that pass our testing suite we merge confidently.



---

protect main branch
horizontal knowledge of product implementation
remove association of "my code"
build trust and knowledge by "show my workings"

pre-merge review vs post-merge vs dev pair programming vs every 2 sprints
open-source vs team
sync vs async

do not explain decisions in code review, fix code to be explanatory

code reviews are not a platform for discussing implementation strategies

linters, style checkers, and code analyzers to catch simple mistakes before manual review. use available tools, such as suggestions, AI
if a majority of reviews deal with line spaces, new lines, indentations, bracket positions, we need an automated linter

Request reviews by certain personell or personell groups. These reviews are essential for consistent high quality code integrations and horizontal distribution of knowledge. There are various strategies on who to request reviews from depending on team size and the nature of our changes.

It typically makes sense to involve people across two ends of a spectrum, e.g. one senior person and one junior person can share different insights during the review. Having people across departments review our code improves cross department collaboration and spreads the knowledge horizontally.

Should it appear that a major burden of the code reviews are done by a limited amount of number, consider implementing processes or tools that spreads review requests evenly across team members.

Feedback should be constructive and aimed at improving the code, not criticizing the person who wrote it. positive intent by the receiving party

suggest alternatives if necessary

learn from previous reviews and use this knowledge to improve the code review process. This includes identifying common mistakes and establishing good practices for code development.

---

If someone does well at something and the praise they recieve is "Good hob, you're so smart", the emphasis on smartness pushes them toward a fixed mindset. If, on the other hand, someone is given the praise "Good job, you worked hard on that", they will associate the their successes with the effort they put in.

It's one thing to assume good intentions, but can we go further? What good intentions can I identify with that this person holds? What might their positive motivations be?
