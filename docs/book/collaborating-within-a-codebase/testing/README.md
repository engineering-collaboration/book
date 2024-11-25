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

## Readability

Source code is written once and read many times. Test code escalates the popular proverb as we write it once, and read under the emotional duress accompanied by failing test cases. Failing tests invite frustration and illegible ones invite violence. Readable tests avoid smashed computer screens by succinctly explaining three key questions:

- What is the expected outcome of the test?
- Why did it fail?
- How do we expect the tested code to behave?

The first token presented to any engineer experiencing a failing test case is its name. A good name describes the actions being taken and the expected outcome. We encourage increased verbosity in test method names compared to production code as their names frequently need to be read by humans in reports. The extra verbosity is worth it to offer the chance to convey useful information for behavior-driven tests.

Writing informative error messages in production code is difficult. Writing informative error messages in test code is slightly less so. Since we control the entire context of the testing procedure we can efficiently communicate how the current state differs from the expected state. Test methods and error messages benefit from descriptive and meaningful phrases (DAMP) rather than the engineering dogma "don't repeat yourself" (DRY).

As for test code itself, we prefer simplicity over elegance. Every form of logic, such as operators, loops, and conditionals introduces complexity into our tests. When a piece of code contains logic, we require cognitive effort to determine its result instead of just reading it off the screen. Duplication is preferred when it makes the test more descriptive and meaningful. Every opaque test requires a synchronous meeting between authors to improve readability.

Concise naming combined with clear failure messages enable us to communicate the actions of our implementation. Focused tests provide context to the source code and demonstrate its purpose and limitations. Teams working on upstream dependencies reference the tests to consume our distributed source code and libraries. Internally, our tests streamlines merge requests as code reviewers spend less manual effort verifying code correctness.

Software documentation is notoriously unreliable and commonly has a tenuous relationship with the realities of the code it references. We cannot implicitly trust any written documentation about our software's error handling or processing of edge cases. Documentation may be severely erroneous, or only slightly outdated, but no matter the extent of the drift, documentation still "functions". Tests break. Our code behaves as reported for any passing test.

## Testing over Time

Besides catching unintentional breaking changes, tests fail because of three reasons: backwards incompatibility, brittle test code, and flaky test execution. As our product evolves, we add and update its features. These changes may become incompatible with earlier versions of our software. We update our tests to reflect the new expected behavior. When changing API behavior, we run product-wide tests to ensure downstream compatibility.

The term *brittle tests* describes tests that fail with minor (or even unrelated) source code changes. These tests typically indicate ill-formed testing code that is tightly coupled to an implementation. Brittleness does not scale with our product changes and becomes an annoyance to any engineer who deals with it. When encountering a brittle test, we edit the code to test a higher layer of abstraction of the functionality and verify our changes with the initial author.

If we cannot remove the brittleness, we remove the test. If the test code needs to be edited every time an engineer touches a certain code path, we might as well not have it. Our utmost priority is for developers to actively use the automated test suite and not build resentment towards the process. Propagating a brittle test for the next developer to fix it for their implementation achieves the opposite.

*Flaky tests* succeed or fail at random and indicate non-hermetic execution environments or race conditions in test code. The non-determinism of flaky tests normalizes the tendency of ignoring failed tests. Introducing that mindset turns our testing strategy into an expensive waste of time instead of a useful tool of shifting left. As randomly failing tests are inherently difficult to reproduce, we skip them during our testing pipeline until a dedicated team removes the flakiness.

We remove the test should it not provide the appropriate value. Twenty minutes is a long time to occupy machines that may be better suited for other jobs. If the test is necessary, we consider shifting it right, e.g., from pre-merge to post-merge. Successful and sensible testing is modeled against our team's needs and evolves over time. We revisit our testing strategy periodically and after significant events.

The most important property of our testing suite is our developers' trust in the process. The rare superlative is warranted, and we elevate the former statement to our absolute priority. We add tests when bugs are reported. We remove tests when they become brittle, flaky, redundant, or even just inconvenient. We move tests to be executed at different times when the current setup proves inefficient or ineffective.

### An example of Brittleness

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
