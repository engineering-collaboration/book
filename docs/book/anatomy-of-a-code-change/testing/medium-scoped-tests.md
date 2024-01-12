# Integration Tests

As with the term *Unit tests*, *Integrations tests* invoke bias towards our experiences with them. We therefore advance our naming from Small Scoped Tests to Medium Scoped Tests (MST). MSTs are the second and penultimate layer of the testing pyramid. These verify correct and expected behavior between embedded systems and connected systems.

MSTs test interactions between our code and our infrastructure environments, such as operating systems, file i/o, and network i/o. Additionally we test interplay between subsystems of our product, e.g. a service with a database, a service with a connected service.

## Test doubles

Test doubles stand in for real implementations during the testing procedure. These doubles shadow dependencies to complex or costly to set up for automated hermetic testing. E.g. setting up a copy of a third party platform in order to validate API calls. Test doubles also function as deputies for legacy code structured with limited testability.

Typical terms for test double are stubs, mocks, and fakes. These terms refer to implementation strategies that differ in terms of fidelity and execution cost. Perfect fidelity is not be feasible, as doubles need to be vastly simpler than the real implementation in order to be suitable to be used in our tests.

## Prefer testing against real implementations

A fake requires more effort and more domain experience to create, because it needs to behave similarly to the real implementation. If the real implementation changes, so must the fake. Test doubles lead to testing against processes instead of behaviors, which we prefer to avoid (as covered in the Good Practices section).

A fake database would usually not have the fidelity to a real database. a fake should maintain fidelity to the API contracts. A fake does not keep fidelity to latency and resource consumption.

With modern software development tooling, testing against real implementations becomes more and more commonplace. It is typical to build and test against all operating systems on your build machines. It has become trivial to spin up lightweight ephemeral containers of our preferred database for MST's.

## When

MSTs complexity and computational requirements position the execution after code changes are merged to main. If we find that our MSTs to utilize less resources as expected and code integrations to our main branch frequently fail, we consider moving them to pre-merge.

## Summary

- A real implementation should be preferred over a test double
- A fake is often the ideal solution if a rela implementation can't be used in a test
- Overuse of stubbing leads to tests that are uncluear and brittle
- Interaction testing should be acoided when püossible. It leads to brittle tests

Factors:
- execution time
- fidelity
- determinism
- hermetic vs non-hermetic
