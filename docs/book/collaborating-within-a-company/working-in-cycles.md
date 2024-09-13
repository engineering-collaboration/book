<!-- TODO: (Daniel) Planning quaterly goals
  Points or star method
  map points to product feature
  keep mapping anonymous to avoid horizotnally distributing points
  plan features according to priorities of customers
 -->

# Working in cycles

<!-- What is a sprint -->

Any significant work passes through three phases: planning, execution, and reflection. We determine what we want to achieve, do the work, and verify whether we completed our objective and how to improve our process. Within software engineering we commonly refer to this cycle as a *Sprint*.

Sprints offer a stable framework for us to complete our work. By coordinating and planning our tasks for the next weeks, we can concentrate on executing them with minimal distractions. Pivoting our attention across unexpected tasks  leaders to expensive context changes and we run the risk of hindering progress by becoming overly reactionary. This becomes especially costly when other people depend on our work, as we effectively stall development across teams.

Naturally, immediate and urgent issues do warrant attention. If we observe metrics or reports that present potential lethal problems, we put our work aside and ensure our customers can continue using our software. However, non-severe customer feedback should not interfere with our current progress and can be included in our next sprint cycle's planning.

<!-- Reflect on the work done -->

We complete a sprint cycle with scheduled retrospective sessions, which accomplish two functions: Firstly, we have the chance to share our insights on things that went well, and things that did not, including mistakes we made personally, missing functionality in tools, insights and information we wish we had had sooner, or conversations we could have avoided entirely.

Secondly, sprint retrospectives enable us to evangelize our work internally. We showcase our work and distribute demos across our organization. Sharing our progress with other teams potentially avoids duplicate work and promotes innersourcing opportunities.

<!-- What a sprint is NOT -->

Fashionable Scrum and Agile practices preach sprints as a framework for delivering binaries every sprint for feedback cycles. This is nonsense. As high-performing teams we ship our software when needed (as often as multiple times per day). Feedback cycles measured in weeks are unacceptable for the majority of software. Part II of this book discusses our approach for continuous delivery in detail, but presently we establish that **a sprint cycle has no relationship with the delivery of our software**.

## Cycle duration

The length of our sprint cycles depends on the needs of our organization and product. Typically, a cycle period ranges from one week to three weeks. No relevant work can happen in a time span shorter than a week and any sprint longer than three weeks diminishes our ability to react to market demands.

Our sprint length adapts and grows with our organization's size and maturity. Successful start-ups address feedback from customers and investors quickly, thus code-related tasks shift on a weekly basis. Planning, executing, and delivering weekly with a minimum of actionable distractions ensures steady progress and dampens the emotional amplitudes of founding a company.

To reduce the overhead of planning and evaluating sprints, we eventually move to two week sprint cycles. A reduced time spent in meetings, increases the time spent solving problems. Two week cycles have become standard across the majority of scale-ups and provide a consistent insights on the progress for growing organization.

Established teams in mature environments may decide to expand the cycle span to three weeks. When the main challenges in our organization are inter-team politics, processes, and protocols, a longer work cycle helps shield our team from noise. Longer work cycles require discipline, automation, and transparency for continuous integration and delivery practice (a topic we discuss in detail in Part II). Without these established practices, our work gets lost or becomes unwieldy.

While they run on a weekly schedule, sprint cycles do not have to start on the first day of the week. Monday and Friday are excellent buffer days to polish work, practice demos, prepare screen recordings, and write additional documentation.

## Planning

At least once per yearly quarter, product stakeholders are forced to and arrange their product wishes by priority. We refer to this list of outstanding things as our *backlog*. Before a sprint cycle, our team leaders refine backlog items into granular actionable tasks, fashionably called *tickets*. These tickets represent work on bug reports, support requests, and feature implementation.

We kick off a sprint by meeting with our team to discuss this cycle's tasks. Before the meeting, our team leaders provisionally assign tickets to the team members that most match the tasks domain. While discussing the tasks, the team might decide to redesignate certain tasks in order to upskill team members, spread knowledge horizontally, or distribute the amount of work across the team.

All team members are present for the duration of the meeting and every individual contributor describes their task to the team, after which we estimate the workload as a group. Presenting our tickets to the team ensures we collectively understand our team's current responsibilities and progress.

### Estimating work

Humans are remarkably bad at estimating work. It's a skill that we simply cannot intuit. Besides not being able to predict the actual time it takes to execute work, we severely underestimate the amount of distractions in our lives that hinder our progress.

In the book *Noise: A Flaw in Human Judgement*, *Daniel Kahneman*, *Olivier Sibony*, and *Cass R. Sunstein* discuss how individual judgement and estimates are so unpredictable the outcomes effectively become random. Every decision varies depending on a person's current state of mind; caused by breakfast intake, weather, spousal discourses, and more. We do not control these subtle influences consciously, nor are we aware of them. This causes our estimation for upcoming work to differ significantly from one day to another.

Classifying human judgement as random allows us to gather data and use statistical sampling to obtain numerical results. The book *Noise* covers an experiment demonstrating of the so-called *Wisdom of the Crowds* effect: *"In 1907, Francis Galton, [...] asked 787 villagers at a country fair to estimate the weight of a prize ox. None of the villagers guessed the actual weight of the ox, which was 1,198 pounds, but the mean of their guesses was 1,200, just 2 pounds off [...]"*

This natural phenomena demonstrates how the average estimate from a large group of people becomes surprisingly accurate to the actual result. We can leverage that effect by having all our team members estimate the workload of a ticket and averaging the result. To avoid influencing each other, we poll these estimates independently from one another before revealing the result.

<!-- Story points -->

We may further increase the quality of our estimates by introducing a layer of abstraction on how we measure progress. A widespread (yet divisive) practice is the use of *Story Points*. These represent an arbitrary unit of measurement for development velocity. Instead of calculating our workload in time, e.g. hours or days, we estimate our tasks in *Story Points*. These have no real-life counterpart and thus lend themselves to subjectivity.

Every developer has an internal mapping of what a story point represents to them. However, as already established, we struggle to accurately predict the workload of an assigned task. The additional layer of abstraction between the unit of time and the unit of velocity allows us to create benchmarks of velocity across sprints. After a certain amount of sprints we can realistically deduce how many story points our team can achieve per sprint and share realistic plans and expectations, even if our team misjudges the workload internally.

Predicting the future through arbitrary guesswork makes us uncomfortable. It feels unscientific. To make the process feel methodical, we attach a mathematical structure to our story points. The Fibonacci sequence is a numerical pattern in which each number consists of the sum of the two preceding ones. Our tasks may therefore allocate any one of the following amount of story points: 1, 2, 3, 5, 8, 13, or 21. Limiting our estimations to these options reduces our cognitive load and increases our confidence in estimating a task. We may now assign a unit of effort, ranging from very small to very large.

Story points are team internal metrics. They cannot be directly used as a measurement for productivity across teams. The combination of tools, communication channels, personalities, and infrastructure is likely unique per team. Comparing story points across teams is as useful as comparing shoe sizes across teams.

Finally, team leaders plan additional time to compensate for unexpected work. People get distracted, called into additional meetings, and have family emergencies. We also get sick, hurt, and hungover, which increases the time spent on our tasks.

<!-- 👇 Current editing -->

## Communicating progress

Part II of this book covers the lifecycle of a code change in-depth and recommends practices for planning and executing tasks. This chapter focuses on communicating development updates and how we enable our teams to share progress and, more crucially, a lack of progress with little effort and no judgement. We typically find ourselves giving three different kinds of status reports: organizational updates, technical updates, and progress updates.

**Organizational updates** inform our stakeholders of a projects allocated resources. Our individual contributors inform us about the gradn scheme of things. Will the task at hand be completed by the expected time, are we delayed, are we blocked by something, did we shelve the task for something more important. These updates require no technical knowledge and do not include any technical jargon. We add comments to our tickets and update deadlines on our platform. Organizational updates are close to the ticket.

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

Daily status updates help the individual, the team, and the team leader to reflect on the work being done. These updates are not a mechanism to evaluate performance and we stop any indication that the are viewed as such. The person with the busiest status is not the most productive team member, in fact most times it's the opposite.

If we find ourselves regularly considering "what we even worked on yesterday", we reflect on our current responsibilities and how these take shape throughout our work day. How many meetings did we attend, and how many did we actually contribute to? How many tasks run in parallel and do our context switches hinder our progress? Daily status updates help us identify frictions in our tasks, which would otherwise go unnoticed for a while.

Teams benefit of the shared knowledge and insights from daily status updates. Teams typically share a domain overlap and other team members might have faced the same issues we are currently working. The help of our immediate colleagues is a quick and cheap way to become unstuck, if we should ever feel so.

As team  leaders, daily status updates inform us whether our team has any blocking issues. With extended experienced, we might even be able to anticipate and prevent blocking issues before they arise. Besides blockers, we keep an eye out for distractions and additional workload. We protect our team from top-down priority shifts or unplanned support tasks from other teams. Allowing other teams to allocate large portions of our team's development time reduces our output. Besides costing our company money, this perceived lack in performance is detrimental to our team member's career progression.

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

Over the years various organizations implemented different standardized metric-based performance evaluations to varying degrees of failure. This ongoing ambition unveiled an excess of metrics that do NOT work. The list of paradoxical items includes: lines of code written, lines of code deleted, story points completed in a sprint, story points pushed over to next sprint, number of bug reports closed, number of bug reports opened, ...

An inherent problem with metric-driven performance evaluation is that when things go well, we create less metrics to measure. Reviewing performance by activity, rather than progress, results in our team prioritizing busy work over difficult problems with long-term improvements. We want our employees to focus on delivering quality work for our product, not optimizing their output for internal metrics.

Some companies famously pride themselves on creating a cut-throat environment of constant competitiveness. That mindset is the antithesis of this book. Productivity increases when our team members take responsibility for their work. In order to do that for work worth doing, our teams must be permitted to fail. We prefer to own an issue, rather than hitting a deadline.

In summary, while retrospectives offer a chance for self reflection, we do not misuse them to extract data sets for future performance interviews. Measuring performance is an emotional process which relies heavily on empathy and a transparent feedback cycle of expectations and responsibilities from both parties.

Sprint goal achieved.
