---
title: Small-Scoped Tests
description: SSTs are the most widespread kind of tests within our code given their brevity and low resource impact. Applications commonly contain thousands of SSTs executed within seconds.
---

# Testing Scopes

In the 2009 book "Succeeding with agile" Mike Cohn provides the metaphorical representation of the testing pyramid. The three-layered structure indicates guidelines for the amount of automated testing for each scope. The scope of the tests relates to the execution time and complexity of the test environment. The nature of these tests is outlined in detail in their individual chapters.

[![Testing Pyramid](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-pyramid.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-pyramid.png)

The base of the pyramid relies on numerous small-scoped unit tests that are run most frequently. Unit tests ([Small-Scoped Tests](./small-scoped-tests.md)) ensure correct behavior within a system.

The mid-layer consists of a reduced number of integration tests ([Medium-Scoped Tests](./medium-scoped-tests.md)) ensuring correct behavior between embedded or connected systems.

The pinnacle of the pyramid consists of automated end-to-end tests ([Large-Scoped Tests](./large-scoped-tests.md)). These ensure correct behavior across the entire product and require complex setups and are generally long-running operations.

From bottom to top, every layer of the pyramid reduces the number of tests by an order of magnitude. If we have 1000 SST, we aim for 100 MST, and no more than 10 LST. A common anti-pattern is what we refer to as a test snow cone, or inverted pyramid. These projects contain little to no small-scoped tests with all the testing done in labor and time-intensive manual tests. The emerging results are slow test runs and long feedback cycles.


## Readability

Method-oriented tests are named after the method being tested. Names of behavior-driven tests offer the chance to convey useful information, as the name is the first token visible to us on failing tests.

A good name describes the actions being taken on a system and the expected outcome. We encourage increased verbosity in test method names compared to production code method names as the use case is different. We never write code that calls these, and their names frequently need to be read by humans in reports. The extra verbosity is worth it.

Concise naming combined with clear failure messages enable us to fix our implementation transgressions with poise and grace. Test method naming and error messages follow the acronym DAMP (descriptive and meaningful phrases) rather than DRY (don't repeat yourself).

Complexity is introduced in the form of logic, such as operators, loops, and conditionals. When a piece of code contains logic, we require <!-- vale alex.Ablist = NO -->mental<!-- vale alex.Ablist = YES --> computation to determine its result instead of just reading it off the screen. In test code, we stick to straight-line code over clever logic. Duplication is preferred when it makes the test more descriptive and meaningful.

## Example

When writing tests, we assume as little as possible of the implementation. We compose tests for public-facing interfaces, not private ones. Private implementations change more frequently over time as additional feature requests come in and code is refactored, moved to libraries, or removed entirely.

When refactoring code, we run tests to ensure we haven't changed behavior for implementations that call the public-facing methods and APIs. Testing against private implementations increases the workload, as we actively just changed the private implementation and are now required to update the tests. It is a hurdle comprised of more effort than benefit.

Good tests assume as little as possible of the internal workings of the implementation and test against expected *behavior*, not an expected chain of *processes*. An example highlighting the difference:

```golang
func Test_SerializeStringSuccess(t *testing.T) {
    path := "/a/path/to/a/file"
    my_utils.WriteString("my-example-string", path)
    if err != nil {
		t.Fatalf("WriteString failed with error: " + err.Error())
	}

    data, err := os.ReadFile(path)
	if err != nil {
		t.Fatalf(err.Error())
	}

    hasString := string(data)
    wantString := "my-example-string"
    if hasBalance != wantBalance {
        t.Fatalf(`has %s, want match for %s`, hasBalance, wantBalance)
    }
}
```

The above implementation tests whether `my_utils.WriteString` writes the given input string to a file provided via a path. The problem with the above test lies within the fact that we are testing against the *process* of **how** `my_utils.WriteString` serializes the given string input.

The implementation becomes brittle with every future evolution of `my_utils.WriteString`. It cannot account for any additional tasks that are performed, such as byte padding, prefixing metadata, or serializing as clear text json vs binary json; assuming we output directly to a filesystem, instead of a virtualized environment or an in-memory database.

These aspects *might* be worth testing at a later stage in the product lifecycle for specialized software consumed by millions of clients. Assuming we are not working on products for healthcare or aviation, we prioritize development velocity over full process coverage and add tests solely after specific problems occurred in production. Instead, we write tests against the *behavior* of **what** we expect to happen.

```golang
func Test_SerializeStringSuccess(t *testing.T) {
    path := "/a/path/to/a/file"
    err := my_utils.WriteString("my-example-string", path)
    if err != nil {
		t.Fatalf("WriteString failed with error: " + err.Error())
	}

    // changed the line below to use our
    // public-facing ReadString instead of os lib
    data, err := my_utils.ReadString(path)
    if err != nil {
		t.Fatalf("ReadString failed with error: " + err.Error())
	}

    hasString := data
    wantString := "my-example-string"
    if hasBalance != wantBalance {
        t.Fatalf(`has %s, want match for %s`, hasBalance, wantBalance)
    }
}
```

<!-- vale write-good.Weasel = NO -->
<!-- likely -->
If the above implementation fails, we can now reasonably assume that changes done to `my_utils.WriteString` or `my_utils.ReadString` are no longer compatible, which is the behavior we are actually interested in during the development cycle. The second implementation is less likely to be flaky and scales with the product. It also models our customers' behavior, validating that the software meets our users' expectations.
<!-- vale write-good.Weasel = YES -->


<!-- vale Vale.Avoid = NO -->
!!! quote
    *"With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody."*  
    - Hyrum Wright
<!-- vale Vale.Avoid = YES -->

Hyrum's law states that every public-facing behavior of our implementation will be relied upon. While this includes error types and return codes, it also covers incidental actions, such as data layouts (e.g., if a seemingly random return value always follows the same pattern) and execution time (e.g., performance upgrades might trigger hitherto undetected race conditions).

We cannot foresee or control how third-party systems depend on our implementation, and we question the feasibility of testing all public-facing characteristics of our implementation. We are aware that changes might be incompatible with current dependencies, and it is up to us to weigh the responsibility we delegate to our consumers.


## Small-Scoped Tests

The nondescript name *unit test* causes confusion as to what is and what is not included in a unit. The lack of expressive naming has led to a plethora of interpretations and strategies. The book *Software Engineering at Google* introduces the term *small-scoped tests* (SST), which we decided to appropriate.

SSTs build the foundation of [Mike Cohn's testing pyramid](../#the-testing-pyramid), enabling rapid and successful continuous integration. SSTs are the most widespread kind of tests within our code given their brevity and low resource impact. Applications commonly contain thousands of SSTs executed within seconds. A complete suite of passing SSTs increases the confidence of introducing non-breaking changes to our code base.

### Defining Small-Scoped

SSTs consist of the smallest possible testable entity in our code to confirm the expected process of a single public behavior executed in memory. SSTs do not rely on environmental factors, including file operations, network operations, and implementations specific to operating systems.

The other fundamental constraint on small tests is that they do not sleep, perform I/O operations, or make any blocking calls. SSTs do not access the network, disk, or OS processes. These factors are covered by Medium Scaled Tests.

### Executing SSTs

Every serious programming language comes equipped with tooling for writing and executing small-scoped tests. The internet is bursting with blogs, tutorials, and guides for setting up SSTs for any language in any IDE. Beyond the strategies shared in [Good Practices](./good-practices.md), we avail full creative freedom for concrete implementations.

[![Small-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/sst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/sst-execution.png)

We do, however, share the recommendation that SST's small footprint warrants frequent execution. Hence, we run these kinds of tests during most steps of the development cycle: during development on our local machines, on pre-merge checks, post-merge validations, and as pre-release requirements.


## Medium-Scoped Tests

As with the term *unit tests*, the expression *integration tests* conjures a bias towards differing implementation strategies. We, therefore, advance our naming from *small-scoped tests* to *medium-scoped tests* (MST). MSTs are the second and penultimate layer of [Mike Cohn's testing pyramid](../#the-testing-pyramid). These verify correct and expected behavior between **embedded systems and connected systems**.

MSTs verify interactions between the code and execution environment, e.g. operating systems, file I/O, network I/O, and the interplay between subsystems of our product, e.g. a service with a database, a service with a connected service.

<!--
Medium and large-scoped tests provide the environment and infrastructure needed to execute expectedly.
-->

### Test Doubles

Test doubles stand in during the testing procedure when real implementations are too complex or costly to set up for hermetic testing. As an example, when writing services against a third-party platform, we validate API calls against a double instead of spawning the entire platform ephemerally. Test doubles also function as deputies for legacy code written with limited testability in mind.

Depending on the implementation, test doubles are called *stubs*, *mocks*, or *fakes*. These terms refer to differing strategies in terms of fidelity and execution cost. By definition, perfect fidelity with doubles is not feasible, as these need to be vastly simpler than the real implementation to be suitable for use in our tests.

Fakes require effort and domain knowledge to behave similarly to the real implementation. If the real implementation changes, so must the fake. Depending on the nature of the doubles used, testing against these organically leads to testing against processes instead of behaviors, which leads to brittle tests (as covered in [Good Practices](./good-practices.md)).

The simplicity of test doubles compared to their complex counterparts reduces the flakiness of MSTs. When tests fail against test doubles, we gain certainty that the issues originate in our source, rather than the dependency.

A fake database does not have the fidelity of a real database but maintains fidelity to the API contracts. A fake does not keep fidelity to latency and resource consumption and is therefore unreliable to provide information about race conditions, timeouts, or benchmarking.

With modern software development tooling, testing against real implementations becomes the more commonplace practice. We build and test against all operating systems on our build machines, and it has become trivial to spin up lightweight ephemeral containers of our preferred database for MSTs.

### Executing MSTs

MSTs' complexity and computational requirements position them to be executed after code changes are merged to main. Should we find that our MSTs utilize fewer resources than expected and code integrations to our main branch frequently fail, we consider moving them to pre-merge.

[![Medium-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/mst-execution.png)


## Large-Scoped Tests

Large-scoped tests (LST) test the flow of commands from user input across different APIs, serialization strategies, and verify that the returned behavior is as expected.

Within the cosmology of automated testing, LSTs represent the most expensive, complex, and lengthy test suite to set up and execute. Commonly referred to as *end-to-end tests* or *system tests*, they cover the pinnacle of the testing pyramid. From bottom to top, every layer of the pyramid reduces the number of tests by an order of magnitude. A project containing 1000 SSTs includes 100 MSTs and comprises no more than 10 LSTs.

LSTs are so subjective to the organizations and products they are run in; no solution applies across companies. The technology stack and approach of game companies have little in common with the approach of cloud providers, which, in turn, differs tremendously from mobile applications or embedded systems. The complex nature of LST makes disregarding them altogether a **valid option**.

### Independent Testability

Due to the complexity and effort of creating environments for LSTs, an instinctive initial approach is to run a second deployment, identical to the live production, dedicated to staging and verifying our changes. This approach may well be a good solution for us, but it is an expensive endeavor and does not scale well.

An increasing number of teams staging changes to the same environment inflates the brittleness of said environment. Forcing a massive end-to-end test environment introduces problematic correlations and false positives or negatives. If we do offer LST staging areas, we must ensure every team can spin up a fenced-off instance to singularly test changes specified by that team.

### Contract Testing

Similar to test doubles introduced in MSTs, contract testing presents an alternative to testing against implementations in an LST environment. Whereas test doubles require technology domain experience, contract testing is built upon cross-team communication effort. Establishing consumer-driven contracts formalizes the clear lines of communication between vertical teams enforced by the team interactions discussed in [Team Interactions](../../collaborating-within-a-company/team-interactions.md).

Contract tests validate established agreements between teams as instituted in the consumer-driven contracts. Contracts are drawn up between team members of the consumer service and the provider service, both of whom participate in writing the contract tests. All consumer contract tests are run against our pending implementation in the provider services to certify our changes do not break dependent behavior.

Contract testing extends static strategies such as API testing and schema testing and requires more collaboration between contract parties. API testing and schema testing work exceptionally well when our organization embraces documentation-driven development, a practice where documentation is written first, and boilerplate code is generated based on the schema of the documentation. This kind of testing requires a lack of documentation drift, a fact realistically achievable if the documentation drives source code, not the other way round. [OpenAPI](https://www.openapis.org/) is a popular standard with a rich economy of open source tooling.

### Executing LSTs

The sheer herculean effort of running LSTs excludes them from being run as part of the merging process. At a minimum, though, we run LSTs as part of the pre-release process. We may execute LST on our main branch periodically during the week, preferably at nighttime to minimize interference with resources during active development. While LSTs can be run over the weekend, coming to the office on a Monday morning to failed test alerts of non-production technology is a stressful way to start the week.

[![Large-Scoped Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/lst-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/lst-execution.png)
