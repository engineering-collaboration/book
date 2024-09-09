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

## Cycle duration

The length of our sprint cycles depends on the needs of our organization and product. Typically, a cycle period ranges from one week to three weeks. No relevant work can happen in a time span shorter than a week and any sprint longer than three weeks diminishes our ability to react to market demands.

Our sprint length adapts and grows with our organization's size and maturity. Successful start-ups address feedback from customers and investors quickly, thus feature schedules and bug fixes shift on a weekly basis. While founders may have to adjust their schedule on a daily basis, this seldomly includes work related to code. Planning, executing, and delivering on a weekly basis without pivoting mid-sprint ensures steady progress and dampens the emotional amplitudes of founding a company.

To reduce the overhead of sprint planning and retrospection, we eventually move to two week sprint cycles. When we reducing the time spent in meetings, we increase the time spent solving problems. Two week cycles have become standard across the majority of scale-ups to provide a growing organization consistent insights on the progress of other projects and teams.

Established teams working in mature environments may decide to expand the cycle span to three weeks. When the main challenges in our organization are inter-team politics, processes, and protocols, a longer work cycle helps shield our team from noise. Longer work cycles require discipline, automation, and transparency for continuous integration and delivery practice, a topic we discuss in detail in Part II. Without established practices work gets lost or becomes unwieldy.

While they run on a weekly schedule, sprint cycles do not have to start on the first day of the week. Monday and Friday are excellent buffer days to polish work, demos, prepare screen recordings, apply code review feedback, and write additional documentation. We consider our team demographics when reserving time slots for our kick-off and demo meetings.

## Planning

Before a sprint cycle, our team leads work with our product stakeholders to prioritize immediate tasks and create a *backlog*, a list of outstanding things to do. Our team leads refine bigger backlog items into granular actionable items, broadly called *tickets*. Tickets cover bug reports, support requests, and feature implementation.

We start sprints with a kick-off meeting in which we discuss the tasks within the team. Our team leads pre-assign tickets to the team members that most match the tasks domain. During the kick-off meeting, we might decide to redesignate certain tasks to upskill team members, spread knowledge horizontally, or distribute an unusual amount of domain work across the team.

All team members are present for the duration of the meeting. Every individual contributor describes their task to the team, after which we estimate the workload as a group. Presenting our tickets to the team ensures we collectively have an idea about our team's current responsibilities and progress.

### Estimating work

Humans are remarkably bad at estimating work. It's a skill that we simply cannot intuit. Besides not being able to predict the actual time it takes to execute work, we severely underestimate the amount of distractions in our lives that hinders our progress.

In their book *Noise: A Flaw in Human Judgement*, *Daniel Kahneman*, *Olivier Sibony*, and *Cass R. Sunstein* discuss how individual judgement and estimates tend to be so unpredictable they border on randomness. Every decision is affected by a person's mood; caused by breakfast intake, weather, spousal discourses, and numerous subtle influences we do not consciously control. When asked to judge the workload for an upcoming feature, the a persons estimation differs significantly from one day to another.

Classifying human judgement as random allows us to gather data and use statistical sampling to obtain numerical results. The book *Noise* covers an experiment demonstrating the so-called the *Wisdom of the Crowds*: *"In 1907, Francis Galton, [...] asked 787 villagers at a country fair to estimate the weight of a prize ox. None of the villagers guessed the actual weight of the ox, which was 1,198 pounds, but the mean of their guesses was 1,200, just 2 pounds off [...]"*

The *Wisdom of the Crowds* is a natural phenomena where the average educated guess of a group of people becomes surprisingly accurate to the actual result. We can leverage that effect by having all our team members estimate the workload of a ticket and averaging the result. To avoid influencing each other, we give these estimates independently from one another in a poll before revealing the result.

<!-- Story points -->

We further increase the quality of our estimates by introducing a layer of abstraction on how we measure progress. A popular, yet divisive, practice is the use of *Story Points*. These represent an arbitrary unit of measurement for development velocity. Instead of calculating our workload in time, e.g. hours or days, we estimate our tasks in *Story Points*. These have no real-life counterpart and it is difficult to determine whether our estimation was wrong.

Every developer has an internal mapping of what a story point represents to them. However, as we have already established, we struggle to accurately predict the workload of an assigned task. The additional layer of abstraction between the unit of time and the unit of velocity allows us to create benchmarks of velocity across sprints. After a certain amount of sprints we can realistically deduce how many story points our team can achieve per sprint and share realistic plans and expectations, even if our team misjudges the workload internally.

Predicting the future with arbitrary guesswork makes us uncomfortable. It feels unscientific. Thus, we employ a mathematical guide to structure our story points. The Fibonacci sequence is a numerical pattern in which each number consists of the sum of the two preceding ones. Our tasks may therefore allocate any one of the following amount of story points: 1, 2, 3, 5, 8, 13, or 21. Limiting our estimations to these options, reduces our cognitive load and increases our confidence in estimating a task. We may now deduce the workload on a spectrum ranging from very small to very large effort.

Story points only work team internally. They cannot be directly used as a measurement for productivity across teams. The mix of tools, communication channels, personalities, and infrastructure deployments is likely to be unique to our team. Comparing story points across teams is as useful as comparing shoe sizes across teams.

Finally, as a team lead, we plan for unexpected work. People get distracted, called into additional meetings, have family emergencies, and get sick, hurt, or hungover.

<!-- 👇 Current editing -->

## Communicating progress

With the planning meeting completed, we have locked in our tasks for the sprint. Part II of this book covers the lifecycle of a code change in-depth and recommends practices for planning and executing tasks. Thus, we postpone the mental and manual labour of software engineering to another chapter and focus on a different responsibility, communicating progress. We enable our teams to share updates on progress or, more crucially, a lack of progress, with little effort and no judgement.

While chipping away on our work, we typically find ourselves giving three different kinds of status reports: organizational updates, technical updates, and progress updates.

**Organizational updates** inform our project leads what projects allocate which resources. Our individual contributors inform us about the gradn scheme of things. Will the task at hand be completed by the expected time, are we delayed, are we blocked by something, did we shelve the task for something more important. These updates require no technical knowledge and do not include any technical jargon. We add comments to our tickets and update deadlines on our platform. Organizational updates are close to the ticket.

**Technical updates**. What decisions did we have to make and which option did we choose. Who needs to consume this. These are part of the planning process and typcailly involve a design document. The final decisions are documented within a Pull Request. We cover technical updates in Part II of the book, specificailly in the chapters [Planning Implementations](../collaborating-within-a-codebase/planning-implementations.md), [Pull Requests](../collaborating-within-a-codebase/pull-requests.md), and [Documentation](../collaborating-within-a-codebase/documentation.md). Technical updates are close to the code.

This chapter focuses on the third kind of updates, **progress updates**. We inform our team of the work we are currently doing and the problems we are facing.

We actively communicate our current work and challenges and share our progress on solving the problems we are facing in a couple of lines. We verify the progress achieved with the remaining sprint duration and keep track what we can and cannot realistically achieve. We do not want our team to be the source of suprises when reporting our status to our department head.

To offer
Checkign for blockers. Everybody can reach out on their own at any time anyway, we're all adults.
Overcommunicate
ask for clarification

### Kanban boards

These boards have gained popularity over the last decade with all modern task management platforms offering a Kanban view. Kanban boards visualize tasks as cards that can be placed within one of several columns to represent the state the task is currently in. Typical states are "Todo", "In progress", "In review", and "Completed", but any team can create an arbitrary set of columns.

![Representation of a kanban board, with four columns showing stages of a workflow, with various cards scattered across the board.](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Abstract_Kanban_Board.svg/2880px-Abstract_Kanban_Board.svg.png)

The visual simplicity of Kanban boards communicates the progress of a team member's workload at a glance. They are easy to update and maintain, as we just drag and drop cards between columns without the need of devoting time or cognitive load to communication. When dragging cards between states, we trigger downstream actions to kick off automated processes or to notify stakeholders and provide additional context for organizational updates and progress updates. 

Kanban boards act as early warnings for problems in development processes if too many cards are "stuck" in a certain column. For example, a large pool of cards in the "Todo" section in the latter half of our sprint cycle, suggests we might not be able to achieve our sprint goals. Too many cards in the "In progress" section indicate a wide spread of responsibilities that signals expensive context switching. Bottle necks in the "In Review" alerts us to review our review process, as it may no longer not match our teams current needs.

The strength of Kanban boards lie within their simplicity. Slow loading times or encumbering state changes with additional requirements reduces the acceptance and effectiveness of the practice.

### Daily status updates

<!-- Why have dailies -->

Engineers that talk to each other, solve problems faster. Once a day the entire team gathers to share their progress by answering three question:

- What did I work on yesterday?
- What am I working on today?
- Do I have any blockers?

Daily status updates help the individual, the team, and the team lead to reflect on the work being done. These updates are not a mechanism to evaluate performance and we stop any indication that the are viewed as such. The person with the busiest status is not the most productive team member, in fact most times it's the opposite.

If we find ourselves regularly considering "what we even worked on yesterday", we reflect on our current responsibilities and how these take shape throughout our work day. How many meetings did we attend, and how many did we actually contribute to? How many tasks run in parallel and do our context switches hinder our progress? Daily status updates help us identify frictions in our tasks, which would otherwise go unnoticed for a while.

Teams benefit of the shared knowledge and insights from daily status updates. Teams typically share a domain overlap and other team members might have faced the same issues we are currently working. The help of our immediate colleagues is a quick and cheap way to become unstuck, if we should ever feel so.

As team leads, daily status updates inform us whether our team has any blocking issues. With extended experienced, we might even be able to anticipate and prevent blocking issues before they arise. Besides blockers, we keep an eye out for distractions and additional workload. We protect our team from top-down priority shifts or unplanned support tasks from other teams. Allowing other teams to allocate large portions of our team's development time reduces our output. Besides costing our company money, this perceived lack in performance is detrimental to our team member's career progression.

Lastly, sprint plans change. Daily status meetings enable us to detect and communicate delays early and to plan accordingly. 

#### Synchronous vs Asynchronous Updates

<!-- Current practices -->

Daily progress updates have gained prevalence through *Daily Stand-Up Meetings*, an apparent requisite for modern project management. Stand-ups are a form of meetings in which participants remain standing during the meeting. The main goal of this format is to keep the meeting brief and focused.

As discussed in Autonomous Teams, context switches force us to spend fifteen to thirty minutes to fully refocus on our task after an interruption. Thus, the productivity we lose to meetings exceeds the duration of the meeting itself. It is up to us and the team to decide whether the the benefit of synchronous virtual or in-person outweigh the costs, or if we prefer asynchronous written updates.

<!-- Meetings -->

When practicing synchronous dailies, we dedicate a maximum of 60 seconds to each member. A team consisting of ten people should last no longer than ten minutes. The objective of the stand-up is not to solve problems, but to identify who might be able to assist us. If the conclusion does not happen naturally, e.g. "I would like to hear how you solved this last time. Let's have a call after the meeting", it is the responsibility of the person leading the meeting to request that we move on.
Prepare for dailies

<!-- ASYNC -->

Asynchronous updates can be shared at the convenience of our team members' schedule and location and thus intrude less on our work day. We prefer our day-to-day communication tool for updates over dedicated spaced on documentation platforms or online documents. Immediate visibility trumps searchability and long-term archiving of daily status updates. It is very unlikely we ever need to check updates from a couple months ago, it is very likely we have to remind engineers to update and check entries in a "remote" location. Our team members should organically stumble over the updates in order to see what the team is working on.

We can mix our approaches. Some teams find more success by avoiding costly context switches on a daily basis by dedicating three days a week to synchronous meetings and defer to written status updates for the rest.

## Retrospective

At the end of each sprint cycle we dedicate time to review our successes and concerns of our execution phase. We identify what went well, what could have gone better, and what we can improve next cycle. Documenting and revisiting these changes allows us to track our organization's progress over a given time, or a lack thereof. If we consider to note similar problems over an extended period of time, we analyze how we make internal decisions to improve our development experience.

Retrospectives offer an organic opportunity to evangelize our work to teams and stakeholders. Every team member creates a demonstration, write-up, or screen recording of their work and presents it in five minutes during synchronous end-of-cycle meetings. We collect the shared materials, record the meeting and share it publicly across the organization.

Evangelizing our work is an exciting way to communicate progress and value throughout our organization. It encourages cross team interest, feedback, and future collaboration on shared pain points. By promoting our solutions early and frequently we reduce duplicate work and encourage innersourcing practices.

If done consistently, our teams initially search for existing solutions within our company, before building something new. An internal platform with properly evangelized work can remove two sprint cycles for a different team. Vice versa our team can reduce bottle necks in communication, integration, or release processes by getting inspired by other teams approach.

Public showings offer our engineers a platform to demonstrate their accomplishments and accelerate their career progression. Plus, the sense of responsibility we experience when planning, implementing, delivering, and presenting our work reduces the likelihood of feeling unfulfilled at our current organization. Healthy retrospectives help develop and retain top talent.

### Measuring productivity

Performance evaluation is an emotional topic which relies heavily on empathy. Over the years various companies implemented varioations of metric based performance evaluations to varying degrees of failure. Our continous ambition of trying to measure individual productivity and performance unveilied a plethora of metrics that do NOT work. These include lines of code written, lines of code deleted, story points completed in a sprint, story points pushed over to next sprint, number of bug reports closed, number of bug reports opened, and the paradoxical list goes on and on.

The inherent problem is that when things go well, we create less metrics. And any metrics we do account for are diffictult to accopunt to any particular individual. Increased customer churn could well be attributed to a lack of feature, it can also be a problem in pricing, promises by the sales team, marketing in the wrong channels, or our CEO's social media use.

When we start reviewing performance by activity, rather than progress, our team will prioritise busy work with fast turn arounds over difficult problems with long-term improvements. We want our employees to be focused on delivering quality work for our product. Not on focusing to optimize their output for internal metrics. When we reward individual productivity, our team members feel punished for supporting each other, or taking time out of their day for debugging sessions. Some companies famously prided themselves on creating an environment of constant competitiveness, where the lowest performers of a metric where let go. That mindset is the antithesis of this book.

Productivity increases when our team members take on responsibility for work beyond the immediate tasks. We prefer to own an issue, rather than hitting a deadline. 
