# Tests

Testing has become a somewhat divisive topic. If not done adequately for our use case we are better off doing less of it. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether.

This chapter covers what we have found to be generally most useful. From all the chapters in this book, testing is the least directly applicable. Successful and sensible testing is modeled to our teams needs and evolves over time. We revisit our testing strategy periodically, after significant events, and post-mortems.

## Test Driven Development

A term often cited in software engineering job listings is *Test Driven Development* (TDD). TDD is the practice of writing tests for features before working on the source code of a feature. A completed implementation passes all tests and edge cases.

TDD encourages us to write down a strategy to tackle problems in small increments. The upside of TDD sees diminishing returns with growing complexity of implementations. Functions using file i/o, using network i/o, or reliant on environment configurations are difficult to write tests for. Even more so before the implementation is available.

## When to test what

Testing is not a one-off task done as a step in the waterfall methodology. Throughout the life of a code change a varying suite of automated tests ensure the correct integration of code changes at different times.

- Unit tests ([Small Scoped Tests](./small-scoped-tests.md)) ensure correct behavior within a system.
- Integrations tests ([Medium Scoped Tests](./medium-scoped-tests.md)) ensure correct behavior between embedded or connected systems.
- End-to-end tests ([Large Scoped Tests](./large-scoped-tests.md)) ensure correct behavior across the entire product.

The nature of these tests are outlined in detail in their individual chapters.

### The testing Pyramid

In his 2009 book "Succeeding with agile" Mike Cohn provided the metaphorical representation of the testing pyramid. The three layered structure indicates guidelines for the amount of automated testing for each scope.

The base of the pyramid relies on numerous small-scoped unit tests which are run most frequently. The mid-layer consists of a reduced number of integration tests. The pinnacle of the pyramid consists of automated end-to-end tests. These require complex setups and long running operations.

From bottom to top, every layer of the pyramid reduces the amount of tests by an order of magnitude. If we have 1000 SST, we aim for 100 MST, and no more than 10 LST. A common anti-pattern is what is referred to as a test snow cone, or inverted pyramid. Here, there are little to no small-scoped tests with all the coverage in large-scoped tests. These projects have slow test runs and long feedback cycles.

## Hermetic environments

Tests run on various machines and runners, by various users and scripts, on various operating systems and environments. Failing tests due to drifting environmental configurations hinder development and build resentment towards writing and executing tests in the first place.

A hard requirement for tests is to be hermetic, meaning not reliant on a specific environment or execution order to be successful. Tests set up, execute and tear down independently and in a confined manner. Tests provide accurate information regardless of the order in which they are run.

Medium and large scoped tests provide the environment and infrastructure needed to execute expectedly. Using container tools such as Docker and Infrastructure as Code (IaC) workflows ensures consistent configuration across platforms and machines. Small scoped tests run without requiring a dedicated hermetic environment. Our testing suite performs as intended on every machine regardless of environmental configurations.

## Testing over time

The most important property of our testing suite is our developers trust in the process. The superlative is earned and we make the former statement our absolute priority. Tests are added when bugs are reported. Tests are removed when they become brittle, flaky, redundant or even just inconvenient. Tests are moved to be executed at a different time than they are at the moment. The following statements are red flags to be addressed:

**"All tests passed, except for Test A. That one fails about 60% of the time though, so I'm ignoring it."**

Brittle tests normalize the tendency of ignoring failed tests. If that mindset is introduced, our product testing becomes an expensive waste of time instead of a useful tool of shifting left.

**"That test takes about twenty minutes, just merge the code now. We don't have time for this!"**

Consider removing the test if it doesn't provide the appropriate value. Twenty minutes is a long time to occupy machines that may be better suited for other jobs. If the test is necessary consider shifting it right, e.g. from pre-merge to post-merge.

<!-- vale proselint.Cliches = NO -->
<!-- vale write-good.Cliches = NO -->
<!-- vale alex.ProfanityLikely = NO -->
**"Every time I touch that function the tests fail, it's a huge pain in the ass!"**
<!-- vale alex.ProfanityLikely = YES -->
<!-- vale write-good.Cliches = YES -->
<!-- vale proselint.Cliches = YES -->

See if we can test a higher layer of abstraction of the functionality. If not, throw it away. The upmost priority is not building resentment towards processes and having developers actively use the automated test suite.

## Tests as documentation

Software documentation is notoriously unreliable and commonly has a tenuous relationship with the realities of the code it references. Written documentation about behavior of edge cases or default return values are not to be trusted. No matter the extend of the drift, documentation still functions, tests break.

Clear and focused tests provide context as to the purpose and limitations of code segments. Tests of edge cases demonstrate expected behavior for teams consuming our code. Tests demonstrating expected behavior streamline pull requests as code reviewers spend less manual effort verifying code correctness.

## Who writes tests?

Some languages come with native testing tools, others require frameworks and external dependencies to execute test code. Factor in that different testing stages typically have different requirements and we are faced with quite a collection of tools. It is reasonable to assign the selection, maintenance or development of test tooling to dedicated teams.

It is not reasonable, in fact it is highly discouraged, to move the responsibility of writing and executing the tests themselves away from the developer writing the functionality. This change is sometimes introduced when the complexity of testing increases, such as end-to-end tests involving UI, middleware, backend services, and database entries. In order to reduce cycle times it is imperative that developers write, manage, and understand the tests.
