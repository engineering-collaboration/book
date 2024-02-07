---
title: Standardization
description: Standardization is a double edged sword. Though it improves communication across the organization, we might inadvertently limit a teams capabilities to efficiently and creatively do their work.
---

# Standardization

Autonomous vertical teams eliminate dependencies and handoffs to other teams for a successful application deployment. Yet teams do interact with one another and team members collaborate within a team. To reduce friction across our organization it makes sense to standardize a certain set of dynamic variables.

Standardization is a double edged sword. Though it improves communication across the organization, we might inadvertently limit a teams capabilities to efficiently and creatively do their work.

<!-- vale write-good.Weasel = NO -->
- We only standardize what is strictly necessary.
- We only standardize the lowest common denominator of what is necessary.
- If there is an open source solution, we use the open source solution.
<!-- vale write-good.Weasel = YES -->

## Standardizing schemas instead of tools

As we hire across various domains our teams trend towards using tools popular in their specialties. Imposing arbitrary restrictions dampens productivity of our teams. Instead of standardizing platforms or tools, we standardize our schemas and data description languages.

By dictating schemas, we ensure our teams are utilizing the tools that are deemed most productive for the specific domain, but the output and input of data and products migrates well between teams.

Community driven open source projects like *OpenTelemetry* have become hugely popular schemas and a wide spectrum of industry leading platforms and tools support import and export of *OpenTelementry* data. By standardizing the format of our telemetry data, instead of the library and tools of our telemetry, our teams are flexible in their choice and needs of telemetry dashboards and search tools.

A popular selection of schemas for a broad set of use cases can be found at [schema.org](https://schema.org).
