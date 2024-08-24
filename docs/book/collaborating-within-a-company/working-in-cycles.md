<!-- TODO: (Daniel) Planning quaterly goals
  Points or star method
  map points to product feature
  keep mapping anonymous to avoid horizotnally distributing points
  plan features according to priorities of customers
 -->

# Working in cycles

<!-- What is a sprint -->

Any significant work passes through three phases: planning, execution, and reflection. We determine what we want to achieve, do the work, and verify whether we completed our objective and if we can improve our approach. Within software engineering we commonly refer to this cycle as a *Sprint*.

<!-- Stick to the plan -->

By coordinating and planning our tasks for the next weeks, we can concentrate on executing them with minimal distractions. After agreeing on a sprint plan, we do not change what we work on mid-sprint, except for immediate and urgent issues. These issues, called *showstoppers*, consist of severe issues and crashes which our software cannot recover from and leaves our customers unable to continue their operations.

Showstoppers do not include customer feedback, bug reports, or user inconveniences; anything with a work-around can wait a cycle. Instead of working on incoming non-severe issues, we include them in our next sprint cycle's planning. Pivoting our attention across unexpected tasks leads to expensive context changes. We run the risk of becoming to reactionary and hinder our progress on our current goal. This becomes especially costly when other people depend on our work, as we effectively stall development across teams.

<!-- Reflect on the work done -->

We complete a sprint cycle by reflecting on our work during a retrospective session. These scheduled conclusions to a sprint accomplish two functions. Firstly, we have the chance to share our insights on things that went well, and things that did not, including mistakes we made personally, or company tooling with missing functionality, insights and information we wish we had had sooner, or conversations we could have avoided entirely, unexpected development friction, and time sinks we may anticipate next time.

Secondly, sprint retrospectives enable us to evangelize our work internally. We showcase screen recordings and images of our work, provide demos and distribute these within and across our teams. Sharing our progress and future plans with other teams potentially avoids duplicate work done within our organization. Plus, we can consolidate feedback and additional use cases from other teams and identify innersourcing opportunities.

<!-- What a sprint is NOT -->

Fashionable Scrum and Agile practices preach sprints as a framework for delivering binaries every sprint for feedback cycles. This is nonsense. As high-performing teams we ship our software when needed (as often as multiple times per day), as a feedback cycle measured in weeks is unacceptable for the majority of software. Part II of this book discusses our approach for continuous delivery in detail, but presently we establish that **a sprint cycle has no relationship with the delivery of our software**.

## Planning

Before a sprint cycle, our team leads work with our product stakeholders to prioritize immediate tasks and create a *backlog*, a list of outstanding things to do. Our team leads refine bigger backlog items into granular actionable items, broadly called *tickets*. Tickets cover bug reports, support requests, and feature implementation.

We start sprints with a kick-off meeting in which we discuss the tasks within the team. Our team leads pre-assign tickets to the team members that most match the tasks domain. During the kick-off meeting, we might decide to redesignate certain tasks to upskill team members, spread knowledge horizontally, or distribute an unusual amount of domain work across the team.

All team members are present for the duration of the meeting. Every individual contributor describes their task to the team, after which we estimate the workload as a group. Presenting our tickets to the team ensures we collectively have an idea about our team's current responsibilities and progress.

### Estimating work

Humans are remarkably bad at estimating work. It's a skill that we simply cannot intuit. Besides not being able to predict the actual time it takes to execute work, we severely underestimate the noise and distractions in our lives that hinders our progress.

<!-- Intuitive estimation -->

In order to achieve a somewhat usable estimate, we first tune our initial assessment. We consider how long a task would take us to complete, then double it, then add half of the original estimate again as buffer. For example, If we believe we can deliver a feature in two days, we double it to four, then add another day as buffer. While this might seem excessive, we will find this to be true more often than not.

<!-- Wisdom of the crowds -->

<!-- 👇 current editing process -->

In their book *Noise: A Flaw in Human Judgement*, *Daniel Kahneman*, *Olivier Sibony*, and *Cass R. Sunstein* discuss how individual judgement and estimates tend to be so unpredictable they border on the random. Every decision is affected by a person's mood, breakfast intake, weather, spousal discourses, and numerous subtle influences we do not consciously control. When asked to judge the workload for a change mere days after one another, the estimate differs significantly.

Classifying human judgement as random allows us to gather data and use statistical sampling to obtain numerical results. The book *Noise* covers the experiment demonstrating the so-called the Wisdom of the Crowds effect: *"In 1907, Francis Galton, [...] asked 787 villagers at a country fair to estimate the weight of a prize ox. None of the villagers guessed the actual weight of the ox, which was 1,198 pounds, but the mean of their guesses was 1,200, just 2 pounds off [...]"*

The Wisdom of the Crowds is a natural phenomena where the average educated guess of a group of people becomes surprisingly accurate to the actual result. We can leverage that effect by having all our team members estimate the workload of a ticket and averaging the result. To avoid influencing each other, we give these estimates independently from each other in a poll before revealing the result.

<!-- Story points -->

Another option to increase the quality of our estimates is by introducing a layer of abstraction on how we measure progress. A popular, yet divisive, practice is the use of *Story Points*. These represent an arbitrary unit of measurement for development velocity. Instead of calculating our workload in time, e.g. hours or days, we estimate our tasks in *Story Points*. These have no real-life counterpart and it is impossible to determine whether our estimation was wrong.

While every developer has an internal mapping of what a story point represents to them, we have already established, that we are horrible at mapping work load to work time. The additional layer of abstraction between unit of time and unit of velocity allows us to measure velocity across sprints. After a certain amount of sprints we can realistically deduce how many story points our team can achieve per sprint and share realsitic plans and expectations, even if we internally misjudge our workload.

Story points only work team internally. Story points cannot be directly used as a measurement for productivity across teams. The mix of tools, communication channels, personalities, infrastructure deployments, office layouts, etc are likely to be unique to our team. Comparing story points across teams is as useful as comparing shoe sizes across teams.

<!-- Fibonacci sequence -->

Predicting the future with our arbitrary estimations makes us uncomfortable. It feels unscientific. Thus, we employ mathematical guidelines to structure our story point estimations, the Fibonacci sequence. A numerical pattern in which each number is the sum of the two preceding ones, e.g. the sequence starts with [ 1, 2, 3, 5, 8, 13, 21 ]. After doubling our estimation and adding a buffer we select the Fibonacci number of the nearest higher value. If we believe we can deliver a feature in seven story points, we double and buffer the number to seventeen, then select twenty-one as our final estimate.

<!-- Unplanned work -->

Finally, as a team lead, we plan for unexpected work. People get distracted, called into additinoal meetings, receive "quick" support requests, have family emergencies, get sick, hurt, and hungover.

## Execution

The sprint planning completed, we start executing our tasks. Head down and get some work done. Individual contributors work on their task and in doing so uncover and solve additional problems. Assigned tasks get broken down into smaller subtasks and are implemented regularly. Part II covers the entire lifecycle of a code change. Tech leads and managers remove any blockers that come up and ensure their team members have all the information, contacts, and context in order to fulfill their tasks.

<!-- Communicating progress -->

Not supervision, but rather everybody is on the same page. Different context, different amount of information. Avoiding duplicate work or learnings.
Checkign for blockers. Everybody can reach out on their own at any time anyway, we're all adults.
Overcommunicate
actively communicate
ask for clarification

Who are tickets for. Tickets are not engineering oriented. Any information relating to code, stored away from code is useless. Authorization, platform migration, searchability. We cover this in detail in Part II. Engineer - Details, libraries, implementation
Implementation details, algorithms, open source libraries vs building

### Kanban

Kanban boards have gained popularity over the last decade and all modern task management platforms offer a Kanban view. They visualize tasks as cards that can be placed within one of several columns. The columns represent the state the task is currently in. Typical states are "TODO", "In progress", "In review", "Completed", but any team can create an arbitrary set of columns.

![Representation of a kanban board, with four columns showing stages of a workflow, with various cards scattered across the board.](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Abstract_Kanban_Board.svg/2880px-Abstract_Kanban_Board.svg.png)

The visual simplicity of Kanban boards communicates the progress of a team member's workload at a glance. They are easy to update and maintain, as we just drag and drop cards between columns without the need of devoting cognitive load to communication. Kanban boards act as early warnings for problems in development processes if too many cards are "stuck" in a certain column. Too many cards in the "In progress" section indicate a wide spread of responsibilities that trigger expensive context switching. Bottle necks in the "In Review" column inform us to review our review process as it may no longer not match our teams current needs. 

### Journals

<!-- TODO: Move below to written daily status updates -->

A daily account of what we have been working on and struggling with. We can adapt the shape of our Jounrals to the needs of our team. We articulate our progress in emails, messaging threads, group spaces on Google Docs, Confluence, or Notion, or dedicated spaces per person.

Most people take notes privately and may forget to copy over their progress into a journaling system.

Use a messaging app. People do not open emails or go to specific Confluence pages.


### Daily status updates

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

### As a lead

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



Depending on the maturity of our product and organization, a single sprint cycle typically runs for one to four weeks. The younger our project, the shorter the sprint cycles.

## Measuring productivity

Performance evaluation is an emotional topic which relies heavily on empathy. Over the years various companies implemented varioations of metric based performance evaluations to varying degrees of failure. Our continous ambition of trying to measure individual productivity and performance unveilied a plethora of metrics that do NOT work. These include lines of code written, lines of code deleted, story points completed in a sprint, story points pushed over to next sprint, number of bug reports closed, number of bug reports opened, and the paradoxical list goes on and on.

The inherent problem is that when things go well, we create less metrics. And any metrics we do account for are diffictult to accopunt to any particular individual. Increased customer churn could well be attributed to a lack of feature, it can also be a problem in pricing, promises by the sales team, marketing in the wrong channels, or our CEO's social media use.

When we start reviewing performance by activity, rather than progress, our team will prioritise busy work with fast turn arounds over difficult problems with long-term improvements. We want our employees to be focused on delivering quality work for our product. Not on focusing to optimize their output for internal metrics. When we reward individual productivity, our team members feel punished for supporting each other, or taking time out of their day for debugging sessions. Some companies famously prided themselves on creating an environment of constant competitiveness, where the lowest performers of a metric where let go. That mindset is the antithesis of this book.

Productivity increases when our team members take on responsibility for work beyond the immediate tasks. We prefer to own an issue, rather than hitting a deadline. 
