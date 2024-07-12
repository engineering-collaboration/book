---
title: Innersourcing
description: Innersourcing is the practice of sharing source code, practices, and documentation within an organization. Much like open-source projects, the motivation is to reduce duplicate work and increase velocity for market-mandated features.
---

# Innersourcing

Innersourcing is the practice of sharing source code, practices, and documentation within an organization. Much like open-source projects, the motivation is to reduce duplicate work and increase velocity for market-mandated features. Through innersourcing practices and communication channels, we share tools, libraries, and platforms globally throughout our organization.

We provide time, space, and money to enable and encourage people from different teams with similar skills and expertise to come together to learn from each other and to develop our professional competencies. Because this form of communication is not strictly tied to the design and building of operational software systems, Conway's law plays a less potent role, and freer cross-association between teams can take place.

## Breaking Down Silos

Innersourcing done appropriately builds further trust between counterparts on other teams and encourages practitioners to communicate between departments. This kind of engagement rewards collaboration and organically encourages professional upskilling. The best thing we can do for our organization and people is to institute a culture of experimentation and learning and invest in the technical and management capabilities that enable it.

High discoverability of projects and code on a broad scale avoids wasted time and work duplication. By introducing the habit of researching existing internal solutions before tackling problems, our organization avoids solving the same problems multiple times. When engineers reach out to each other with questions, we reduce silos between teams, disciplines, and departments.

## Standardization

Autonomous vertical teams eliminate dependencies and handoffs to other teams for a successful application deployment. Yet teams do interact with one another, and team members collaborate within a team. To reduce friction across our organization, it makes sense to standardize a certain set of dynamic variables.

Standardization is a double-edged sword. Although it improves communication across the organization, we might inadvertently limit a team's capabilities to efficiently and creatively do their work.

<!-- vale write-good.Weasel = NO -->
- We only standardize what is strictly necessary.
- We only standardize the lowest common denominator of what is necessary.
- If there is an open-source solution, we use the open-source solution.
<!-- vale write-good.Weasel = YES -->

### Standardizing Schemas instead of Tools

As we hire across various domains, our teams trend towards using tools popular in their specialties. Imposing arbitrary restrictions dampens the productivity of our teams. Instead of standardizing platforms or tools, we standardize our schemas and data description languages.

By dictating schemas, we ensure our teams are utilizing the tools that are deemed most productive for the specific domain, but the output and input of data and products migrate well between teams.

Community-driven open-source projects like *OpenTelemetry* have become hugely popular schemas, and a wide spectrum of industry-leading platforms and tools support the import and export of *OpenTelemetry* data. By standardizing the format of our telemetry data, instead of the library and tools of our telemetry, our teams are flexible in their choice and needs of telemetry dashboards and search tools.

A popular selection of schemas for a broad set of use cases can be found at [schema.org](https://schema.org).
