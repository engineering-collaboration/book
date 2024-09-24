---
title: Autonomous Team Structure
description: Designing teams as cross-disciplinary structures allows us to align multiple competences with a shared purpose. This self-sufficient team achieves rapid iteration cycles by working autonomously.
---

# Autonomous Team Structure

During early web development, teams were organized by disciplines. The front-end department developed the visual interaction for websites, the back-end department worked on the system logic of received input from the user, and the database department serialized data across user sessions.

[![Horizontal Teams](../../assets/images/book/collaborating-within-a-company/horizontal-teams.webp)](../../assets/images/book/collaborating-within-a-company/horizontal-teams.png)

Teams partitioned via disciplines face multiple handoffs and inter-team communication to deliver a customer-facing feature. This approach drastically reduces the velocity of releases and potentially introduces friction of internal politics and an us-vs-them blame culture across teams.

The organic inertia within monodisciplinary teams directs our team members toward misguided goals. A team consisting entirely of backend engineers will focus on building the best backend the team can envision. While this may be an attractive and self-fulfilling task for our engineers, our organizational needs require our employees to focus on the best customer experience.

## Vertical Teams

Designing teams as cross-disciplinary vertical structures allows us to align multiple competences with a shared purpose. A vertical team focuses on a single service, feature, or user persona and is empowered to build and deliver customer value as quickly and independently as possible. The team does not require hand-offs to other teams to perform parts of the task and achieves rapid iteration cycles by working autonomously.

[![Vertical Teams](../../assets/images/book/collaborating-within-a-company/vertical-teams.webp)](../../assets/images/book/collaborating-within-a-company/vertical-teams.png)

Vertical teams include all disciplines across the necessary tech stack. Typically, a vertical team has members versed in the areas of project management, security, infrastructure, development, metrics and monitoring, and UX. These do not represent a one-to-one mapping of skills to members. A member may cover multiple disciplines, and more or fewer disciplines may be needed per team.

The foundation of a vertical team's success lies in the ability to deliver changes to production without dependencies on other teams. It owns its tech stack and its continuous delivery pipeline and addresses newly discovered limitations and flaws in the software system autonomously. This ensures a reliable feedback loop with its customers and the ability to select the technology most appropriate for the specific problem, e.g., using a document database or a graph database.

In 1955, *Elting Morison* published the study *"Mining Coal: How Long Can We Continue?"* exploring efficiencies for team structures in coal mines. The key findings emphasize the importance of team autonomy and self-management in improving productivity. In the study, smaller teams tend to operate more efficiently because each member has a clearer understanding of their responsibilities and can coordinate their efforts more effectively.

Before *James P. Womack*'s *"The Machine That Changed the World"* popularized the concept of lean manufacturing, *Womack* was a project manager at Ford. When his team visited the Toyota operations in Japan and were surprised to see how autonomously the teams at Toyota operated on the production floor; a stark contrast to the centralized decision-making and hierarchical structure they were used to at Ford.

Vertical teams were rediscovered in software development in the early 2010s. The book *Team topologies*, a major influence for *Engineering Collaboration*, refers to vertical teams as *stream-aligned teams* and emphasizes the importance of autonomous delivery. Spotify published their ongoing organizational effort with *The Spotify model*, including a multidisciplinary team composition called *Squads*. However, vertical teams as described in *Engineering Collaboration* do not necessarily follow the same reporting schema or chapter structure of the Spotify model.

## Team Size

Based on the behavior of primates, British anthropologist Robin Dunbar proposed that humans can comfortably maintain 150 active social contacts. This number represents our social outer circle and decreases as we approach our inner circle. According to the theory, we are capable of 50 meaningful relationships, 15 people with whom we share a strong relationship, and 5 people whom we deeply trust. Naturally, these numbers are subjective.

Based on Dunbar's theory, a team should consist of three to nine people. Teams smaller than three struggle with diverse responsibilities, while teams larger than that struggle with communication overhead and accumulated noise. *Amazon* famously put it as *"A team should be fed with two pizzas."* - a unit of measurement that may work in the United States, but will starve any team larger than three based in Europe.

A second factor affecting team size is the cognitive load of our team. We handle increased workload of the same nature by scaling up our team to the maximum of Dunbar's number. If the workload increases beyond the maximum scope, we identify a separation of concerns within our software and split the team along this architecture. Teams adapt quickly to an increased volume of similar work; a more interesting problem is an increase in complexity.

When working on problems, we have a limited capacity of information we can hold in our mind. Most engineering work consists of solving problems within a specific context. This context becomes increasingly more complex with additional abstractions, user personas, and architecture demands. The larger and the more complex the systems of teams get, the more cognitive load is required to effectively deliver results.

Besides the complexity of systems, context switches reserve a large amount of cognitive load. When we work on a problem, we enter a focused state often referred to as *the zone* or a *state of flow*. Within this state of heightened productivity, we lose ourselves to the task at hand and toil at peak performance. We reach *the zone* after fifteen to thirty minutes of uninterrupted focus. Every context switch removes us from this state.

Because cognitive overload and context switches have such a detrimental effect on our productivity, it makes sense to split the team with dedicated responsibilities before we reach the upper limit of Dunbar's number.

## Internal Supporting Teams

All teams within our organization are vertical, and most of our teams work on features for our customers. However, complex problems can be solved more efficiently by dedicated teams. These supporting teams reduce the burden for product teams by delivering software internally.

In the 2012 paper, *A Taxonomy of Dependencies in Agile Software Development*, Diane Strode and Sid Huff propose three different categories of dependencies: knowledge, task, and resource dependencies.

These were adapted by Matthew Skelton and Manuel Pais in the book *Team Topologies*. Based on the findings of the paper and their personal experience, the authors differentiate three different types of supporting teams: complicated-subsystem teams, enabling teams, and platform teams.

### Enabling Teams

Product teams inevitably encounter a problem that syphons focus from their work. A distracted product team delivers improvements less frequently, making our organization vulnerable to changing market demands. We remove the strain on the product team's development velocity, we establish an enabling team. The newly formed team takes responsibility of the impeding issue and delivers usable solutions.

Enabling teams solve limitations of three kinds: problems of time, complexity, or magnitude. The first category - time - might be the most immediately relatable experience. A team spends an unreasonable amount of time solving a tangential problem. This hinders the team's primary responsibility of delivering features within its domain. We create an enabling team to take on the problem instead. The dedicated enabling team has the resources and cognitive load deliver a sustainable solution to the initial team.

Problems of complexity grow over time. Once they reach a certain threshold, our engineers struggle to mentally retain the intricacies of a problem. One possible reason might be that our product evolved and the team's responsibility has become too broad. In that case we reassess whether to split our team into multiple product teams.

Another cause for complexity originates from organic code growth leading to accumulated technical debt. Technical debt is the cost of doing business. As an organization, we prefer to deliver features fast and generate income as early as possible. Accumulated complexity results in opaque software architecture and convoluted code. An enabling team with the domain expertise can identify the extent of the problem and implement a strategy to pay off our technical debt.

Problems of magnitude entail large-scale changes across our organization that require deep knowledge of a problem. Typical scenarios include regulatory compliance for industries and location, uncovering security vulnerabilities, or comprehensive technical migration.

As an example, our organization decided to globally transition from Python 2 to version 3. A dedicated enabling team researches the challenges of the migration and explores strategies to minimize disruptions for our workforce. The team writes migration guides, automation tooling, and provides testing suites. After the enabling team has solidified an approach, it collaborates with vertical teams across the organization to ensure a successful transition.

Enabling teams are temporary and focused on transferring knowledge, introducing capabilities, or solving singular problems. They focus on making product teams self-sufficient.

### Complicated-Subsystem Teams

If the problem requires highly specialized knowledge outside of our current team's domain, we hire or upskill dedicated personell to own the problem. One example would be to hire computer graphics engineers to build 3D rendering solutions for our web teams.

The driving factor for complicated-subsystem teams is to reduce the cognitive load of a vertical team, not necessarily to share the component across multiple teams. Complicated-subsystem teams own the problem long-term and work on libraries that are then consumed by product teams.


Enabling teams consists of subject experts for a single mission.

Enabling teams understand potential areas of improvements of vertical teams. Enabling teams stay up-to-date with new approaches, tooling, and practices to bridge internal knowledge gaps. Enabling teams typically appear in the form of coaches, consultants, and research and development.


On a more egocentric note, an enabling team may also be set up to apply the processes described in this book across vertical teams.

### Platform Teams

Platform teams build internal products with the same sophistication needed to be commercially publicly. Platforms offer a high level of self-service documentation, contacts to support engineers, and a polished UX and API.

Our vertical product teams maintain full ownership of building, running, and fixing their application in production. Our platform teams provide internal self-service services to reduce the cognitive load that would be required to develop the underlying services. Platform teams have a strong focus on usability and treat the platform as a product with a typical product life cycle.

For example, our organization has been utilizing object storage from a popular cloud provider. We have reached a maturity and size that we decide to try and lower costs by building internal teams that focus on internal needs. We start recruiting for multiple vertical teams that establish an internal storage platform team.

However, platforms can be as small as providing a thin wrapper or merely extended documentation and implementation examples of a publicly available product.


!!! tip "Recommendation"
    <img src="https://images.squarespace-cdn.com/content/v1/5b3296b78ab7229ecafcf4ed/1566982599895-T0K28HX7RF7YJ2GE1D4K/TeamTop_cover_RGB_flat_stroke.jpg?format=1000w" width="360" style="display: block; margin-left: auto; margin-right: auto;" alt="Engineering Collaboration">
    <br>
    <br>
    In *Team Topologies*, IT consultants Matthew Skelton and Manuel Pais share secrets of successful team patterns and interactions. Some topics in *Engineering Collaboration* are written with the help of the publicly available information from Team Topologies.

    I highly recommend you check out the book and more at https://teamtopologies.com/


A supporting team is a nested team consisting of vertical teams and potentially consuming other supporting teams. Typically, we want a 6:1 to 9:1 mapping between vertical teams working on the product we sell and vertical teams working on other deliverables.


These are general patterns, not strict rules. Technical debt can be paid with enabling teams or complicated sub system teams, or platform teams. The mai difference is the scope and longevity of the deliverable.

## Team Topology over Time


<!--
TODO: (Daniel) embed here, moved from introduction

A topological view of our organization clarifies what we work on. Our team's sociotechnical dependencies and deliverables are subject to our product and organizational structures. Collaborating effectively within our team has less impact when our output is redundant. We build inter-team interactions and communication channels to explain who our customers are and to appreciate their needs.
-->

As with most topics covered in this book, teams are not static. It is not sufficient to choose a team boundary a single time and expect no further changes. With the adoption of additional technology, market practices, competitors, and internal knowledge, our team constellations and interaction modes will evolve.

If we can track our team interactions, we can make decisions regarding team responsibilities. If we find exclusive strong dependencies and a reduced cognitive load of maintaining a platform or library, it might be advantageous to empower the team to do so.

A relevant topic for this book is a different example. Learning and setting up CI/CD principles requires high cognitive load that can be tasked to an enabling team. The enabling team will set up a minimal pipeline for vertical teams, and after a hand-off and education period, the vertical team is responsible for adjusting the pipeline to their needs.

Successful companies follow a general rule that actionable feedback originates from paying customers solely. These are the people willing to spend money on the problem we are solving; these are the people we primarily listen to.

We set up the same strategy with our internal deliveries and offer products of supporting teams to vertical teams at cost. If vertical teams and their leads have to budget their dependencies on enabling teams, platform teams, or complicated subsystem teams, we can reason that only necessary technology survives within our organization.

Internal payments support baseline metrics of usage and help avoid building bloated platforms with <!-- vale alex.ProfanityMaybe = NO -->sexy<!-- vale alex.ProfanityMaybe = YES --> but unnecessary features. Platform teams should strive for the thinnest viable platform able to support our vertical teams to generate product revenue.
