<!-- TODO: (Daniel) Planning quaterly goals
  Points or star method
  map points to product feature
  keep mapping anonymous to avoid horizotnally distributing points
  plan features according to priorities of customers
 -->

# Working in Cycles

<!-- What is a sprint -->

Any significant work passes through three phases: planning, execution, and reflection. We determine what we want to achieve, do the work, and verify whether we completed our objectives and how to improve our process. Within software engineering, we commonly refer to this cycle as a *Sprint*.

Sprints offer a stable framework for us to complete our work. By coordinating and planning our tasks for the next few weeks, we can concentrate on executing them with minimal distractions. Pivoting our attention across unexpected tasks leads to costly context changes, and we run the risk of hindering progress by becoming overly reactionary. This becomes <!-- vale write-good.Weasel = NO -->especially<!-- vale write-good.Weasel = YES --> costly when other people depend on our work, as we effectively stall development across teams.

Naturally, immediate and urgent issues warrant attention. If we observe metrics or reports that present potentially critical problems, we put our work aside and ensure our customers can continue using our software. However, non-severe customer feedback should not interfere with our current progress and can be included in our next sprint cycle's planning.

<!-- Reflect on the work done -->

We complete a sprint cycle with scheduled retrospective sessions, which accomplish two functions: Firstly, we have the chance to share our insights on things that went well and things that did not, including mistakes we made personally, missing functionality in tools, insights and information we wish we had sooner, or conversations we could have avoided entirely.

Secondly, sprint retrospectives enable us to evangelize our work internally. We showcase our work and distribute demos across our organization. Sharing our progress with other teams potentially avoids duplicate work and promotes innersourcing opportunities.

<!-- What a sprint is NOT -->

Fashionable Scrum and Agile practices preach sprints as a framework for delivering binaries every sprint for feedback cycles. This is nonsense. As high-performing teams we ship our software when needed (as often as multiple times per day). Feedback cycles measured in weeks are unacceptable for the majority of software. Part II of this book discusses our approach to continuous delivery in detail, but presently we establish that **a sprint cycle has no relationship with the delivery of our software**.

## Cycle Duration

The length of our sprint cycles depends on the needs of our organization and product. Typically, a cycle period ranges from one to three weeks. No relevant work can happen in a time span shorter than a week, and any sprint longer than three weeks diminishes our ability to react to market demands.

Our sprint length adapts and grows with our organization's size and maturity. Successful start-ups address feedback from customers and investors quickly, so code-related tasks shift on a weekly basis. Planning, executing, and delivering weekly with a minimum of actionable distractions ensures steady progress and dampens the emotional amplitudes of founding a company.

To reduce the overhead of planning and evaluating sprints, we eventually move to two-week sprint cycles. Less time spent in meetings increases the time spent solving problems. Two-week cycles have become standard across the majority of scale-ups and provide consistent insights on progress for growing organizations.

Established teams in mature environments may decide to expand the cycle span to three weeks. When the main challenges in our organization are inter-team politics, processes, and protocols, a longer work cycle helps shield our team from noise. Longer work cycles require discipline, automation, and transparency for continuous integration and delivery practices (a topic we discuss in detail in Part II). Without these established practices, our work gets lost or becomes unwieldy.

While they run on a weekly schedule, sprint cycles do not have to start on the first day of the week. Monday and Friday are excellent buffer days to polish work, practice demos, prepare screen recordings, and write additional documentation.

## Planning

At least once per yearly quarter, product stakeholders are forced to arrange their product wishes by priority. We refer to this list of outstanding items as our *backlog*. Before a sprint cycle, our team leaders refine backlog items into granular, actionable tasks, fashionably called *tickets*. These tickets represent work on bug reports, support requests, and feature implementation.

We kick off a sprint by meeting with our team to discuss the cycle's tasks. Before the meeting, our team leaders provisionally assign tickets to the team members that most match the task's domain. While discussing the tasks, the team might decide to reassign certain tasks to upskill team members, spread knowledge horizontally, or distribute the amount of work across the team.

All team members are present for the duration of the meeting, and every individual contributor describes their task to the team, after which we estimate the workload as a group. Presenting our tickets to the team ensures we collectively understand our current responsibilities and progress.

### Estimating Work

Humans are remarkably bad at estimating work. It's a skill we simply cannot intuit. Besides not being able to predict the actual time it takes to execute work, we severely underestimate the amount of distractions in our lives that hinder our progress.

In the book *Noise: A Flaw in Human Judgment*, *Daniel Kahneman*, *Olivier Sibony*, and *Cass R. Sunstein* discuss how individual judgment and estimates are so unpredictable that the outcomes effectively become random. Every decision varies depending on a person's current state of mind, affected by breakfast intake, weather, spousal discourses, and more. We do not control these subtle influences consciously, nor are we aware of them. This causes our estimation for upcoming work to differ significantly from one day to another.

Classifying human judgment as random allows us to gather data and use statistical sampling to obtain numerical results. The book *Noise* covers an experiment demonstrating the so-called *Wisdom of the Crowds* effect: *"In 1907, Francis Galton, [...] asked 787 villagers at a country fair to estimate the weight of a prize ox. None of the villagers guessed the actual weight of the ox, which was 1,198 pounds, but the mean of their guesses was 1,200, just 2 pounds off [...]"*

This natural phenomenon demonstrates how the average estimate from a large group of people becomes surprisingly accurate to the actual result. We can leverage that effect by having all our team members estimate the workload of a ticket and averaging the results. To avoid influencing each other, we poll these estimates independently before revealing the result.

<!-- Story points -->

We may further increase the quality of our estimates by introducing a layer of abstraction in how we measure progress. A widespread (yet divisive) practice is the use of *Story Points*. These represent an arbitrary unit of measurement for development velocity. Instead of calculating our workload in time (e.g., hours or days), we estimate our tasks in *Story Points*. These have no real-life counterpart and thus lend themselves to subjectivity.

Every developer has an internal mapping of what a story point represents to them. However, as already established, we struggle to accurately predict the workload of an assigned task. The additional layer of abstraction between the unit of time and the unit of velocity allows us to create benchmarks of velocity across sprints. After a certain number of sprints, we can realistically deduce how many story points our team can achieve per sprint and share realistic plans and expectations, even if our team misjudges the workload internally.

Predicting the future through arbitrary guesswork makes us uncomfortable. It feels unscientific. To make the process feel methodical, we attach a mathematical structure to our story points. The Fibonacci sequence is a numerical pattern in which each number consists of the sum of the two preceding ones. Our tasks may therefore allocate any one of the following amounts of story points: 1, 2, 3, 5, 8, 13, or 21. Limiting our estimations to these options reduces our cognitive load and increases our confidence in estimating a task. We may now assign a unit of effort, ranging from very small to very large.

Story points are team-internal metrics. They cannot be directly used as a measurement for productivity across teams. The combination of tools, communication channels, personalities, and infrastructure is likely unique per team. Comparing story points across teams is as useful as comparing shoe sizes across teams.

Finally, team leaders plan additional time to compensate for unexpected work. People get distracted, called into extra meetings, and have family emergencies. We also get sick, hurt, and hungover, which increases the time spent on our tasks.

## Communicating Progress

Part II, *Collaborating Within a Codebase*, details the lifecycle of a code change. Since Part II examines how we can improve working on code-related tasks, this chapter focuses on communicating development updates rather than the execution process itself. During development, our team members need a way to share progress, and more crucially, a lack of progress, with little effort and less judgment.

While working on code improvements, we typically find ourselves giving three different kinds of status reports: technical updates, organizational updates, and progress updates. Some organizations make the mistake of not separating between these three kinds of updates. They provide different functions and are read in different contexts. The longevity, searchability, and storage vary between the three.

When writing **technical updates**, we detail the decision-making process for our implementation strategy. These documents live as long as the feature they describe and should be stored with the source code. We skip the intricacies of technical updates for now and cover them in the chapters [*Planning Implementations*](../collaborating-within-a-codebase/planning-implementations.md), [*Pull Requests*](../collaborating-within-a-codebase/pull-requests.md), and [*Documentation*](../collaborating-within-a-codebase/documentation.md) of Part II - *Collaborating Within a Codebase*.

**Organizational updates** inform our stakeholders of how much time, effort, and money are we spending on a particular objective and whether we can deliver projects on time and on budget. Our organization derives this information from our ticketing system, and requires little input from our individual contributors as we do not include technical topics in organizational updates.

Our **progress updates** detail the work we are currently doing and the problems we are facing. These updates are immediately actionable and become outdated quickly. We share progress updates frequently with our team and err on the side of overcommunication. Nobody wants our team to be the source of surprises.

### Kanban boards

These boards have gained popularity over the last decade. All modern task management platforms now offer a Kanban view. Kanban boards visualize tasks as cards that can be placed within one of several columns. These columns to represent the state the task is currently in. Typical states are "Todo", "In progress", "In review", and "Completed", but any team can create an arbitrary set of columns.

![Representation of a kanban board, with four columns showing stages of a workflow, with various cards scattered across the board.](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Abstract_Kanban_Board.svg/2880px-Abstract_Kanban_Board.svg.png)

The visual simplicity of Kanban boards details our current workload in an intuitive way. Our tasks are easy to update and make organizational updates frictionless. Engineers drag and drop cards between columns without the need of devoting time or cognitive load to communication. Most task management platforms offer events or hooks to trigger automated processes when moving tickets between columns. We use these tools to notify stakeholders and provide context for organizational and progress updates.

Having too many cards "stuck" in a certain column potentially heralds a problem in our development process. For example, a large pool of cards in the "Todo" section during latter half of our sprint cycle, suggests we might not be able to achieve our sprint goals. Too many cards flagged as "In progress" indicates a very wide spread of responsibilities, leading to expensive context switches. "In Review" bottle necks invite us to review our review process, as it may no longer not match our teams current needs.

The strength of Kanban boards lie within their simplicity. They should load quickly and be the landing page for our team's ticket platform. Making our engineers jump through additional hoops for creating or updating tickets reduces the acceptance and effectiveness of the practice.

### Daily status updates

<!-- Why have dailies -->

Engineers that talk to each other, solve problems faster. Once a day the entire team gathers to share their progress by answering three question:

- What did I work on yesterday?
- What am I working on today?
- Do I have any blockers?

Daily progress updates help the engineer and the team to reflect on the work being done. These updates are not a mechanism to evaluate performance. If these start to be viewed as such, we correct any behavior that might have led to that conclusion. There is little correlation between the verbosity of the status update and the productivity of the team member. Being busy differs from being productive.

<!-- Personal use -->

Status updates force us to reflect on our tasks on a daily basis. The practice helps us identify development friction, that might otherwise go unnoticed for a longer period of time. If we frequently struggle to vocalize what yesterday's progress was, it's a strong indication of scattered focus. "What did I even do yesterday?" suggests we review the number of context switches we are forced to make, including how many meetings we attend (and contribute to). 

<!-- Team use -->

Teams benefit of the shared knowledge and insights from daily status updates. Teams typically share a domain overlap and other team members might have faced the same issues we are currently working. The help of our immediate colleagues is a quick and cheap way to become unstuck, if we should ever feel so.

<!-- Team Leader use -->

As team leaders, daily status updates inform us of any blocking issues. With extended experience we might even be able to anticipate and prevent blocking issues before they arise. Besides blockers, we watch for distractions and unexpected workload. We protect our team from fluctuating priority shifts or a high amount of support requests. Allowing other teams to allocate large portions of our team's development time reduces our output measurably. Besides costing our company money, this perceived lack in performance is detrimental to our team member's career progression.

Lastly, sprint plans change. Daily status meetings enable us to detect and communicate delays early and to plan accordingly. As mentioned, we never want to be the source of unpleasant surprises.

#### Synchronous vs Asynchronous Updates

<!-- Current practices -->

Daily progress updates have gained popularity via *Daily Stand-Up Meetings* from modern project management frameworks. Stand-ups are a form of meetings in which participants remain standing during the meeting. The main goal of this format is to keep the meeting brief and focused.

The context switch of a meeting forces us to spend around half an hour to refocus on our task after this interruption. Thus, the productivity we lose to meetings exceeds the duration of the meeting itself. It is up to us and the team to decide whether the the benefit of synchronous in-person (or virtual) meetings outweigh this cost. Alternatively, we might prefer asynchronous written updates.

<!-- Meetings -->

When practicing synchronous updates, we dedicate a maximum of 60 seconds to each member. A team consisting of ten people should last no longer than ten minutes. The objective stand-ups is not to solve problems, but to identify who might be able to assist us. It is the meeting's owner's responsibility to enforce this rule. When topics drift towards prolonged conversations about implementation details, we request the participants to set up a dedicated meeting ro resolve their conversation. As with any meeting, we expect the participants to be prepared and succinctly recite yesterdays and todays responsibilities.

<!-- ASYNC -->

Asynchronous updates can be shared at the convenience of our team members' schedule. This can be done while we're between tasks and thus does not derail focused work. When practicing written daily updates, we use our day-to-day communication tool and not dedicated spaces on documentation platforms. If our team uses Slack, we write our daily updates in Slack.

Difficult to find status reports become useless. Our team members should organically stumble over written dailies without any further prompts. Thus, we avoid adding them to tickets or documentation platforms. Our progress updates become outdated within days, there is little need for long-term indexing.

We can combine synchronous and asynchronous approaches. Some teams find success by reducing the costly context switches of synchronous meetings to three days a week and defer to written status updates for the rest.

## Retrospective

At the end of each sprint cycle we dedicate time to review our successes and concerns of the execution phase. We identify what went well, what could have gone better, and what we can improve next cycle. Documenting and revisiting these changes allows us to track our teams improvement over a given time, or a lack thereof. If we notice similar problems over an extended period of time, we analyze how we make internal decisions to improve our development experience.

Besides internal reflection, retrospectives offer an organic opportunity to evangelize our work to the organization. At the end of every cycle, our team members create a demonstration, write-up, or screen recording of their work. We present our progress during synchronous end-of-cycle meetings and distribute the materials organization-wide, together with a recording the meeting.

Evangelizing our work is an exciting way to communicate progress and value throughout our organization. It encourages cross team interest and future collaboration. By promoting our solutions early and frequently we reduce duplicate work and encourage innersourcing practices.

If done consistently, our teams initially search for existing solutions within our company, before building something new. An internal platform with evangelized work can remove two sprint cycles for a different team. Vice versa our team can reduce bottle necks in communication, integration, or release processes by getting inspired from other a different team's approach.

Public showings offer our engineers a platform to demonstrate their accomplishments and accelerate their career progression within our company. The responsibility of planning, implementing, and presenting our work increases the sense of ownership over our work. We can be proud of our work and eager to improve it. Companies with healthy retrospectives develop and retain top talent.

### Measuring productivity

Over the years various organizations implemented different standardized metric-based performance evaluations to varying degrees of failure. This ongoing ambition unveiled an excess of metrics that do NOT work. The list of paradoxical items includes: lines of code written, lines of code deleted, story points completed in a sprint, story points pushed over to next sprint, number of bug reports closed, number of bug reports opened, ...

An inherent problem with metric-driven performance evaluation is that when things go well, we create less metrics to measure. Reviewing performance by activity, rather than progress, results in our team prioritizing busy work over difficult problems with long-term improvements. We want our employees to focus on delivering quality work for our product, not optimizing their output for internal metrics.

Some companies famously pride themselves on creating a cut-throat environment of constant competitiveness. That mindset is the antithesis of this book. Productivity increases when our team members take responsibility for their work. In order to do that for work worth doing, our teams must be permitted to fail. We prefer to own an issue, rather than hitting a deadline.

In summary, while retrospectives offer a chance for self reflection, we do not misuse them to extract data sets for future performance interviews. Measuring performance is an emotional process which relies heavily on empathy and a transparent feedback cycle of expectations and responsibilities from both parties.

Sprint goal achieved.
