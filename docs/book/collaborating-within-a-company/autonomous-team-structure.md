---
title: Autonomous Team Structure
description: When teams are partitioned via disciplines, every customer-facing feature has multiple inter-team handoffs and inter-team communication to perform. This approach drastically reduces the velocity of releases and potentially introduces friction of internal politics and an us-vs-them blame culture across teams.
---

# Autonomous Team Structure

During early web development teams were organized by disciplines. The front-end department developed the visual interaction for websites, the back-end department worked on the system logic of received input from the user, and the database department serialized data across user sessions.

[![Horizontal Teams](../../assets/images/book/collaborating-within-a-company/horizontal-teams.webp)](../../assets/images/book/collaborating-within-a-company/horizontal-teams.png)

Teams partitioned via disciplines face multiple handoffs and inter-team communication to deliver a customer facing feature. This approach drastically reduces the velocity of releases and potentially introduces friction of internal politics and an us-vs-them blame culture across teams.

The organic inertia within monodisciplinary teams directs our team members towards misguided goals. A team consisting entirely of backend engineers will focus on building the best backend the team can envision. While this may be a very self-fulfilling task for our engineers, our organizational needs requires our employees to focus on the best customer experience.

## Vertical Teams

Designing teams as cross-disciplinary vertical structures allows us to align multiple competences with a shared purpose. A vertical team focuses on a single service, feature, or user persona and is empowered to build and deliver customer value as quickly and independently as possible. The team does not require hand-offs to other teams to perform parts of the task and achieves rapid iteration cycles by working autonomously.

[![Vertical Teams](../../assets/images/book/collaborating-within-a-company/vertical-teams.webp)](../../assets/images/book/collaborating-within-a-company/vertical-teams.png)

Vertical members include all disciplines across the necessary tech stack. Typically, a vertical team has members versed in the areas of project management, security, infrastructure, development, metrics and monitoring, and UX. These do not represent a one-to-one mapping of skills to members. A member may cover multiple disciplines, and more or fewer disciplines may be needed per team.

The foundation of a vertical team's success lies in the ability to deliver changes to production without dependencies on other teams. It owns its tech stack and its continuous delivery pipeline and addresses newly discovered limitations and flaws in the software system autonomously. This ensures a reliable feedback loop with its customers and the ability to select the technology most appropriate for the specific problem, e.g., using a document database vs a graph database.

In 1955 *Elting Morison* published the study *"Mining Coal: How Long Can We Continue?"* exploring efficiencies for team structures in coal mines. The key findings emphasize the importance of team autonomy and self-management in improving productivity. In the study, smaller teams tend to operate more efficiently because each member has a clearer understanding of their responsibilities and can coordinate their efforts more effectively.

Before *James P. Womack*'s *"The Machine That Changed the World"* popularized the concept of lean manufacturing, *Womack* was a project manager at Ford. When his team visited the Toyota operations in Japan and surprised to see how autonomously the teams at Toyota operated on the production floor, a stark contrast to the centralized decision-making and hierarchical structure they were used to at Ford.

Vertical teams were re-discovered in software development in the early 2010s. The book *Team topologies* - a major influence for *Engineering Collaboration* - refers to vertical teams as *stream-aligned teams* and emphasizes the importance of autonomous delivery. Spotify published a their ongoing organizational effort with *The Spotify model*, including a multi-disciplinary team composition called *Squads*. However, vertical teams as described in *Engineering Collaboration* do not necessarily follow the same reporting schema or chapter structure of the Spotify model.

## Team Size

A number was first proposed in the 1990s by British anthropologist Robin Dunbar. Based on the behavior of primates, Dunbar proposed that humans can comfortably maintain 150 active contacts. Delving deeper, we are capable of 50 meaningful relationships, 15 people with whom we share a strong relationship, and 5 people whom we deeply trust.

Naturally, these numbers are not absolute. Using these numbers as a reference point, the overall industry recommendation is to have a team sized between 3 people as a minimum and 9 people as a maximum. Amazon famously put it as "A team should be fed with 2 pizzas" - which may work in the US, but I guarantee that we will starve our European employees.

Just as we design teams after our software architecture, we want to ensure our software architecture considers the maximum cognitive load of a team. If during our software design process we realize a certain module exceeds the capacity of what can realistically be achieved with a team size following Dunbar's number, we should consider splitting it into submodules for dedicated teams.

## Organizational Charts

An Organizational chart (org chart) is a helpful organigram for visualizing the level of responsibility and compliance, essentially illustrating "who is in charge of what and whom." Typically the CEO or board are the ultimate decision-makers for problems that make their way to the top of the chart. For day-to-day practices, the org chart shows the strategically placed chain of command for each business division. The higher up the org chart we go, the more long-term decisions we encounter.

Org charts are NOT a device to visualize communication channels and team structures within organizations. Any practical planning of team responsibilities or day-to-day tasks based on org charts is an inherently flawed process as teams and products within software companies strive to adapt to market conditions; that is what we're trying to achieve with this book anyway.

A healthy business is not built upon software alone, and an org chart has little relationship with our engineers, and inserting any names of our workforce into our chart is pointless. Reasonable org chart updates include changes to geographic compliance responsibilities, drastic updates to our organization's cap table.
