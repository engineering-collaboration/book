---
title: Testing strategy
description: Depending on our product, technology, and client demographic, we evolve the testing procedure into a strategy modeled to our needs.
---

# Testing strategy

Throughout this chapter, we discussed types of testing across the development cycle. From working on changes to releasing to production, we balance the execution of tests between utility and execution complexity, cost, and time. We have arrived at a solid foundation for a testing strategy for our organization.

[![Testing Strategy](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-strategy.png)

This base presents a well-founded starting ground to work from. Depending on our product, technology, and client demographic, we evolve the testing procedure into a strategy modeled to our needs. The balance between the cost of LSTs, benchmark tests, and manual tests compared to the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.

Sticking to the testing pyramid for automated tests supports building short feedback cycles with a low change fail rate. Manual qualitative tests are difficult to discretely put into context with a test number but should be the least amount of executed tests in our product release cycle. Or rather, we aim for releases not being dependent on qualitative manual testing at all.

As with the terms *unit*, *integration*, and *end-to-end*, software testing strategies birthed the labels *smoke tests*, *sanity tests*, and *regression tests* for various flavors and testing verticality. While it may make sense to group the execution of a set of MSTs and LSTs into these categories, we do not zealously follow them or mimic our testing strategy to suit predefined terms.

Testing is a complex topic with subjective implementations that evolve to fit our needs.
