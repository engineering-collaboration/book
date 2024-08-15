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

Tasks / Subtasks
Dailies are a waste of time
Identify blockers
keep it to 60 seconds per person, if longer have a separate meeting
If needed daily keep it written
Help identify potential distractions, e.g. hat to help X, Y reached out for support, I am working on Z with U
Making sure people do not get off task too much or create major sub tasks; we can add these to next sprint

Who are tickets for. Tickets are not engineering oriented. Any information relating to code, stored away from code is useless. Authorization, platform migration, searchability. We cover this in detail in Part II.

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

## careful on creating new tickets for

technical debt
refactoring
irrelevant bugfixes
