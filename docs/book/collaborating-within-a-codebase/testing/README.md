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

## Writing tests

<!-- Write code for testability -->

When it comes to testing, the engineering community defaults to the popular term *Test-Driven Development* (TDD). Popular as in well-known, not necessarily well-liked. Widespread sources define *TDD* as the practice of writing tests for a piece of software before working on the source code. An implementation is considered complete once it passes all tests and edge cases. Practically, I consider this definition both ambitious and lackadaisical.

Instead of declaring an order of implementation tasks, a practical definition of TDD is to prioritize code testability above all else. We design our classes, methods, and API for writing uncomplicated, performant, and resilient tests against them. We consider our data accessability, how we inject dependencies into implementations, and how to set up and tear down comparable states of our software. Our code encourages the use of test doubles and can be initialized with no hard dependency on file i/o or network i/o operations.

Beyond pre-release testing, TDD encourages us to consider what runtime metrics we care about and how to extract these metrics from processes with minimal impact on business operations.


As any X-driven-development, a systematic approach to our development encourages to document, plan, and tackle problems in small increments.



TDD encourages us to consider and transcribe a strategy to tackle problems in small increments. The upside of TDD sees diminishing returns with a growing complexity of implementations. Functions using file I/O or network I/O, or processes reliant on environment configurations are difficult to write tests for, even more so before the implementation is available.

Some languages come with native testing tools, others require frameworks and external dependencies to execute test code. Factor in that different testing stages typically have different requirements, and we are faced with quite a collection of tools. It is reasonable to assign the selection, maintenance, or development of test tooling to dedicated teams.

It is **not** reasonable, in fact, it is highly discouraged, to move the responsibility of writing and executing the tests away from the developer writing the functionality. This change is sometimes introduced when the complexity of testing increases, such as end-to-end tests involving UI, middleware, backend services, and database entries. In order to reduce cycle times, it is imperative that developers write and maintain the tests.



## Hermetic Environments

A hard requirement for tests is to be hermetic, meaning not reliant on a specific environment or execution order to be successful. Tests set up, execute, and tear down independently and in a confined manner. Tests provide accurate information regardless of the order in which they are run.

These tests run on various machines, executed by different users in multiple execution contexts. Yet, we require the output of each test run to be representative of our software's current state. 

Tests on on various operating systems and environments. Failing tests due to drifting environmental configurations hinder development and build resentment towards writing and executing tests in the first place.

Most modern CI/CD platforms offer hermetic environments for running tests in a sealed environment. 

These tests run on various machines, by various users. Yet, we require the output of each run to be representative, regardless of the execution context. Tests on on various operating systems and environments. Failing tests due to drifting environmental configurations hinder development and build resentment towards writing and executing tests in the first place.

Using container tools such as Docker and [Infrastructure as Code (*WIP)]() (IaC) workflows ensures consistent configuration across platforms and machines. Small-scoped tests run without requiring a dedicated hermetic environment. Our testing suite performs as intended on every machine regardless of environmental configurations. As developers, we are able to replicate failing tests on the CI/CD runners on our machines.

## Testing over Time

Accidental breaking changes aside, changes to products will inevitably cease to pass established tests. We may have encountered a brittle test that is not scaling with our product changes. Depending on the severity of the fragility, we resolve the issue synchronously or asynchronously. Prominent brittleness may be removed by slightly altering the test and sending the initial author a direct message to corroborate our changes. Opaque tests may require a meeting to determine a resolution.

Failing tests for working code are an indicator of backward incompatibility. If these consequences have already been discussed, we ensure they are present within the [Design Document](../planning-implementations.md) and verified by all stakeholders. In case we find our design doc lacking, it is imperative to communicate the situation to our team lead until a strategy is agreed upon by all involved departments. While this sounds histrionic, most cases resolve themselves astutely with a brief email chain.


Successful and sensible testing is modeled against our team's needs and evolves over time. We revisit our testing strategy periodically and after significant events.


The most important property of our testing suite is our developers' trust in the process. The rare superlative is warranted, and we elevate the former statement to our absolute priority. We add tests when bugs are reported. We remove tests when they become brittle, flaky, redundant, or even just inconvenient. We move tests to be executed at different times when the current setup proves inefficient or ineffective. The following statements are red flags to be addressed:

**"All tests passed, except for Test A. That one fails about 60% of the time, though, so I'm ignoring it."**

Brittle tests normalize the tendency of ignoring failed tests. Introducing that mindset turns our product testing into an expensive waste of time instead of a useful tool of shifting left.

**"That test takes about twenty minutes, just merge the code now. We don't have time for this!"**

We remove the test should it not provide the appropriate value. Twenty minutes is a long time to occupy machines that may be better suited for other jobs. If the test is necessary, we consider shifting it right, e.g., from pre-merge to post-merge.

<!-- vale proselint.Cliches = NO -->
<!-- vale write-good.Cliches = NO -->
<!-- vale alex.ProfanityLikely = NO -->
**"Every time I touch that function, the tests fail; it's a huge pain in the ass!"**
<!-- vale alex.ProfanityLikely = YES -->
<!-- vale write-good.Cliches = YES -->
<!-- vale proselint.Cliches = YES -->

See if we can test a higher layer of abstraction of the functionality. If not, we throw it away. The utmost priority is for developers to actively use the automated test suite and not build resentment towards the process.

Software documentation is notoriously unreliable and commonly has a tenuous relationship with the realities of the code it references. Written documentation about the behavior of edge cases or default return values is not to be trusted. No matter the extent of the drift, documentation still "functions". Tests break.

Clear and focused tests provide context as to the purpose and limitations of code segments. Tests of edge cases demonstrate expected behavior for teams consuming our code. Demonstrated expected behavior streamlines pull requests, as code reviewers spend less manual effort verifying code correctness.
