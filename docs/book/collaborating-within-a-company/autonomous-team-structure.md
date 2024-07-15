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
