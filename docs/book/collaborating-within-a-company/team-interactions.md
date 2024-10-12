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

While we incentivize inter-team communication, teams can not work together in an organization-wide free-for-all. In order to get work done, we define sensible and effective interactions between teams. Depending on the team dynamics, the forms of interactions differ through approach, frequency, duration of inter-team work.

As in *Autonomous Teams*, we defer to the wisdom of Matthew Skelton and Manuel Pais, publicized in their book *Team Topologies* (I, personally, cannot recommend this book enough and encourage all readers to visit their website and watch the videos on Youtube). The two authors identified and listed three common interaction patterns between teams.

### Collaboration

A collaboration phase incorporates a high degree of discovery. When a difficult problem within a vertical team propels us to spin out an enabling teams or complicated sub-system team, we initially rely on close collaboration between the teams to understand and solve the problem effectively and long-term. When we design new systems across multiple domains, we include multiple vertical teams to collectively solve problems that span different disciplines.

During the inter-team collaboration, our team members join in pair programming, whiteboarding, and brainstorming sessions. In the early stages of collaboration teams communicate frequently and across all available channels. Yet, collaboration is a finite phase. The communicative and social overhead becomes a hindrance if done interminably. Initial problem solving turns into a multi-disciplinary serendipity-driven form of busy work.

Conway's law counsels us that tight collaboration over time leads to interdependent software services lacking well-defined responsibilities. After foundational success criteria have been established, we cap the amount of communication between teams and refocus our efforts on solving our domain problems. Depending on the problem, we completely shield the team from the work they collaborated on, or establish them as the first consumer of of an *X-as-a-Service*.

### X-as-a-Service

As indicated by the titular software strategy, vertical teams consume the output of a X-as-a-Service interaction strategy. Whether our teams consume libraries of a complicated sub-system team or rely on functionality of an internal platform, this interaction form is unidirectional. It provides distinct clarity of ownership between the teams.

Mature *X-as-a-Service* communication builds its foundation on strong documentation and self-service functionality. Besides dedicated support for Day 0 and Day 1 tasks, this interaction form requires little in-person assistance. As is the case with public software, the quality of the interaction improves with predictable deliveries, consistent APIs, and a focus on positive developer experience.

### Facilitating

A facilitating team actively supports a vertical team in tasks other than directly working on the main software systems. These teams provide their expertise to enhance aspects of the product development cycle. For example, facilitating teams may accelerate the software development by setting up skeleton systems of continuous delivery tools and demonstrate how to extend and configure the team's setup.

When teams tackle a problem that requires different skills than previous problems, facilitating teams fulfill an educational role by teaching the team a new language, framework, or design pattern. For example, due to organic growth, our team decides to move from a synchronous architecture to an event-driven architecture. A facilitating expert demonstrates the opportunities and challenges this decision brings, and shares successful approaches and popular tooling for the transition.

Besides facilitating technical problems, we utilize these supporting teams to mediate inter-team conflict, bridge political gaps, or gather company insights via holistic evaluations. Just as *Collaboration*, *Facilitation* is a temporary state. Having completed the facilitating action, the vertical team is able to function fully autonomously.

## Putting it all Together

We visualize our team topology by connecting [Autonomous Teams](./autonomous-team-structure.md) using the corresponding team interactions discussed within this chapter. Utilizing the *Inverse Conway Maneuver*, we base our team boundaries and interaction on our software architecture. The following picture demonstrates an academic example with all interaction modes.

[![A graph with different autonomous software teams for an e-commerce company. The teams are labeled with the following responsibilities: checkout team, payment team, web shop team, 3D team, search team, metrics team, ci/cd research and development team. The checkout team collaborates with the payment team. The web shop team consumes a library from the 3D team via the x-as-a-service mode. The picture depicts an internal platform. The platform consists of features produced by the search team and metrics team. The checkout team and the web shop team both consume the internal platform via the x-as-a-service mode. The CI/CD team research and development team facilitates the metrics team and introduces new continuous testing techniques.](../../assets/images/book/collaborating-within-a-company/team-topology.webp)](../../assets/images/book/collaborating-within-a-company/team-topology.png)

As an image offers limited space, we confine ourselves to two product teams in our example. In reality our product teams far outnumber our supporting teams. The check-out team and the web shop team release features to our consumer-facing product. These autonomous teams own the entire development lifecycle of their respective domains, from customer feedback to design, code, testing, and delivery.

As the responsibility of global payment systems exceeds the check-out team's resources, we split off a dedicated team for compliance and localization of payments. Initially, the team collaborates meticulously with the check-out team to establish requirements and services for payment interactions. Over time, the payment team offers a set of libraries or a platform for payments via the *X-as-a-Service* interaction.

The 3D rendering team already matured into this state. Our web shop team consumes the 3D team's sophisticated 3D rendering libraries to display products within an additional dimension. Over time the interaction between these two teams receded from personal interactions to communicating via the provided documentation of the API.

The image shows two vertical platform teams, respectively working on product search capabilities and the self-service metrics offerings. These teams provide their services via an internal platform, accessible to all teams across the company. As a large number of teams consume these services, the platform teams reduce computational cost by building high-performance solutions and reduce communication overhead by providing a solid and transparent developer experience.

Our CI/CD research team spent the last months evaluating tools and strategies for advanced testing practices. Facilitating our metrics team, our research team is presenting and validating its findings in a low-risk internal environment. As soon as the metrics team reaches self-reliance with the new practices, the CI/CD R&D team moves to facilitate the next vertical team.

!!! tip "Recommendation"
    <img src="https://images.squarespace-cdn.com/content/v1/5b3296b78ab7229ecafcf4ed/1566982599895-T0K28HX7RF7YJ2GE1D4K/TeamTop_cover_RGB_flat_stroke.jpg?format=1000w" width="360" style="display: block; margin-left: auto; margin-right: auto;" alt="Engineering Collaboration">
    <br>
    <br>
    In *Team Topologies*, IT consultants Matthew Skelton and Manuel Pais share secrets of successful team patterns and interactions to help product, technology, and engineering leaders design high-impact team-of-teams organizations. *Engineering Collaboration* covers some high-level concepts of *Team Topologies*.
    
    For additional details and information, I highly recommend you check out the book and more at [***teamtopologies.com***](https://teamtopologies.com/).

## Communicating via Team interactions

<!-- software design -->

A topological view of our organization clarifies what our teams work on and who they deliver to. Our team's sociotechnical dependencies and deliverables are subject to our product and organizational structures. If we can track our team interactions, we can make decisions regarding team responsibilities. If we find exclusive strong dependencies and a reduced cognitive load of maintaining a platform or library, it might be advantageous to empower the team to do so.  Collaborating effectively within our team has less impact when collaborating beyond it becomes redundant.

Limiting ourselves to three interaction patterns allows us to develop, share, and continuously improve communication strategies for our interactions. We can enforce guidelines on how we document *x-as-a-service* offerings. A unified documentation style and language lessens onboarding friction of new teams. Tooling and standards help us find and consume documentation and tutorials. We offer support channels to not bombard our team members with untracked support requests via direct messages.

When sequentially facilitating a large number of teams due to large-scale changes across our organization, we document, store, and improve the way we support these teams. After a couple sessions, the facilitating teams should improve their efficiency of imprinting knowledge just by sheer practice. We keep our material and demonstrations up-to-date and available to teams even after we completed our facilitating interactions.

Collaboration frameworks support coherent and ordered interactions between teams. By developing practices for the frequency and shape of successful collaboration meetings, we steer clear of the chaos a multi-team free-for-all meeting session entails. We encourage direct messages between teams and team members, but ensure they are not the forum in which decisions are made.

We cannot (and don't want to) control all communication flow within our company. Designing team interactions creates blueprints for exactly that, inter-*team* interactions. Individual contributors will always need to send direct messages to each other across the organization. Be it for quick clarifications, asking for advice, or ranting about work problems. These back channels skip any bureaucratic processes and ensure our teams get work done faster.

!!! quote "Why we mandate collaboration methods"
    *"Technologies and organizations should be redesigned to intermittently isolate people from each other's work for the best collective performance in solving complex problems."*  
    - Etha Bernstain, Jesse Shore, and David Lazer
    
    *"Intermittent collaboration found better solutions than constant interaction."*  
    - Bernstein and colleagues
    
    *"The roots of Toyota's success lie not in its organizational structures but in developing capability and habits in its people."*  
    - Mike Rother


<!-- promise theory -->

When joining teams via an interaction mode we take care to ensure the communication is based on trust and mutual respect. A popular tool to prime our teams for success is the *Promise Theory*. Originally developed by computer scientist Mark Burgess, the framework defines our inter-team interactions by promises, rather than obligations.

Contracts are the most common example of interacting via obligations. When foreign entities cooperate, a neutral third party writes a contract outlining the responsibilities of each entity. In the corporate world we interact with caution and distrust. With no precise language, any failing in personnel, personality, or politics has disastrous consequences for our organization.

However, within our organization we trust our teams implicitly. Our fellow teams have our best interest at heart and want to see us succeed. Even if a partner team does fail to deliver on a promise, we resolve the issue together, rather than assigning blame. Failure may seldomly be attributed to incompetence or malevolence, but rather a lack of resources and inconsistent communication.

Rather than presenting our current approach and requesting requirements, we tell the team what we want to achieve. This way the team with domain expertise has the know-how freedom to work on an optimal solution. The resulting output often outperforms any requirements we could have come up with from the consuming end. Ultimately, this a trust-by-default approach ensures the right people are solving the right problems the right way.

<!-- architecture over time -->

Our software architecture evolves with our organization. The amount and nature of our users influences how we provide our services. The number of employees in our company affects how we build software. Changes to our software architecture and continuous delivery flow convert into our team constellation.

Limiting ourselves to these interaction patterns leads to simple software architecture. Components with clearly defined boundaries connect via practical interfaces. As Ruth Malan put it: *"The architecture of the system gets cemented in the forms of the teams that develop it"*, and we can hardly get any more concrete than that.
