---
title: Team Interactions
description: Large-scale organizations rely on a multitude of autonomous teams solving their respective domain problems in an efficient manner.
---

# Team Interactions

In [Autonomous Team Structure](./autonomous-team-structure.md) we discussed the importance of assigning software responsibilities to self-sufficient teams that plan, implement, and deliver features independently. In order for them to do so, we establish internal supporting teams to improve the product team's efficiency. The previous chapter classified three types of supporting teams and their functions. *Team Interactions* highlights distinct approaches for software teams to work together effectively.

!!! quote "Conway's Law"
    *"Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure."*  
    - Melvin E. Conway

    *"If you have four groups working on a compiler, you'll get a 4-pass compiler."*  
    - Eric S. Raymond

    *"The architecture of the system gets cemented in the forms of the teams that develop it."*  
    - Ruth Malan

    *"Someone who claims to be an [Software] architect needs both technical and social skills. They also need a remit that is broader than pure technology - they need to have a say in business strategies, organizational structures, and personnel issues."*  
    - Allan Kelly

<!-- What is Conway's Law? -->

Conway's Law decrees the universal behavior that every software architecture ultimately mirrors the layout and communication practices of the team working on the software. The law highlights the fallacy of separating department structure and software architecture. No matter how insistent we are about our architecture mandate, the software structure will ultimately converge towards towards the department structure. This truth has been an inconvenience to software companies that emerged from conventional departments organized by discipline and reporting hierarchy.

Modern software companies can use Conway's law to their benefit. A strategy called the *Inverse Conway Maneuver* suggests that we design our organization, not the other way around. First we design the software, then we position autonomous vertical teams to match the software's features and modules. Placing people and teams according to their software contributions leads to less friction in software delivery.

But software architecture goes beyond identifying modules and components. We define responsibility and boundaries of each component, plan accessability patterns and build APIs for each module. We mirror these patterns into our inter-team dynamics. When autonomous teams interact, we ensure distinct ownership and responsibility of the domains. Thankfully, some smart people documented successful interaction patterns between teams. 

## Interaction Forms

While we incentivize organization-wide public communication (as discussed in [Communication Channels](./communication-channels.md)), we do not encourage teams collaborating via an organization-wide free-for-all. In order to get work done, it is necessary to define sensible and effective interactions between teams.

The book *Team Topologies* lists three interaction modes between teams. By framing interaction modes with *promise theory* and consistent communication styles for each team and interaction mode, we encourage an increase of confidence and trust between teams.

### Collaboration

The collaboration phase is characterized by a high degree of discovery. It is a useful tool when working on new systems or when spinning out platform or complicated-subsystem teams. During inter-team collaboration, our team members join in pair programming, whiteboarding, and brainstorming sessions.

Collaboration is a finite phase. The communicative and social overhead leads to a reduced return on investment after a while and becomes actively a hindrance if done interminably. Following Conway's law, tight collaboration over time will lead to interdependent software services lacking well-defined limits/borders.

After foundational success criteria have been established, we can cap the amount of communication to work on the product. Initially, we check in periodically with reduced frequency over time. After a predetermined amount of time, teams distance themselves and move into an "X-as-a-Service" model or a facilitating model.

### X-as-a-Service

Mirroring the titular product strategies, X-as-a-Service interactions consist of a vertical team consuming the output that a different team provides. Typical scenarios include vertical teams consuming libraries of complicated subsystem teams or relying on functionality and APIs of platform teams. This interaction mode provides distinct clarity of ownership between the teams.

The communication during this interaction mode relies mainly on documentation. Dedicated support may be required for Day 0 and Day 1 tasks, with isolated assistance over time. The quality of the interaction improves with predictable deliveries, consistent APIs, and a focus on developer experience.

### Facilitating

A facilitating team actively supports a vertical team in tasks other than directly building the main software systems. Technical facilitating teams consist of experts that accelerate the delivery of software processes into vertical teams. Having completed the facilitating action, the vertical team is able to function fully autonomously.

Typical facilitating scenarios include:

- Education and upskilling, where coaches teach new techniques or processes to team members.
- Adoption of new tools, where skeleton systems are set up by the facilitating team and handed over to the vertical team at the end of the phase.
- Political duties or user insights from vertical teams adopting new feature rollouts from X-as-a-Service interactions.

## Putting it all Together

Combining the practices of [autonomous vertical teams](./autonomous-team-structure.md), [internal supporting teams](internal-supporting-teams.md), and the team interactions discussed within this chapter, we start visualizing our team structure. When designing team boundaries and interaction modes, we commit to the *Inverse Conway Maneuver* and map our communication channels to our software architecture. The following picture showcases an academic slice of a larger company.

[![Team Topology](../../assets/images/book/collaborating-within-a-company/team-topology.webp)](../../assets/images/book/collaborating-within-a-company/team-topology.png)

Exploring the product teams, the check-out team, and the web shop team release features to the consumer-facing side of our software. These vertical teams own the entire development lifecycle of their respective features, from customer feedback to design, code, testing, and delivery. Contrary to the image's austerity, our organization consists mainly of product feature teams. We aim for one supporting team for every six to nine product teams.

As the cognitive load of global payment systems exceeds the check-out team's limits, we split off a dedicated team for compliance and localization of payments. Initially, the team collaborates meticulously with the check-out team to establish requirements and services for payment interactions. Over time, the payment team offers either a set of libraries or a platform for payments via the *X-as-a-Service* interaction.

The 3D rendering team already matured from a *collaboration* state, offering sophisticated 3D rendering libraries as a service to display products within an additional dimension. Our web shop team consumes the libraries, and over time the communication has receded to reading the provided documentation of the API.

Our vertical platform teams working on the product search component and the metrics deliver their respective releases to the internal platform, accessible to all teams across the company. The platform teams consolidate fragmented implementations into shared high-performance implementations.

Our CI/CD research team spent the last months evaluating tools and strategies for advanced testing practices. Facilitating our metrics team, our research team is presenting and validating its findings in a low-risk internal environment. As soon as the metrics team reaches self-reliance with the new practices, the CI/CD R&D team moves to facilitate the next vertical team.

!!! tip "Recommendation"
    <img src="https://images.squarespace-cdn.com/content/v1/5b3296b78ab7229ecafcf4ed/1566982599895-T0K28HX7RF7YJ2GE1D4K/TeamTop_cover_RGB_flat_stroke.jpg?format=1000w" width="360" style="display: block; margin-left: auto; margin-right: auto;" alt="Engineering Collaboration">
    <br>
    <br>
    In *Team Topologies*, IT consultants Matthew Skelton and Manuel Pais share secrets of successful team patterns and interactions to help product, technology, and engineering leaders design high-impact team-of-teams organizations. *Engineering Collaboration* covers some high-level concepts of *Team Topologies*.
    
    For additional details and information, I highly recommend you check out the book and more at [***teamtopologies.com***](https://teamtopologies.com/).


<!-- 
TODO: (Daniel) Communicating via Team interactions
The default cannot be to directly call members from other teams to request help and support
Find good channel, e.g. support line, or create a ticket and meeting, otherwise ask other team to book time

If we can track our team interactions, we can make decisions regarding team responsibilities. If we find exclusive strong dependencies and a reduced cognitive load of maintaining a platform or library, it might be advantageous to empower the team to do so.

A topological view of our organization clarifies what we work on. Our team's sociotechnical dependencies and deliverables are subject to our product and organizational structures. Collaborating effectively within our team has less impact when our output is redundant. 

!!! quote "Why we mandate collaboration methods"
    *"Technologies and organizations should be redesigned to intermittently isolate people from each other's work for the best collective performance in solving complex problems."*  
    - Etha Bernstain, Jesse Shore, and David Lazer
    
    *"Intermittent collaboration found better solutions than constant interaction."*  
    - Bernstein and colleagues
    
    *"The roots of Toyota's success lie not in its organizational structures but in developing capability and habits in its people."*  
    - Mike Rother
-->

<!-- architecture over time -->

Our software architecture evolves with our organization. The amount and nature of our users influences how we provide our services. The number of employees in our company affects how we build software. Changes to our software architecture and continuous delivery flow convert into our team constellation.


## Organizational Charts

Organizational charts visualize the level of responsibility "who is in charge of what and whom". For day-to-day practices, the org chart shows the strategically placed chain of command for each business division. The higher up the org chart we go, the more long-term decisions we encounter.

Org charts are not a device to visualize communication channels and team structures within organizations. Any practical planning of team responsibilities or day-to-day tasks based on org charts is an inherently flawed process as teams and products within software companies strive to adapt to market conditions.

A healthy business is not built upon software alone, and an org chart has little relationship with our engineers, and inserting any names of our workforce into our chart is pointless. Reasonable org chart updates include changes to geographic compliance responsibilities, drastic updates to our organization's cap table.

