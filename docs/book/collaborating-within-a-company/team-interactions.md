---
title: Team Interactions
description: Large-scale organizations rely on a multitude of autonomous teams solving their respective domain problems in an efficient manner.
---

# Team Interactions

Conway's law is not solely defined by the architecture of our teams; it also covers how these subsystems communicate with each other. We use people who are skilled in technical API design to help build boundaries between teams within an organization.

Large-scale organizations rely on a multitude of autonomous teams solving their respective domain problems in an efficient manner. When autonomous teams interact, we ensure distinct ownership and responsibility of the domains by applying communication based on *Promise theory*. Rather than teams imposing obligations upon one another, teams promise to deliver a product beneficial for the interaction.

<!-- vale Vale.Avoid = NO -->
To highlight the difference of the two approaches, we are borrowing a quote from *Mark Burgess*'s book *Thinking in Promises* - "Don't tell me what you are doing, tell me what you are trying to achieve!".
<!-- vale Vale.Avoid = YES -->

<!-- 
TODO: (Daniel) Embed here, moved from autonomous teams section

## Organizational Charts

Organizational charts visualize the level of responsibility "who is in charge of what and whom". For day-to-day practices, the org chart shows the strategically placed chain of command for each business division. The higher up the org chart we go, the more long-term decisions we encounter.

Org charts are not a device to visualize communication channels and team structures within organizations. Any practical planning of team responsibilities or day-to-day tasks based on org charts is an inherently flawed process as teams and products within software companies strive to adapt to market conditions.

A healthy business is not built upon software alone, and an org chart has little relationship with our engineers, and inserting any names of our workforce into our chart is pointless. Reasonable org chart updates include changes to geographic compliance responsibilities, drastic updates to our organization's cap table.
-->

## Interaction Forms by Team Topologies

!!! abstract "This section is heavily based on the book *Team Topologies*."

!!! quote 
    *"Technologies and organizations should be redesigned to intermittently isolate people from each other's work for the best collective performance in solving complex problems."*  
    - Etha Bernstain, Jesse Shore, and David Lazer
    
    *"Intermittent collaboration found better solutions than constant interaction."*  
    - Bernstein and colleagues
    
    *"The roots of Toyota's success lie not in its organizational structures but in developing capability and habits in its people."*  
    - Mike Rother

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

<!-- 
TODO: (Daniel) Communicating via Team interactions
The default cannot be to directly call members from other teams to request help and support
Find good channel, e.g. support line, or create a ticket and meeting, otherwise ask other team to book time
-->

<!--
TODO: (Daniel) Move the two paragraphs below to the chapter communication channels
-->

## Workspace Design

We have influence on the communication behavior of our teams. As with the *Inverse Conway Maneuver*, we ask ourselves who we want to communicate with whom, how frequently, and design our workspaces around this mandate. This approach works for both physical and virtual workspaces.

The most physical method for steering communication within an office is, quite physically, walls. We plan who shares an office with whom and the physical distance between teams. We arrange our vertical teams by rooms, floors, and buildings. Subtler influences of communication behavior are established by designing the viewing angles of individual contributors. For office workers, we strategically place table arrangements, whiteboards, plants, and décor.

Over the course of a product cycle, we want to offer workspace characteristics for our teams:

- Environments for low-noise, high-concentration work
- Environments for collaborative work and brainstorming
- Environments for social engagement across disciplines

Our teams and individual contributors should be able to cycle through these environments with little overhead. We can support the creation of these environments through **tactile efforts**, **virtual tools**, and **process guidelines**.

Within office buildings, we offer closed offices with high ceilings and natural and adjustable lighting for low-noise environments. We establish war rooms and conference rooms for collaborative experiences and nurture social encounters in the kitchen, break rooms, or lounges. While we are somewhat limited by the physical location of our remote teams, we have the ability to offer equipment for home office design, noise-canceling headphones, or offer coworking office spaces.

We guide virtual collaboration experiences with our set of tools and features. The ability to send and also mute incoming noise in the form of emails, instant messages, or calls enables our contributors to focus on high-concentration work without distractions. Real-time collaboration tools support our teams when sketching out ideas and brainstorming. Cross-disciplinary channels and public-by-default channels within our primary communication tool underline our organization's practice of open communication.

Our policies and processes enable helpful workplace characteristics by setting certain expectations in the way our teams do their work. Offering flexible hours supports our teams to plan out work hours which are most productive for them. Disallowing meetings during certain days or times of days in the week guarantees that teams can plan low-noise work. Setting our kick-off events and social events during work hours prevents the exclusion of team members with responsibilities outside of work. Ensuring consistent work practices across teams nurtures inter-team work discovery.

By setting up organic traits and processes, we encourage interaction modes to become team habits.

## On-site, Remote, and Hybrid 

Since a global pandemic and government-dictated self-isolation accelerated work-from-home policies, remote work has become a debated topic. With software, we have the unique ability to hire (almost) any division of our workforce from any timezone. Hiring across state and country borders introduces additional HR responsibilities of income tax, potential organizational tax, etc.

Virtual and remote work have the potential to hire a more diverse workforce from a larger talent pool. These factors should be the driving factor of workplace design and need to be documented. Workspaces are tools towards productivity and should be wielded as such. Offices are not to monitor our employees. Our employees are not children.

If we offer remote work, our organization has to ensure full remote capabilities. Decisions have to be made and understood using remote tools. If decisions or agreements are made within the office walls <!-- vale write-good.Weasel = NO -->exclusively<!-- vale write-good.Weasel = YES -->, it negates the positive impact our remote members have on our organization.

Remote work performs best with the correct infrastructure. Established tools, processes, communication habits. Proper cameras, multiple screens, good microphones, and a stable and fast internet connection. Our remote employees are still working in physical locations. While we cannot fully control the environment, we can, if necessary, influence it by offering coworking spaces or dedicating infrastructure or equipment.

As our teams evolve and interactions evolve, we also adapt our office design. This requires high flexibility for physical offices. Virtual offices are easier to scale.

Hybrid models have the advantage to focus our employees on work. Parents can choose to work undisturbed in the office. The downside is potential expenses for unused space. We can offer free access to co-working spaces.
