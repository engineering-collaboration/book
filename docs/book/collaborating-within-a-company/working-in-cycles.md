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

Who are tickets for. Tickets are not engineering oriented. Any information relating to code, stored away from code is useless. Authorization, platform migration, searchability. We cover this in detail in Part II.

#### Kanban

Kanban boards have gained popularity over the last decade and all modern task management platforms offer a Kanban view. They visualize tasks as cards that can be placed within one of several columns. The columns represent the state the task is currently in. Typical states are "TODO", "In progress", "In review", "Completed", but any team can create an arbitrary set of columns.

![Representation of a kanban board, with four columns showing stages of a workflow, with various cards scattered across the board.](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Abstract_Kanban_Board.svg/2880px-Abstract_Kanban_Board.svg.png)

The visual simplicity of Kanban boards communicates the progress of a team member's workload at a glance. They are easy to update and maintain, as we just drag and drop cards between columns without the need of devoting cognitive load to communication. Kanban boards act as early warnings for problems in development processes if too many cards are "stuck" in a certain column. Too many cards in the "In progress" section indicate a wide spread of responsibilities that trigger expensive context switching. Bottle necks in the "In Review" column inform us to review our review process as it may no longer not match our teams current needs. 

#### Journals

A daily account of what we have been working on and struggling with. We can adapt the shape of our Jounrals to the needs of our team. We articulate our progress in emails, messaging threads, group spaces on Google Docs, Confluence, or Notion, or dedicated spaces per person.

Most people take notes privately and may forget to copy over their progress into a journaling system. 


#### Dailies

The most common synchronous way of sharing progress with our lead and our team members is via daily stand-up meetings. Once a day the entire team gathers to share their progress by answering three question:

- What did I work on yesterday?
- What am I working on today?
- Do I have any blockers?

The titular practice of standing during these meetings indicate the brevity of these get-togethers. Don't even bother sitting down. In practice we aim for a maximum of 60 seconds per person. A team consisting of ten people should last no longer than ten minutes. Naturally, when sharing difficulties we are experiencing with a problem, we turn to our team for help. However, we do not discuss the solution of a problem in the stand-up meeting, but ask for a quick dedicated call after the stand-up.

If the conclusion does not happen naturally, e.g. "I would like to hear how you solved this last time. Let's have a call after the meeting", it is the responsibility of the person leading the meeting to request that we move on.

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

presenting work
evangelizing work just as important as working on features
sharing progress
how long are sprints
presentations vs screenrecordings

startups need short sprints (1 week) need to pivot, address feedback
enterprises benefit from 3 week sprints of uninterrupted changes
don't start sprints on mondays or fridays
thursday or tuesday are good days.

Engineer - Details, libraries, implementation
Implementation details, algorithms, open source libraries vs building

## Measuring productivity

We want our employees to be focused on delivering quality work for our product. Not on focusing to optimize their productivity for internal metrics.

progress over activity

owning an issue, rather than hitting a deadline

## careful on creating new tickets for

technical debt
refactoring
irrelevant bugfixes
