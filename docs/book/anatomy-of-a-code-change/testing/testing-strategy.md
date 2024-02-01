---
title: Testing strategy
description: Depending on our product, technology, and client demographic we evolve our procedure into what works for us. The balance between our cost and duration of LSTs, benchmark tests and manual tests balances with the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.
---

# Testing strategy

Throughout this chapter we discussed types of testing across the development cycle. From working on changes to releasing to production we balance the execution of tests between utility and execution complexity, cost, and time. We have arrived at a solid foundation for a testing strategy for our organization.

[![Testing Strategy](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.png)

During development we frequently execute static analysis and SSTs to inform us of any breaking changes we accidentally introduced. If introduced purposefully, it is our responsibility to communicate our requirements and, if accepted, adapt the tests. On success, we open a PR.

When a PR is opened we gate incoming changes with automated and manual verifications. The automated checks consist of the same static analysis and SST we execute during development. We move selected MSTs to pre-merge, if these require minimal resources and fail regularly on post-merge. On success, we merge our PR.

After the head of our development branch was deemed stable and our branch was merged we re-run the same suite of tests as in pre-merge to ensure the stability of the changes within our main branch. Additionally, we run slightly longer MSTs to assess working functionalities of embedded systems. If these tests succeed, we delete our development branch. Should they fail, we roll back the changes and fix these within our development branch. On success, we delete our development branch. On failure, we roll back main and continue working on our development branch until our tests pass.

We periodically check the head of the main branch with LSTs and benchmark tests. On a failed test we dissect the main branch to uncover the culprit commit.

The pre-release testing is the most comprehensive execution of tests. After referencing a commit as a release candidate we unleash the full force of our automated testing suite. Additional manual tests may be warranted. On success, we release to production and follow up with tests in production and topics discussed in [Monitoring and Observability (*WIP)]().

## Our testing needs

This base presents a well founded starting ground to work from and depending on our product, technology, and client demographic we evolve the testing procedure into a strategy modeled to our needs. The balance between cost of LSTs, benchmark tests and manual tests compared with the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.

Sticking to the testing pyramid for automated tests support building short feedback cycles with low change fail rate. Manual qualitative tests are difficult to discretely put into context with a test number, but should be the least amount of executed tests of our product release cycle. Or rather, a release should not be dependent on qualitative manual testing at all.

As with the terms *unit*, *integration*, and *end-to-end* software testing strategies birthed the catchwords *smoke tests*, *sanity tests*, and *regression tests* for various flavours and testing verticality. While it is good to have a rough understanding of what these terms refer to, we do not zealously follow them or mimic our testing strategy to suit predefined terms. Often occurring qualitative flags are automated into automated tests or static analyses tasks.

Testing is a complex topic with subjective implementations that evolve to fit our needs.
