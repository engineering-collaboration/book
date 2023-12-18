## Org Charts

An Organizational chart (org chart) is a helpful organigram for visualizing the level of responsibility and compliance, essentially illustrating "who is in charge of what and whom". Typically the CEO or board are the ultimate decision makers for problems that make their way to the top of the chart. For day-to-day practices the org chart shows the strategically placed chain of command for each business division. The higher up the org chart we go, the more long-term decisions we encounter.

Org charts are NOT a device to visualize communication channels and team structures within organizations. Any practical planing of team responsibilities or day-to-day tasks based on org charts is an inherently flawed process as teams and products within software companies strive to adapt to market conditions, that is what we're trying to achieve with this book anyway.

A healthy business is not built upon software alone and an org chart has little relationship with our engineers and inserting any names of our workforce into our the chart is pointless. Reasonable org chart updates include changes to geographic compliance responsibilities, drastic updates to our organizations cap table.

## Team size

Before getting into the structure of teams, let's have a brief excursion into anthropology.

What is the suggested cognitive limit to the number of people with whom one can maintain stable social relationships?

A number was first proposed in the 1990s by British anthropologist Robin Dunbar. Based on the behavior of primates, Dunbar proposed that humans can comfortably maintain 150 active contacts. A further break down 50 meaningful trust, 15 people with whom we share a strong trust, and 5 people with whom we have a deep trust.

Naturally, these numbers are not absolute. Using these numbers as a reference point the overall industry recommendation is to have a team sized between 3 people as a minimum and 9 people as a maximum. Amazon famously put it as "A team should be fed with 2 pizzas" - which may work in the US, but I guarantee that we will starve our European employees.

## The problem with horizontal teams

A common pattern we want to avoid in our organization is to design teams by disciplines. Examples of this can be found in organizations during <!-- vale write-good.Weasel = NO -->early<!-- vale write-good.Weasel = YES --> web development. The teams were structured as a front-end department, working on the visual representation and interaction of websites, a back-end department working on the system logic of received input from the user, and the database department, working on serializing and querying data across user sessions.

When teams are partitioned via disciplines, every costumer facing feature has multiple inter-team handoffs and inter-team communication to perform. This approach drastically reduces velocity of releases and potentially introduces friction of internal politics and an us-vs-them blame culture across teams.

Structuring teams via technical boundaries directs organic inertia towards misguided goals. Instead of focusing on the best customer experience, our backend team will focus on building the best backend the team can envision, regardless of organizational needs.

## Vertical teams

Rapid delivery cycles are achieved by designing teams as autonomous vertical structures. A vertical team is aligned to a single product or service, feature, user journey, or user persona. This team is empowered to build and deliver customer value as quickly and independently as possible. The team does not require hand-offs to other teams to perform parts of the task.

Vertical members include all disciplines across the necessary tech stack. Typically a vertical team has members versed in the following areas:

- Security
- Viability analysis
- Design and architecture
- Development and code
- Infra and operations
- Metrics and monitoring
- Product owner
- Testing and QA
- UX

Note that this is not a one-to-one mapping of skills to member. A member may cover multiple disciplines and more or less disciplines may be needed per team. 

The foundation of a vertical teams' success is the ability to deliver to production without waiting for other teams. If our team owns its vertical tech stack and its continuous delivery pipeline, it can rapidly address newly discovered limitations and flaws in the software system. This ensures all technical aspects are integrated into a feedback loop with our customers.  

The independent nature of vertical teams supports teams to use the technology most appropriate for their specific customer problem, e.g. using a document database vs a graph database. 

A vertical team works on any sort of deliverable or outcome within an organization. A vertical team either works directly on a feature of our product, or works towards internal goals.

<!-- vale Vale.Avoid = NO -->

!!! note
    If you've read *Team topologies* this concept is going to sound familiar. Whenever this book mentions **vertical team** we are referring to a **stream-aligned team** as defined in *Team topologies*.

    If you are familiar with the Spotify model, a **vertical team** is what the Spotify model calls **Squads** in structure only. A vertical team does not follow the reporting schema or necessarily the chapter structure of the Spotify model.

<!-- vale Vale.Avoid = YES -->

## Cognitive load

Just as we design teams after our software architecture, we want ensure our software architecture considers the maximum cognitive load of a team. If during our software design process we realize a certain module exceeds the capacity of what can realistically be achieved with a team size following Dunbar's number, we should consider splitting it into submodules for dedicated teams.
