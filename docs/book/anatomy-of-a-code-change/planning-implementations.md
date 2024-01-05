---
title: Planning implementations
description: Making decisions is a speculative process. Even ones deduced from considerable experience and data points are still predicting the future. Recording our decision making process and the outcomes improves the precision of our fortune telling over time as we can identify successful and unsuccessful patterns.
---

# Planning implementations

After product features have been milled into sprint tasks and the tasks assigned to respective teams and engineers, we start planning our implementation.

## Design Documents

For a majority of changes before diving straight into producing code we write a short design document with behavior expectations. These documents are short references to avoid misunderstandings between all stakeholders in the implementation process and typically contain expected input and output parameters, REST, GRPC or GraphQL schemas or domain specific agreements such as storage decisions based on data access frequency. Design documents are an imperative for larger scoped changes or inter team changes. 

We avoid turning this process into unnecessary red tape by involving the minimum amount of people necessary and strictly discussing the minimum of requirements for the task. The people involved can be limited to the engineer implementing the task, an engineer from the customer team, and optionally a tech lead. These conversations typically happen organically verbally or in team chats. We make it a habit of copying the information to a publicly available platform.

### Documenting decisions

Making decisions is a speculative process. Even ones deduced from considerable experience and data points are still predicting the future. Recording our decision making process and the outcomes improves the precision of our fortune telling over time as we can identify successful and unsuccessful patterns.

The more context we are able to give, the more transparent our decision is communicated. We explain the relevant success indicators and evaluate potential options. We include the names and titles of the people involved in the decision as a future contact for context we cannot translate into written form.

Every decision has advantages and disadvantages which are unambiguously weighed against each other. If the decision evaluation process is written down and available, people are more willing to accept a conscious decision and its drawbacks.

[Red Hat published an article](https://www.redhat.com/architect/architecture-decision-records) about their process of documenting software architecture decisions using *architecture decision records*, but a general base framework for recording decisions includes the following properties.

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

Problems are always more difficult than initially assumed and we try to avoid re-writing code ourselves if a solution is available. Depending on our organization's open source policy we have a plethora of libraries and solutions available with permissive licensing.

We make use of our [innersource](../anatomy-of-a-software-company/innersourcing.md) channels and internal tech community to search for code, documentation, or engineers who have encountered a similar problem and verify if their workings are applicable for our use case. Minor modifications to existing code repositories are preferable over constructing personal solutions. All code we introduce into our organization increases potential maintenance work and bugs.

Having covered our basis of existing implementations, we get to work. As the implementing engineer we have full trust on implementation decisions as long as the output matches the agreed upon design doc. If the documented requirements turn out to be costly during development, we revisit the design doc with the stakeholders.
