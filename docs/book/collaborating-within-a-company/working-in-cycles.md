<!-- TODO: (Daniel) Planning quaterly goals
  Points or star method
  map points to product feature
  keep mapping anonymous to avoid horizotnally distributing points
  plan features according to priorities of customers
 -->

# Working in cycles

<!-- What is a sprint -->

Any work we do passes through three phases: planning, execution, and retrospective. Within software engineering we commonly refer to this cycle as a *sprint*. Depending on the maturity of our product and organization, a single sprint cycle typically runs for one to four weeks. The younger our project, the shorter the sprint cycles.

By planning and sanctioning our tasks for the next weeks, we can concentrate on executing them with minimal distractions. When a sprint plan is approved, we do not pivot or change tasks mid-sprint. Only immediate and urgent issues, so called *show stoppers*, interrupt our sprint with. Show-stoppers include crashes we can not recover from, they do not include customer feedback, bug reports, or inconveniences.

Anything that can wait a week, can wait two, and we file the new task to be part of the next sprint cycle. Pivoting our attention to unexpected tasks leads to expensive context changes and stalls any progress on our tasks. If other people depend on our changes, we pass additional delays down the chain.

Thus our short- to mid-term tasks need to cover our customers and organization's needs but stay flexible enough to pivot in case we need to react to changing circumstances. Alas, we do not become to reactionary, as constantly pivoting means we do not progress to any goal. Knowing when to steady a course and when to charter a new one, largely relies on industry insights, experience, and luck. None of which are part of this chapter.

We complete a sprint cycle with a retrospective session. These sprint conclusions fulfill two points. Firstly, we have the chance to reflect upon our work and share our insights on things that went well, and things that did not. This includes, mistakes we made personally, communication we wish we had done sooner or avoided entirely, tooling that was missing needed functionality, time sinks we may anticipate next time.

Secondly, sprint retrospectives allow us to evangelize our work internally. We write memos, create screen recordings and images of our work, provide demos and share these within and across teams. Informing our current work avoids duplicate work within our organization, plus we can consolidate feedback and additional use cases from other teams.

<!-- What is a sprint NOT -->

Opposed to the writings in popular manifestos, a sprint cycle has no relationship to the deliverable of our software. Scrum and Agile practices preach sprints as a framework of delivering shippable packages every sprint for feedback cycles.

The goal of a sprint is not to deliver software packages ready to be shipped. Our software is shippable multiple times a day. We discuss this further in Part II. For the majority of software, a feedback cycle measured in weeks is unacceptable.

## Planning

Sprints begin with the planning phase in which we estimate and designate tasks with our team members. In our industry, we refer to these tasks as *tickets*. Tickets consist of bug reports, feature requests, and our feature roadmap. Larger organizations with a lot of inter-team communication the team lead creates the tickets. In smaller organizations the team members themselves write these tickets.

Before every sprint, team leads map tasks to be completed with the available resources for the next two quarters. Team leads plan sprints and create backlog. 

The ticket assignment happens during the sprint kickoff meeting. All team members are present for the duration of the meeting. We sequentially go through our team and collectively estimate the effort of the ticket, agree on the priority and the engineer or engineers working on it.

Not uncommonly, people might disagree on the tickets and their priorities. Ultimately, it is up to whoever makes the decision. If it is the team lead, they have the most information. If it is the group, either the domain expertise wins, or the most votes, or the product person. We define this in our guidelines.

Who are tickets for.

### Estimating work

Humans are remarkably bad at estimating work. That and evaluating statistical impact. That particular skill apparently never improved our survival rate as a species. Besides not being able to predict the actual time it takes to execute work, we severely underestimate other noise and distractions in our lives that hinders our progress.

In order to achieve a somewhat usable (yet still pretty inaccurate) estimate, we can employ two tools that have gained popularity over the years. The first one is slightly tainted with ill-repute and causes involuntary reactions of ill-well. Another term tainting the back of our tongue with bile is *Story points*.

Please, take a moment to breathe and rest assured we do not convert our readers to the church of Agile. Zealous practices find little foothold within *Engineering Collaboration*. Story points have been banished to the managerial vocabulary, joining horrendous terms, such as *burn charts*.

Story points are an arbitrary unit to measure development velocity. While every developer has an internal mapping of a story point equals roughly half a day to a day, we have already established, that we are horrible at mapping work load to work time. The additional layer of abstraction between unit of time and unit of velocity allows us to discretely measure velocity across sprints. After a certain amount of sprints we can realistically deduce how many story points our team can achieve per sprint and share realsitic plans and expectations.

Story points only work team internally. Story points cannot be directly used as a measurement for productivity across teams. The mix of tools, communication channels, personalities, infrastructure deployments, office layouts, etc are likely to be unique to our team. Comparing story points across teams is as useful information as comparing the shoe sizes across teams.

The second tool at our disposal is group estimates. "Find and insert study of groups averages accurately being able to estimate M7Ms in a jar and the weight of a cow". When assigning story points, all developers add their estimate to a poll and we select the average or median, whichever is more appropriate.

Finally, as a team lead, we plan for unexpected work. People get distracted, called into additinoal meetings, receive "quick" support requests, have family emergencies, get sick, hurt, and hungover.

## Execution

The sprint planning completed, we start executing our tasks. Head down and get some work done. Individual contributors work on their task and in doing so uncover and solve additional problems. Assigned tasks get broken down into smaller subtasks and are implemented regularly. Part II covers the entire lifecycle of a code change. Tech leads and managers remove any blockers that come up and ensure their team members have all the information, contacts, and context in order to fulfill their tasks.

### Communicating progress

Not supervision, but rather everybody is on the same page. Different context, different amount of information. Avoiding duplicate work or learnings.
Checkign for blockers. Everybody can reach out on their own at any time anyway, we're all adults.
Overcommunicate
actively communicate
ask for clarification

Who are tickets for. Tickets are not engineering oriented. Any information relating to code, stored away from code is useless. Authorization, platform migration, searchability. We cover this in detail in Part II. Engineer - Details, libraries, implementation
Implementation details, algorithms, open source libraries vs building

#### Kanban

Kanban boards have gained popularity over the last decade and all modern task management platforms offer a Kanban view. They visualize tasks as cards that can be placed within one of several columns. The columns represent the state the task is currently in. Typical states are "TODO", "In progress", "In review", "Completed", but any team can create an arbitrary set of columns.

![Representation of a kanban board, with four columns showing stages of a workflow, with various cards scattered across the board.](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Abstract_Kanban_Board.svg/2880px-Abstract_Kanban_Board.svg.png)

The visual simplicity of Kanban boards communicates the progress of a team member's workload at a glance. They are easy to update and maintain, as we just drag and drop cards between columns without the need of devoting cognitive load to communication. Kanban boards act as early warnings for problems in development processes if too many cards are "stuck" in a certain column. Too many cards in the "In progress" section indicate a wide spread of responsibilities that trigger expensive context switching. Bottle necks in the "In Review" column inform us to review our review process as it may no longer not match our teams current needs. 

#### Journals

<!-- TODO: Move below to written daily status updates -->

A daily account of what we have been working on and struggling with. We can adapt the shape of our Jounrals to the needs of our team. We articulate our progress in emails, messaging threads, group spaces on Google Docs, Confluence, or Notion, or dedicated spaces per person.

Most people take notes privately and may forget to copy over their progress into a journaling system.

Use a messaging app. People do not open emails or go to specific Confluence pages.


#### Daily status updates

The most common synchronous way of sharing progress with our lead and our team members is via daily stand-up meetings. Once a day the entire team gathers to share their progress by answering three question:

- What did I work on yesterday?
- What am I working on today?
- Do I have any blockers?

The titular practice of standing during these meetings indicate the brevity of these get-togethers. Don't even bother sitting down. In practice we aim for a maximum of 60 seconds per person. A team consisting of ten people should last no longer than ten minutes. Naturally, when sharing difficulties we are experiencing with a problem, we turn to our team for help. However, we do not discuss the solution of a problem in the stand-up meeting, but ask for a quick dedicated call after the stand-up.

If the conclusion does not happen naturally, e.g. "I would like to hear how you solved this last time. Let's have a call after the meeting", it is the responsibility of the person leading the meeting to request that we move on.

Have dailies in the mornings, if plannable, if distributed, we don't really have a choice.

Prepare for dailies

The shorthand "dailies" has found common use, even if not done on a daily basis. Some teams find more success by avoiding costly context switches on a daily basis by dedicating three days a week, Monday, Wednesday, Friday to synchronous meetings and defer to written status updates on Tuesday and Thursday.

As a team we continously communicate with each other regardless what our calendar dictates. It is responsibility of our leaderhsip to ensure relevant communication channels.

Engineers inform each other, solve together

#### As a lead

As team leads we use these meetings to keep an eye out for the following things:

We ensure none of our team members has any blocking issues and we try to prevent blovcking issues if we anticipate them. We do not have to be reactive.
We verify the progress achieved with the remaining sprint duration and keep track what we can and cannot realistically achieve. We do not want our team to be the source of suprises when reporting our status to our department head.
We keep an eye out for distractions and additional workload. While we cannot and should not control the complete flow of information and support, we cannot have direct support requests from other teams go directly to our engineers and eat up half their development time.
Our sprint plan is a best effort and likely changes across the sprint. Together with our engineers we reshape our sprint or backlog if a certain task becomes more effort than anticipated. We can offer additional context on what exactly is needed for an MVP and what features we can add to the backlog.
A lot of engineers take pride in the quality of their work, which is not necessarily in the best interest of the product. We sell a product, not lines of code.
Functioning code with tech debt over unfinished code beautifully refactored.

## Retrospective

At the end of a sprint cycle we dedicate time to review our successes and potential improvements as a team. What went well, what could have gone better, and how can we learn from the experience? We put these findings to (digital) paper and revisit our findings to identify positive changes over time or a lack thereof. Over or under estimating work, mistakes in approaching a aprticular problem, Organizational problems may come in form of bottle necks in communication, integration, or release processes.

Positive experiences can be Getting inspired of other teams or other peoples approach to engineering, trying to replicate or expand these findings across our team and codebase.

Besides improving future work, we use the end of sprint cycles to evangelize our work within our team and beyond. Every team member creates a demo, write-up, screen recording of their work and presents it in five minutes to the rest of the team and ainvited stakeholders. These meetings consists of our team and all additional stake holders of a project. We collect the shared materials and record the meeting and share it within the organization.

Evangelizing the work done within a team demonstrates multiple upsides. It is an exciting way to communicate progress and value throughout our organization. It encourages cross team interest, feedback, and collaboration for shared problems and usecases. It reduces duplicate work. It encourages innersourcing practices where we first look for existing solutions within our company, before building something new. A internal platform with properly evangelized work can cut down two sprint cycles of a different team. That's a lot of time and effort we can use to better our product.

## Cycle duration

Our sprint's duration depends on the needs of our organization and our product and ranges from one week to three weeks. Shorter than a week no relevant work gets done, longer than three weeks and we diminish our ability to react.

Sprint length typically grows with our organization's size and maturity. Start-ups need to address feedback from customers and investors quickly, so priorities can shift on a weekly basis. Again, we do not just drop our current tasks because a user reported a bug with low severity. Scale-ups introduce additional work force and overhead so weekly sprint planning and retrospection hinders work rather than fosters growth and may move to sprint cycles of two weeks. Enterprise scale organizations have established with predictable workloads. The main challenge here lies within innersourcing and communication. But we can work on our product without surprises or pivots. We benefit from three weeks of uninterrupted changes.

Sprint cycles do not have to begin on a Monday. Monday and Friday are excellent buffer days to polish work, demos, prepare screen recordings, apply code review feedback, write additional documentation.

## Measuring productivity

Performance evaluation is an emotional topic which relies heavily on empathy. Over the years various companies implemented varioations of metric based performance evaluations to varying degrees of failure. Our continous ambition of trying to measure individual productivity and performance unveilied a plethora of metrics that do NOT work. These include lines of code written, lines of code deleted, story points completed in a sprint, story points pushed over to next sprint, number of bug reports closed, number of bug reports opened, and the paradoxical list goes on and on.

The inherent problem is that when things go well, there is very little to measure. And any metrics we do account for are diffictult to accopunt to any particular individual. Increased customer churn could well be attributed to a lack of feature, it can also be a problem in pricing, promises by the sales team, marketing in the wrong channels, or our CEO's social media use.



We want our employees to be focused on delivering quality work for our product. Not on focusing to optimize their productivity for internal metrics.

progress over activity

owning an issue, rather than hitting a deadline

technical debt
refactoring
irrelevant bugfixes
