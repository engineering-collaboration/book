# Testing Strategy

We discussed **how** we test, not **what** we test. A combination of all discussed testing methods can be combined for smoke testing, sanity testing, regression testing.

After presenting a base toolset, our foundational testing strategy looks as follows:

- Development and pre-merge:
    - Static analyses
    - Small scoped tests
- Post-Merge:
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
- Post-Release (production):
    - Tests in production
    - Manual tests
    - Monitoring

Again, this is a base testing strategy that our organization can start from. Depending on our product, technology, and client demographic we evolve our procedure into what works for us. The balance between our cost and duration of LSTs, benchmark tests and manual tests balances with the frequency of faulty integrations ultimately defines the execution order fitted to our needs.

As with the terms *unit*, *integration*, and *end-to-end* software testing strategies birthed the catchwords *smoke tests*, *sanity tests*, and *regression tests* for various flavours and testing verticality. While it is good to have a rough understanding of what these terms refer to, we do not zealously follow them or mimic our testing strategy to suit predefined terms.

Sticking to the testing pyramid for automated tests support building short feedback cycles with low change fail rate. Manual qualitative tests are difficult to discretely put in context with a test number, but should be the least amount of executed tests of our product release cycle. Or rather, a release should not be dependent on qualitative manual testing at all.

Often occurring qualitative flags are automated into automated tests or static analyses tasks.


