# Tests

Throughout our industry we consensually lament the lack of documentation across the board. Testing, contrarily, has become a somewhat divisive topic. If not done adequately for our use case we might be better off doing significantly less of it. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether.

This chapter covers what we have found to be generally most useful. From all the chapters in this book, this is the one we shy away from directly applying to our situations. Successful and sensible testing has to be modeled to our teams needs and evolve over time. We revisit our testing strategy periodically, especially after significant events or post mortems.

## Test Driven Development

A term often cited in software engineering job listings is *Test Driven Development* (TDD). TDD is the practice of writing tests for features before working on the source code of a feature. The feature is complete once the implementation successfully passes all tests and edge cases.

TBD encourages us to write down a strategy to tackle problems in small increments, especially useful for problems that modify data purely in memory. The upside of TDD sees diminishing returns with growing complexity of implementations. Functions using file i/o, using network i/o, or reliant on environment configurations are difficult to write tests for. Even more so before the implementation is available.

## When to test what

Testing is not a one-off task done as a step in the waterfall methodology. Throughout the life of a code change a varying suite of automated tests ensure the correct integration of code changes at different times.

- Unit tests (small scoped tests) ensure correct behaviour within a system.
- Integrations tests (medium scoped tests) ensure correct behaviour between embedded or connected systems.
- End-to-end tests (large scoped tests) ensure correct behaviour across the entire product.

The nature of these tests are outlined in detail in their individual chapters.

### The testing Pyramid

In his 2009 book "Succeeding with agile" Mike Cohn provided the metaphorical representation of the testing pyramid. The three layered structure indicates guidelines for the amount of automated testing for each practice.

The foundation of the pyramid consists of small-scoped unit tests. These are the tests you want to have to most of in your project and that you run most frequently.

Looking upwards you want to have a reduced number of Integration tests. The top of the pyramid consists of automated end-to-end tests. These are typically complex setups and long running operations.

A common antipattern is what is referred to as a test snow cone, or inverted pyramid. Here, there are little to no small-scoped tests with all the coverage in large-scoped tests. These projects tend to have slow test runs and very long feedback cycles.

## Hermetic environments

Tests are run on various machines and runners by various users and scripts on various operating systems and environments. Failing tests due to (TODO: synonymon) different environmental configurations are an infuriating hindrance and will most likely build resentment towards writing and executing tests in the first place. For that reason and others a hard requirement for tests is to be hermetic, meaning not reliant on a specific environment or execution order to be successful.

For unit tests this means the set up, execution and tear down of tests should be confined for each unit test. Tests should provide accurate information regardless of the order in which they are run.

For integration tests and end-to-end tests this means the environment and infrastructure they are executed in is provided with the tests themselves. This ensures the environment is consistent across all executions. Using container tools such as Docker and Infrastructure as Code (IaC) workflows ensures consistent configuration across platforms and machines.

## Testing over time

The most important property of your testing suite is that developers have trust in the process. This is not hyperbole and the superlative is earned. Make the former statement your absolute priority.

This means your tests evolve over time. Tests are added when bugs are reported. Tests are removed when they become brittle, flaky, redundant or even just inconvenient. Tests are moved to be executed at a different time than they are at the moment. The following statements are red flags to be addressed immediately:

"All tests passed, except for Test A. That one fails about 60% of the time though, so I'm ignoring it."

Brittle tests normalize the tendency of ignoring failed tests. If that mindset is introduced into your product testing becomes an expensive waste of time instead of a useful tool of shifting left.

"That test takes about 20 minutes, just merge the code now. We don't have time for this!"

Consider removing the test if it doesn't provide the appropriate value. 20 mins is a long time to occupy machines that may be better suited for other jobs. If the test is necessary consider shifting it right, e.g. from pre-merge to post-merge.

"Every time I touch that function the tests fail, it's a huge pain in the ass!"

See if you can test a higher layer of abstraction of the functionality. If not, throw it away. the upmost priority is not building resentment towards processes and having developers actively use the automated test suite.

## Tests as documentation

Software documentation is notoriously unreliable and it is common for documentation to have a tenuous relationship to the code. Clear and focused tests provide context as to the purpose and limitations of code segments. Additionally, documentation mostly does not cover certain edge cases or default return values. Tests of edge cases demonstrates expected behavior for future developers consuming your code. Writing and executing tests also streamlines pull requests as code reviewers spends less effort verifying the code works as expected if the change has tests that demonstrate code correctness.

## Who writes tests?

Before tackling the issue of writing tests teams typically agree on tooling. Some languages come with native testing tools, others require frameworks and external dependencies to execute test code. Factor in that different testing stages typically have different requirements and we are faced with quite a collection of tools.

It is reasonable to assign the selection, maintenance or development of test tooling to dedicated teams. It is not reasonable, in fact it is highly discouraged, to move the responsibility of testing away from the developer writing the functionality. This change is sometimes introduced when the complexity of testing increases, such as end-to-end tests involving UI, middleware, backend services, and database entries. In order to reduce cycle times it is imperative that developers write, manage, and understand the tests themselves.

We can do most of our testing without requeiring an integrated enviornment.
We can and doi deploy or release our application independently of other appliocations/services it depends on

Tests primarily created and maintained by QA or an outsourced party is not correlated by IT performance. Tests should be created and owned by developers.
