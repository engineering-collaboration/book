---
title: Planning implementations
description: Making decisions is a speculative process. Even those deduced from considerable experience and data points are still predicting the future. Recording our decision-making process and the outcomes improves the precision of our fortune-telling over time, as we can identify successful and unsuccessful patterns.
---

# Planning implementations

After product features have been milled into sprint tasks and assigned to respective teams and engineers, we begin planning our implementation.

## Design Documents

For the majority of changes, before diving straight into producing code we write a short design document outlining behavior expectations. These documents serve as concise references to avoid misunderstandings among all stakeholders in the implementation process. They typically contain expected input and output parameters, REST, gRPC, or GraphQL schemas, or domain-specific agreements, such as storage decisions based on data access frequency. Design documents are imperative for large-scoped changes or inter-team collaborations.

To prevent turning this process into unnecessary red tape, we involve the minimum number of people necessary and strictly discuss the minimum requirements for the task. The individuals involved can be limited to the engineer implementing the task, an engineer from the customer team, and optionally a tech lead. These conversations typically happen organically, either verbally or in team chats. We make it a habit to copy the information to a publicly available platform.

### Documenting decisions

Making decisions is a speculative process. Even those deduced from considerable experience and data points are still predicting the future. Recording our decision-making process and the outcomes improves the precision of our fortune-telling over time, as we can identify successful and unsuccessful patterns.

The more context we are able to provide, the more transparent our decision is communicated. We explain the relevant success indicators, evaluate potential options, and include the names and titles of the people involved in the decision as future contacts for context that cannot be translated into written form.

Every decision has advantages and disadvantages that are unambiguously weighed against each other. If the decision evaluation process is written down and available, people are more willing to accept a conscious decision and its drawbacks.

[Red Hat published an article](https://www.redhat.com/architect/architecture-decision-records) about their process of documenting software architecture decisions using *architecture decision records*, but a general base framework for recording decisions includes the following properties:

- Date and Title
- Context
    - Problem statement
    - Solution options
    - People involved
- Decision
    - Solution
    - Advantages
    - Drawbacks

## Existing solutions

Problems are always more challenging than initially assumed, and we try to avoid rewriting code ourselves if a solution is available. Depending on our organization's open-source policy, we have a plethora of libraries and solutions available with permissive licensing.

We make use of our [innersource](../anatomy-of-a-software-company/innersourcing.md) channels and internal tech community to search for code, documentation, or engineers who have encountered a similar problem and verify if their labour is applicable to our use case. Minor modifications to existing code repositories are preferable over constructing personal solutions. All code we introduce into our organization increases potential maintenance work and bugs.

Having covered our basis of existing implementations, we get to work. As the implementing engineer, we have full trust in implementation decisions as long as the output matches the agreed-upon design doc. If the documented requirements turn out to be costly during development, we revisit the design doc with the stakeholders.

## Splitting integrations

To avoid long-living development branches, we integrate our work frequently into main. If necessary, we split our feature development into sensible coherent packages that can be integrated using feature flags and reviewed and tested separately.

This process lacks hard metrics as it is predominantly based on experience, and this decision is owned by the implementing engineer. Frequent integrations of small incremental changes increase code stability and reduce the code review burden, yet missing context might make the reasoning behind code changes opaque.
