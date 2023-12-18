# Integration Tests

As with Unit tests, Integrations tests as a name is biased towards whatever our experience has been with them. We therefore move up from Small Scoped Tests to Medium Scoped Tests (MST).

MST's are the second and penultimate layer of the testing pyramid. These verify correct and expected behaviour between (sub-)systems. MST's include tests that

- test various infrastructure considerations, such as operating systems, disks, network.
- test interactions between different subsystems of your product, e.g. a service with a database, a service with a relating service.

## Test doubles

A test double is an object or function that can stand in for a real implementation in a test. We might make use of test doubles if the code base isn't designed with testing in mind or setting up the environment for tests carries too much cost.

Typical terms for test double are stubs, mocks, and fakes. These terms refer to implementation strategies with that differ on fidelity and execution cost. Perfect fidelity might not be feasible. Test doubles often need to be vastly simpler than the real implementation in order to be suitable for use in tests.

## Prefer testing with real implementations

A fake requires more effort and more domain experience to create because it needs to behave similarly to the real implementation. If the real implementation changes, so must the fake. Test doubles lead to testing against processes instead of behaviors, which we prefer to avoid (as covered in the Good Practices section).

A fake database would usually not have the fidelity to a real database. a fake should maintain fidelity to the API contracts. A fake does not keep fidelity to latency and resource consumption.

With modern software testing against real implementations becomes more and more commonplace. It is typical to build and test against all operating systems on your build machines. It has become trivial to spin up lightweight ephemeral containers of your preferred database for MST's.

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
