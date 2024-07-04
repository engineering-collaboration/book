---
title: Medium-Scoped Tests
description: MSTs are the second and penultimate layer of Mike Cohn's testing pyramid. These verify correct and expected behavior between embedded systems and connected systems.
---

# Medium-Scoped Tests

As with the term *unit tests*, the expression *integration tests* conjures a bias towards differing implementation strategies. We, therefore, advance our naming from *small-scoped tests* to *medium-scoped tests* (MST). MSTs are the second and penultimate layer of [Mike Cohn's testing pyramid](../#the-testing-pyramid). These verify correct and expected behavior between **embedded systems and connected systems**.

MSTs verify interactions between the code and execution environment, e.g. operating systems, file I/O, network I/O, and the interplay between subsystems of our product, e.g. a service with a database, a service with a connected service.

## Test Doubles

Test doubles stand in during the testing procedure when real implementations are too complex or costly to set up for hermetic testing. As an example, when writing services against a third-party platform, we validate API calls against a double instead of spawning the entire platform ephemerally. Test doubles also function as deputies for legacy code written with limited testability in mind.

Depending on the implementation, test doubles are called *stubs*, *mocks*, or *fakes*. These terms refer to differing strategies in terms of fidelity and execution cost. By definition, perfect fidelity with doubles is not feasible, as these need to be vastly simpler than the real implementation to be suitable for use in our tests.

### Doubles vs Real Implementations

Fakes require effort and domain knowledge to behave similarly to the real implementation. If the real implementation changes, so must the fake. Depending on the nature of the doubles used, testing against these organically leads to testing against processes instead of behaviors, which leads to brittle tests (as covered in [Good Practices](./good-practices.md)).

The simplicity of test doubles compared to their complex counterparts reduces the flakiness of MSTs. When tests fail against test doubles, we gain certainty that the issues originate in our source, rather than the dependency.

A fake database does not have the fidelity of a real database but maintains fidelity to the API contracts. A fake does not keep fidelity to latency and resource consumption and is therefore unreliable to provide information about race conditions, timeouts, or benchmarking.

With modern software development tooling, testing against real implementations becomes the more commonplace practice. We build and test against all operating systems on our build machines, and it has become trivial to spin up lightweight ephemeral containers of our preferred database for MSTs.

## Executing MSTs

MSTs' complexity and computational requirements position them to be executed after code changes are merged to main. Should we find that our MSTs utilize fewer resources than expected and code integrations to our main branch frequently fail, we consider moving them to pre-merge.

[![Medium-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.png)
