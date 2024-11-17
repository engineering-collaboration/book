---
title: Testing
description: Testing is a complex and divisive topic. If not done adequately for our use case, we are better off doing less of it. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether.
---

# Testing

Even between friends testing leads to divisive conversations. It is a complex topic, which if not done adequately, we are better off doing less of. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether. This chapter outlines a broad view of practices and highlights what leavers we can pull to improve how we test our software.

<!-- automation -->

Automation builds the foundation for any successful testing strategy. To catch errors, we run tests. To catch errors as early as possible, we run tests often. Every change to our code base warrants assessment, and we execute the same tests hundreds (or thousands) of times a week. Far exceeding any scope we could realistically cover with manual labour.

We test throughout the life of a code change with varying suites of automated tests. For every step, we provide context as to why that particular constraint exists to make it feel less arbitrary. People are less inclined to push back against rules when there is a clear reason behind them. With trunk-based development, we ensure the integrity of changes at the following times:

- On our developers' machine during development
- On merge requests (*Pre-merge*)
- After a merge into main (*Post-merge*)
- Periodically on the main branch
- When creating a release candidate (*Pre-release*)
- Against the live version of our software (*Post-release*)

<!-- The longer we go without testing, the more changes are introduced -->

We run our tests as often and as early as feasible. The sooner we detect an error, the less money and time we spend correcting it. We dive into the scope of different test suits in the two sub-chapters

## On Test-Driven Development

<!-- Write code for testability -->

When it comes to testing, the engineering community defaults to a popular strategy called *Test-Driven Development* (TDD). Popular as in well-known, not necessarily well-liked, widespread sources define *TDD* as the practice of writing tests before writing the source code. An implementation is considered complete once it passes all tests and edge cases. Practically, I consider this definition lackadaisical.

Instead of declaring an order of implementation tasks, a practical definition of TDD prioritizes code testability above all else. We design our classes, methods, and API for writing uncomplicated, performant, and resilient tests against them. We consider internal data accessability, how we inject dependencies into implementations, and how to set up and tear down states of our software.

Our code encourages painless use of test doubles and computes without file i/o or network i/o operations. Any method that operates on data ordinarily loaded from disk, offers the capability of injecting mock data for running tests. It's extremely difficult (and pointless) to write tests for these implementations before the source code is mature enough to run tests against it.

Beyond functional testing, TDD encourages us to consider post-release monitoring and observability during development. Every form of telemetry demands computational resources. Planning these while writing the business logic allows us to minimize the runtime cost of telemetry. We decide which metrics we care about and how to extract, store, and transmit these to our server with minimal impact on software operations.

Any engineer who went through the joy of adding tests or telemetry to legacy systems shares the opinion about the unsatisfactory nature of the task. Appending these procedures in hindsight usually involves ripping the code apart and introducing wrappers. The majority of testing-after-the-fact projects carry a high risk of introducing regressions in functionality and performance. 

As any X-driven-development, a systematic approach to development encourages us to document, plan, and tackle problems in small increments. Additionally, TDD ensures the developer of the feature owns the problem and the tests. When the complexity of testing increases, some companies defer the majority of testing to dedicated teams of QA engineers. These take over the testing and infrastructure provision for large-scale efforts including end-to-end tests involving UI, middleware, backend services, and database entries. I believe this to be an unsound approach.

It is reasonable to assign the selection, maintenance, or development of test tooling to dedicated teams, as some languages come with native testing tools, others require frameworks and external dependencies to execute test code. It is **not** reasonable, in fact, it is highly discouraged, to move the responsibility of writing and executing the tests away from the developer writing the functionality. In order to reduce cycle times, it is imperative that the feature developers write and maintain the tests.

## Hermeticity

Tests that succeed or fail due to exogenous factors are pointless. Regardless of their result, we cannot trust their outcome and they tarnish any confidence we have in any other test cases. When writing and executing tests, we establish hermetic procedures keep our tests self-contained and consistent. Our tests do not rely on a specific environment or process to be successful.

<!-- Hermeticity in tests -->

Hermeticity in test code demands that tests do not influence each other. They do not share resources between them and do not leak any result beyond their execution. Each test sets up, executes, and tears down the required resources independently and thus provides accurate information regardless of the order in which they are run. As tests might be run in parallel, we ensure every suites do not read and write to the same location.

<!-- Hermeticity in environments -->

Our tests run on various machines, at various times, instigated by various users. Yet, we require the output of each run to be representative of the software's current state, regardless of the execution context. The effectiveness of our tests can not depend on whether certain files exist in a specific directory or whether certain environment variables and configurations have changed on a test runner. Failing tests due to drifting environmental configurations dampens the enthusiasm of engineers to write and run tests in the first place.

Most CI/CD platforms offer tooling to run tests in team-defined hermetic environments. Using container tools and Infrastructure as Code workflows we create a variety of test configurations. These test contexts ensure consistent execution across platforms and machines. Thus we can test different operating systems and environments on any machine. Software defined infrastructure also enables us developers to replicate any failing tests on our machines.

<!-- Hermeticity in test data -->

With hermetic tests running in hermetic environments, the final avenue of introducing inconsistencies comes in form of variable test data. We can realistically test with only a single variation across behavior, environment, and data. In order to verify code changes, our execution environment and test data needs to be identical.

Across industries we face different challenges for test data: size of data, data complexity, context dependencies, cyclic references, metadata compliance, and delimiter tokens. We verify correct processing of expected data and ensure we fail early and gracefully to defective input. The further we delegate a faulty process, the more havoc it creates downstream. 

<!-- Using production data -->

Static test data helps us detect unwanted behavior across code changes. This baseline builds confidence that we did not introduce any side effects. Yet, hand-crafted homogenous test data limits the amount of errors we detect before releasing our software to the public. In reality, our customers display incredibly creative ambition to break our product. To build resilient software, we also run test cases against captured production data.

## Testing over Time

Besides catching unintenional breaking changes, tests fail because of three reasons: backwards incompatability, brittle test code, and flaky test execution. As our product evolves, we add and change features to it. These changes may become incompatible with earlier versions of our software, in which case we update the tests to reflect the new behavior.


The term *brittle tests* describes tests that fail with minor (or even unrelated) source code changes. These tests typically indicate ill-formed testing code.


*Flaky tests* succeed or fail at random and indicate non-hermetic execution environments or race conditions in test code.


We may have encountered a brittle test that is not scaling with our product changes. Depending on the severity of the fragility, we resolve the issue synchronously or asynchronously. Prominent brittleness may be removed by slightly altering the test and sending the initial author a direct message to corroborate our changes. Opaque tests may require a meeting to determine a resolution.

While this sounds histrionic, most cases resolve themselves astutely with a brief email chain.

Successful and sensible testing is modeled against our team's needs and evolves over time. We revisit our testing strategy periodically and after significant events.


The most important property of our testing suite is our developers' trust in the process. The rare superlative is warranted, and we elevate the former statement to our absolute priority. We add tests when bugs are reported. We remove tests when they become brittle, flaky, redundant, or even just inconvenient. We move tests to be executed at different times when the current setup proves inefficient or ineffective. The following statements are red flags to be addressed:

Brittle tests normalize the tendency of ignoring failed tests. Introducing that mindset turns our product testing into an expensive waste of time instead of a useful tool of shifting left.

We remove the test should it not provide the appropriate value. Twenty minutes is a long time to occupy machines that may be better suited for other jobs. If the test is necessary, we consider shifting it right, e.g., from pre-merge to post-merge.

See if we can test a higher layer of abstraction of the functionality. If not, we throw it away. The utmost priority is for developers to actively use the automated test suite and not build resentment towards the process.

Software documentation is notoriously unreliable and commonly has a tenuous relationship with the realities of the code it references. Written documentation about the behavior of edge cases or default return values is not to be trusted. No matter the extent of the drift, documentation still "functions". Tests break.

Clear and focused tests provide context as to the purpose and limitations of code segments. Tests of edge cases demonstrate expected behavior for teams consuming our code. Demonstrated expected behavior streamlines pull requests, as code reviewers spend less manual effort verifying code correctness.
