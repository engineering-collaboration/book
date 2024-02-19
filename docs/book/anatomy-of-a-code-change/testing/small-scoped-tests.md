---
title: Small-scoped tests
description: Small-scoped tests are the most widespread kind of tests within our code as they are concise and fast. Applications commonly contain thousands of Small-scoped tests that executed within seconds.
---

# Small-scoped tests

The nondescript name *unit test* causes confusion as to what is and what is not included in a unit. The lack of expressive naming has led to a plethora of interpretations and strategies. The book *Software Engineering at Google* introduces the term *small-scoped tests* (SST) which we decided to appropriate.

SSTs build the foundation of [Mike Cohn's testing pyramid](../#the-testing-pyramid), enabling rapid and successful continuous integration. SSTs are the most widespread kind of tests within our code given their brevity and low resource impact. Applications commonly contain thousands of SSTs executed within seconds. A complete suite of passing SSTs increases the confidence of introducing non-breaking changes to our code base.

## Defining small-scoped

SST's consist of the smallest possible testable entity in our code to confirm expected process of a single public behavior executed in memory. SSTs do not rely on environmental factors, including file operations, network operations, and implementations specific to operating systems.

The other fundamental constraint on small tests are that they do not sleep, perform I/O operations, or make any blocking calls. SSTs do not access the network, disk, or OS processes. These factors are covered by Medium Scaled Tests.

## Executing SSTs

Every serious programming language comes equipped with tooling for writing and executing small-scoped tests. The internet is bursting with blogs, tutorials, and guides for setting up SSTs for any language in any IDE. Beyond the strategies shared in [Good Practices](./good-practices.md), we avail full creative freedom for concrete implementations.

[![Small-Scoped Test Execution](../../../assets/images/book/anatomy-of-a-code-change/testing/sst-execution.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/sst-execution.png)

We do however share the recommendation that SST's small footprint warrants frequent execution. Hence, we run these kind of tests during most steps of the development cycle. During development on our local machines, on pre-merge checks, post-merge validations, and as pre-release requirements.
