---
title: Small-Scoped Tests
description: SSTs are the most widespread kind of tests within our code given their brevity and low resource impact. Applications commonly contain thousands of SSTs executed within seconds.
---

# Automated Functional Tests

Modern software is complex. As we increase the amount of code in our product, we lose the ability of holding a complete model of our architecture in our head. Thus, every change we integrate has the potential to affect other code paths unintentionally. To minimize the risk of delivering error-prone software, we run automated functional tests.

Across our industry, we certainly have standardized terminology for categories of functional tests, but we do not have standardized definitions for these. The most popular terms include *unit tests*, *integration tests*, and *end-to-end tests*. However, if we ask three different engineers about the definition of a "unit", we can expect n^3 number of interpretations.

The book *Software Engineering at Google* by Titus Winters, Tom Manshreck, and Hyrum Wright matches these terms to a strictly defined scope and categorizes *narrow-scoped tests*, *medium-scoped tests*, and *large-scoped tests*. Disregarding the specificity of the term *narrow*-scoped, I renamed those to *small-scoped* in this book for the sake of simplicity and common use.

The scope of these tests refers to the difficulty of writing the tests, the complexity of assembling the test dependencies, and the execution time of the tests. The larger the scope, the more resources we invest in writing and running the category of test. We execute as broad a coverage of our tests as frequently and early in the development cycle as possible without stalling developer velocity.

When testing on dedicated machinery on-prem, every minute our build and test computer sits idle increases the potential of propagating a faulty state down the line. However, every processing minute on third-party cloud runners increases our costs. Depending on our needs, we either buy more minutes, offload some tests to on-prem runners, or reduce the scope of tests and run larger tests less frequently.

To highlight the appropriate distribution of scoped test sizes within our software, Mike Cohn provides a metaphorical representation in his book *Succeeding with agile*. The three-layered *testing pyramid* counsels us on the relative amount of automated tests for each scope. As a rule of thumb, when ascending the pyramid, every layer of the reduces the number of tests by an order of magnitude. If we start at a thousand small-scoped tests, we aim for a hundred medium-scoped tests, and no more than ten large-scoped tests.

[![Testing Pyramid](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-pyramid.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-pyramid.png)

Small-scoped unit tests build the base of the pyramid. Commonly referred to as *unit tests*, they ensure correct behavior within a system. The number small-scoped tests spans about 75%-90% of the automated tests in our software and we execute these frequently. It is not uncommon for developers to run the small-scoped suite of tests every couple of minutes while working on the source code. Generally, executing all of our small-scoped tests takes seconds.

The mid-layer consists of medium-scoped tests, or integration tests. When executing these tests we verify the behavior between embedded or connected systems. The process requires us to spawn these dependent systems in order to run the tests. In the section *Medium-Scoped Tests* we explore how to reduce the complexity of the procedure. We expect our medium-scoped test suite to complete in minutes.

The pinnacle of the pyramid consists of automated large-scoped tests. These follow an interaction flow across the entire product, from user input to system processing back to user response. Thus, these tests are commonly known as *end-to-end tests*. Large-scoped tests tend to be difficult to write, face complex challenges to set-up and execute, and are generally long-running operations. Automated large-scoped tests consume hours of our testing budget.

The testing pyramid promises us the most bang for our buck. If we are able to run the majority of our tests in seconds, we catch errors as quickly as possible. Any error reported by small-scoped tests took us seconds to uncover. When running against medium or larged-scoped tests, fixing an error occupies us for hours if not days.

A common anti-pattern to this approach is the *testing snow cone*, or *inverted testing pyramid*. These projects contain little to no small-scoped tests with all the testing done in medium-to-large-scoped tests, combined with labor and time-intensive manual tests. Flipping the distribution of scopes results in long test runs and slow feedback cycles.

The test snow cone typically emerges from legacy software that was not written with testability in mind. Closed-off systems make it difficult to test individual steps and a lack of dependency-injection prevents us from writing light-weight in-memory tests. Besides that, a lack of ownership in infrastructure or testing workflows may invert our testing pyramid. If we find it difficult to write, update, and execute tests, we lack the motivation to do so and shift the responsibility to QA.

Over the rest of this chapter we'll explore our testing scopes in detail.

!!! tip "Recommendation"
    <img src="https://abseil.io/img/swe_at_google.2.cover.jpg" width="360" style="display: block; margin-left: auto; margin-right: auto;" alt="Engineering Collaboration">
    <br>
    Based on their experience at Google, software engineers Titus Winters and Hyrum Wright, along with technical writer Tom Manshreck, present a candid and insightful look at how some of the world's leading practitioners construct and maintain software. Some software testing concepts in *Engineering Collaboration* originate from these insights.
    
    *Software Engineering at Google* was (and is) the book that inspired me to write *Engineering Collaboration*. I highly recommend you visit [***abseil.io***](https://abseil.io/resources/swe-book) or purchase the book from [***O'Reilly***](https://www.oreilly.com/library/view/software-engineering-at/9781492082781/).

## Small-Scoped Tests

The advantage of small-scoped tests lies in the little amount of resources they require. The limitations we enforce and the isolated nature of small focused tests make the code straightforward to write and maintain. Small-scoped tests execute swiftly and without initializing external dependencies. Our software commonly contains thousands of small-scoped tests, all collectively executed in seconds.

We limit small-scoped tests to the fastest possible testable entity in our code, in-memory operations. Small-scoped tests do not run disk operations or network operations. They do not sleep, make other blocking calls, or consume other OS processes. These factors are covered by medium-scoped tests. Writing source code and its tests code with these constraints in mind, enables us to verify a broad set of behavior with minimal effort.

The limitations on their complexity make small-scoped tests rapid. Hence, we run them as often as possible. Their small footprint facilitates executing them during every step of the development cycle: while coding on our local machines, on pre-merge checks, post-merge validations, and as pre-release requirements. A complete suite of passing small-scoped tests increases the confidence of introducing changes without irritating our code base.

Every serious programming language ships with tooling for writing and executing small-scoped tests. Numerous blogs, tutorials, and guides cover setting up these tests for any language in any integrated development environment. Beyond the limitations highlighted above, we suggest following our programming languages most supported practices.

[![Small-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/sst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/sst-execution.png)

## Medium-Scoped Tests

Incrementing our nomenclature by a size, medium-scoped tests verify the expected behavior between embedded and connected systems and validate the interactions between our software and its execution environment. Typical medium-scoped tests check features on different operating systems, read and write files from disk, connect to network endpoints, and confirm the interaction between subsystems of our product, e.g. a service with a database, a service with a connected service, or inter-process communication.

In order to test against these environments, we need to set them up. While we could build physical test farms consisting of dedicated hardware for different environments, this approach becomes unwieldy for modern software requirements. The sheer amalgamation of execution environments grew exponentially over the years. We cannot store and maintain every Android device on the market, nor can we provide Windows machinery with all combinations of graphic card models and their various drivers.

Besides adaptability, running on dedicated but a limited amount of hardware introduces a bottleneck to our testing availability. Once our testing frequency surpasses our testing load we delay discovering any breaking changes in our software. Plus, if we cannot isolate test runs on shared hardware we influence other test runs. Tests that leave the environment in a non-neutral state tarnish all following executions, and parallel tests competing over limited resources lead to flaky test results.

To counter these problems, we move from wholly physical environments to software-defined infrastructure. Virtual machines and containers allow us to isolate various test environments on shared machinery. To ensure hermeticity across sessions and devices, we use declarative and imperative tools to construct consistent testing infrastructure. Thus, any machine with the required virtualization technology installed may run our test cases.

To run medium-scoped tests and large-scoped tests in virtualized environments, we provide the infrastructure declarations with the source code itself. We place our setup scripts and definition files for test environments in the same repository and version it with our code changes. This allows our engineers to spawn the same test environment on their development machine that runs on our build servers. Hard coupling between source code and infrastructure code enables us to recreate the infrastructure our software expects at any given version.

### Test Doubles

We prefer to test against real implementations of connected systems. While modern container offerings make this goal achievable more often than not, unfortunately, sometimes, real implementations are too complex or costly to set up for frequent isolated runs. In these situations test doubles stand in as lightweight alternatives. Depending on their implementation, we categorize test doubles as *stubs*, *mocks*, or *fakes*.

#### Stubs

<!-- vale write-good.Weasel = NO -->
*Stubs* replace external dependencies with hard-coded responses. These canned implementations allow us to test code paths where response values are expected, but its content proves insignificant to our test case. *Stubs* require low effort and often consist of a single return value for stubbed methods. Initially typed out manually, sophisticated code bases may eventually autogenerate these based on source code or OpenAPI schemas with examples.
<!-- vale write-good.Weasel = YES -->

```golang
// Stub method for host/product/db/user.go#43
//
//   GetUsername(id int) string
//
func GetUsername(id int) string {
    return "stubbed_username"
}
```

#### Mocks

If we require higher fidelity in our tests, we write *mock* implementations - stateful replacements with a reduced feature set of the original dependency. These substitutes supplant - or *mock* - calls made to external systems with cheap and performant in-memory implementations. Any good mock requires knowledge of the original tools workings to provide an implementation with the minimum fidelity required to run our tests.

We use mocks for convenience when testing our source code. High-quality mocks require a low amount of resources, start up quickly, and are dead simple to use. The smarter a mock implementation, the less fitting it becomes for medium-scoped testing. A common fallacy of misplaced enthusiasm are *mirror doubles*. High fidelity systems that trade one complex dependency for a another slightly less complex one.

Substituting dependencies with mock implementations works best when code was written with testability in mind. Writing tests in tandem with source code improves the odds of injecting mocks for testing in greenfield projects. <!-- vale write-good.Weasel = NO -->Especially<!-- vale write-good.Weasel = YES --> when we work on "glue" code between platforms we pause to consider the testing code. Typically any officially supported API wrapper offers a mock substitute for the wrapper.

For the sake of brevity the following code snippet omits the actual mock code, but demonstrates how we inject a mock database to run our test against.

```golang
func Test_AuthenticateUserFromPayload(t *testing.T) {

    service := CreateNewService()

    // Mock implementation for host/product/db/mock_db.go
    // lightweight in-memory db to create, read, update,
    // and delete a user via their id
    mockDB := CreateNewMockDB()

    service.SetDB(mockDB)

    // run whatever tests we want
    // ...
}
```

#### Fakes

In the real world we find ourselves limited by factors out of our control. Previous decisions hard-coded an external dependency which monopolizes our testing resources. Initially we were able to increase our testing hardware to run multiple instances of our expensive system, but our CI/CD journey is blocked by the increased costs. We spend over half the testing time getting our dependencies up and running, or allocate massive amount of CPU and memory for running code that has not changed.

Fakes can be written either as a full stand-in replacement for testing, or within the original source code with alternate runtime configuration. We prune our dependency tree by skipping any expensive operations in form of validation, encryption, telemetry, serialization, authentication. All the aspects necessary for running in production, burden our test runs.

By definition, perfect fidelity with fakes is not feasible, as these need to be vastly simpler than the real implementation to be suitable for use in our tests. Fakes require effort and domain knowledge to behave similarly to the real implementation. If the real implementation changes, so must the fake.

A fake database does not have the fidelity of a real database but maintains fidelity to the API contracts. A fake does not keep fidelity to latency and resource consumption and is therefore unreliable to provide information about race conditions, timeouts, or benchmarking. On the other hand, the simplicity of test doubles compared to their legitimate counterparts reduces the flakiness of MSTs. When tests fail against test doubles, we gain certainty that the issue originated from our source, rather than the dependency.

&nbsp; | Stub | Mock | Fake
-|-|-|-
**Purpose** | Provide predefined responses | Verify interactions | Simulate functionality
**Behavior** | Passive | Active, validates behavior | Functional alternative
**Complexity** | Simple | Requires setup for validation | Often more complex

Using test doubles does not replace the need for testing against production environments. We employ them to increase our integration velocity by frequently testing against lighter-weight pseudo-implementations. We defer longer-running tests across sophisticated environments once we are confident with our code changes. This approach improves both our development velocity and final code stability.

Stubs, mocks, and fakes stand in for production services. Each method differs in terms of fidelity, maintenance cost, and execution rate. However, modern software development tooling have made testing against real implementations more commonplace. We build and test against all operating systems on our build machines, and it has become trivial to spin up lightweight ephemeral containers of our preferred database for MSTs.

Intuitively, we run any medium-scoped test against test doubles as a requirement of a merge request. The entire point of writing and maintaining test doubles is to verify our code changes as early as possible. After merging a green branch into main, we confirm the same tests against an actual implementation. The asynchronicity frees our developers to focus on a new task.

Testing pipelines evolve continuously. If we have written test-doubles for pre-merge testing, we might encounter two scenarios which encourage us to abandon our test doubles and execute the actual test to our pre-merge testing suite:

Firstly, we find that a test against an actual service requires fewer resources than expected. As our downstream dependencies become more mature and efficient, or our testing infrastructure evolves, we might be able to abandon a previous stand-in. We always prefer to test as against environments as close to production as possible.

Secondly, our code integrations fails frequently against the real-life component after passing the test double. We write test doubles to increase our integration velocity, not to add an additional burden to debug and maintain testing code. If at all feasible, we forsake the abstraction and run real-life tests on pre-merge. The effort we put into maintaining the light-weight alternative might be reallocated to making the actual component more efficient to run tests against.

[![Medium-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.png)


## Large-Scoped Tests

<!--
TODO: (Daniel) Make this chapter coherent. Avoid going in to detail.
This is an introduction. Detailed LST could be a book of itself.
-->

<!-- vale write-good.Weasel = NO -->
<!-- finally -->
Within the cosmology of automated testing, large-scoped tests embody the most expensive, complex, and adventurous test suite to set up and execute. Commonly referred to as *end-to-end tests* or *system tests*, they round off the pinnacle of the testing pyramid. Large-scoped tests validate a full roundtrip of a product feature - triggering an action via a UI or an API, authenticating the instigator, processing the request, forwarding the request to downstream components, reading and writing states to a database, and finally presenting a result to the user.
<!-- vale write-good.Weasel = YES -->

Due to the complexity and effort of creating environments for LSTs, an instinctive initial approach is to run a second deployment, identical to the live production, dedicated to staging and verifying our changes. However, n increasing number of teams staging changes to the same environment inflates the brittleness of said environment. Forcing a massive end-to-end test environment introduces problematic correlations and false positives or negatives. If we do offer LST staging areas, we must ensure every team can spin up a fenced-off instance to singularly test changes specified by that team.

The sheer herculean effort of running LSTs excludes them from being run as part of the merging process. At a minimum, though, we run LSTs as part of the pre-release process. We may execute LST on our main branch periodically during the week, preferably at nighttime to minimize interference with resources during active development. While LSTs can be run over the weekend, coming to the office on a Monday morning to failed test alerts of non-production technology is a stressful way to start the week.

Depending on our product and tech stack we face a plethora of challenges for creating, executing, and maintaining these tests. Writing automated tests that trigger input and parse feedback of UI applications become outdated with minor iterations. The complex nature of LST makes disregarding them altogether a **valid option**.

[![Large-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/lst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/lst-execution.png)

### Contract Testing

Similar to test doubles introduced in MSTs, contract testing presents an alternative to testing against implementations in an LST environment. Whereas test doubles require technology domain experience, contract testing is built upon cross-team communication effort. Establishing consumer-driven contracts formalizes the clear lines of communication between vertical teams enforced by the team interactions discussed in [Team Interactions](../../collaborating-within-a-company/team-interactions.md).

Contrary to test doubles, we do not test our changes against an abstraction of other systems, but against the contract we provide to dependent systems. Contracts are drawn up between team members of the consumer service and the provider service, both of whom participate in writing the contract tests. We run changes to our service against the contracts established for our service to certify our changes do not break dependent behavior.

Contract testing extends static strategies such as API testing and schema testing and requires more collaboration between contract parties. API testing and schema testing work exceptionally well when our organization embraces documentation-driven development, a practice where documentation is written first, and boilerplate code is generated based on the schema of the documentation. This kind of testing requires a lack of documentation drift, a fact realistically achievable if the documentation drives source code, not the other way round. [OpenAPI](https://www.openapis.org/) is a popular standard with a rich economy of open source tooling.

Writing and editing this chapter coincided with the acquisition of our startup and the resulting release of Perforce P4 One. The intermittent chances I had to work on this book led to a somewhat disjointed chapter. Until I find time to properly edit the three thousand words about automated functional testing, I'll finish on the three main takeaways of this prose: Run tests as early as possible, at the smallest scope possible, and only keep tests that build trust in the testing procedure. Testing best-practices are the one that are actually run by our developers.
