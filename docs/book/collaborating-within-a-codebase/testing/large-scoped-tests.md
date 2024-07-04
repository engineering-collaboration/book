---
title: Large-Scoped Tests
description: Large-scoped tests test the flow of commands from user input across different APIs, serialization strategies, and verify that the returned behavior is as expected.
---

# Large-Scoped Tests

Large-scoped tests (LST) test the flow of commands from user input across different APIs, serialization strategies, and verify that the returned behavior is as expected.

Within the cosmology of automated testing, LSTs represent the most expensive, complex, and lengthy test suite to set up and execute. Commonly referred to as *end-to-end tests* or *system tests*, they cover the pinnacle of the testing pyramid. From bottom to top, every layer of the pyramid reduces the number of tests by an order of magnitude. A project containing 1000 SSTs includes 100 MSTs and comprises no more than 10 LSTs.

LSTs are so subjective to the organizations and products they are run in; no solution applies across companies. The technology stack and approach of game companies have little in common with the approach of cloud providers, which, in turn, differs tremendously from mobile applications or embedded systems. The complex nature of LST makes disregarding them altogether a **valid option**.

## Independent Testability

Due to the complexity and effort of creating environments for LSTs, an instinctive initial approach is to run a second deployment, identical to the live production, dedicated to staging and verifying our changes. This approach may well be a good solution for us, but it is an expensive endeavor and does not scale well.

An increasing number of teams staging changes to the same environment inflates the brittleness of said environment. Forcing a massive end-to-end test environment introduces problematic correlations and false positives or negatives. If we do offer LST staging areas, we must ensure every team can spin up a fenced-off instance to singularly test changes specified by that team.

## Contract Testing

Similar to test doubles introduced in MSTs, contract testing presents an alternative to testing against implementations in an LST environment. Whereas test doubles require technology domain experience, contract testing is built upon cross-team communication effort. Establishing consumer-driven contracts formalizes the clear lines of communication between vertical teams enforced by the team interactions discussed in [Team Interactions](../../anatomy-of-a-software-company/team-interactions.md).

Contract tests validate established agreements between teams as instituted in the consumer-driven contracts. Contracts are drawn up between team members of the consumer service and the provider service, both of whom participate in writing the contract tests. All consumer contract tests are run against our pending implementation in the provider services to certify our changes do not break dependent behavior.

Contract testing extends static strategies such as API testing and schema testing and requires more collaboration between contract parties. API testing and schema testing work exceptionally well when our organization embraces documentation-driven development, a practice where documentation is written first, and boilerplate code is generated based on the schema of the documentation. This kind of testing requires a lack of documentation drift, a fact realistically achievable if the documentation drives source code, not the other way round. [OpenAPI](https://www.openapis.org/) is a popular standard with a rich economy of open source tooling.

## Executing LSTs

The sheer herculean effort of running LSTs excludes them from being run as part of the merging process. At a minimum, though, we run LSTs as part of the pre-release process. We may execute LST on our main branch periodically during the week, preferably at nighttime to minimize interference with resources during active development. While LSTs can be run over the weekend, coming to the office on a Monday morning to failed test alerts of non-production technology is a stressful way to start the week.

[![Large-Scoped Test Execution](../../../assets/images/book/anatomy-of-a-code-change/testing/lst-execution.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/lst-execution.png)
