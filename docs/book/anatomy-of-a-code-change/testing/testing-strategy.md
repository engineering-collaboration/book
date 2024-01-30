---
title: Testing strategy
description: Depending on our product, technology, and client demographic we evolve our procedure into what works for us. The balance between our cost and duration of LSTs, benchmark tests and manual tests balances with the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.
---

# Testing strategy

Over this chapter we discussed the type of testing done with rough guidelines to optimize test utility versus execution complexity, cost, and time. The following presents a solid base testing strategy that our organization can start working from.

[![Testing Strategy](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.png)

- Development and pre-merge:
    - Static analyses
    - Small scoped tests
- Post-merge:
    - Static analyses
    - Small scoped tests
    - Medium scoped tests
- Periodically on main:
    - Large scoped tests
    - Benchmark tests
- Pre-release (release candidate):
    - Static analyses
    - Small scoped tests
    - Medium scoped tests
    - Large scoped tests
    - Benchmark tests
    - Manual tests
- Post-release (production):
    - Tests in production
    - Manual tests
    - Monitoring

Depending on our product, technology, and client demographic we evolve our procedure into what works for us. The balance between our cost and duration of LSTs, benchmark tests and manual tests balances with the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.

Sticking to the testing pyramid for automated tests support building short feedback cycles with low change fail rate. Manual qualitative tests are difficult to discretely put in context with a test number, but should be the least amount of executed tests of our product release cycle. Or rather, a release should not be dependent on qualitative manual testing at all.

Often occurring qualitative flags are automated into automated tests or static analyses tasks.

## Verticality of tests

As with the terms *unit*, *integration*, and *end-to-end* software testing strategies birthed the catchwords *smoke tests*, *sanity tests*, and *regression tests* for various flavours and testing verticality. While it is good to have a rough understanding of what these terms refer to, we do not zealously follow them or mimic our testing strategy to suit predefined terms.

Testing is a complex topic with subjective implementations that evolve to fit our needs.
