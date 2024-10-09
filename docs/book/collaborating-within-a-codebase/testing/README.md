---
title: Testing
description: Testing is a complex and divisive topic. If not done adequately for our use case, we are better off doing less of it. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether.
---

# Testing

Testing is a complex and divisive topic, which if not done adequately, we are better off doing less of. Zealously over-testing potentially ends up being as expensive as imprudently disregarding testing altogether. This chapter outlines a broad view of practices and highlights what leavers we can pull to improve how we test our software. Successful and sensible testing is modeled against our team's needs and evolves over time. We revisit our testing strategy periodically and after significant events.

<!-- automation -->

The foundation of successful testing is built upon automation and frequency of execution. Depending on our team size, we run the same tests hundreds to thousands times a week. No amount of manual labour 

Testing is not a one-off task done as a step in the waterfall methodology. Throughout the life of a code change, a varying suite of automated tests ensures the correct integration of code changes at different times. Tests are executed …

- … on our developers' machine during development;
- … on pull requests (**Pre-merge**);
- … after a merge into main (**Post-merge**);
- … periodically on the main branch;
- … when creating a release candidate (**Pre-release**);
- … against the live version of our software (**Post-release**).

For every step, we provide context as to why that particular constraint exists to make it feel less arbitrary. People are less inclined to push back against rules when there is a clear reason behind them.



A term often cited in software engineering job listings is *Test-Driven Development* (TDD). TDD is the practice of writing tests for the behavior of a feature before working on the source code. An implementation is considered complete once it passes all tests and edge cases.

TDD encourages us to consider and transcribe a strategy to tackle problems in small increments. The upside of TDD sees diminishing returns with a growing complexity of implementations. Functions using file I/O or network I/O, or processes reliant on environment configurations are difficult to write tests for, even more so before the implementation is available.

<!-- Write code for testability -->


## Hermetic Environments

Tests run on various machines and runners, by various users and scripts, on various operating systems and environments. Failing tests due to drifting environmental configurations hinder development and build resentment towards writing and executing tests in the first place.

A hard requirement for tests is to be hermetic, meaning not reliant on a specific environment or execution order to be successful. Tests set up, execute, and tear down independently and in a confined manner. Tests provide accurate information regardless of the order in which they are run.

Medium and large-scoped tests provide the environment and infrastructure needed to execute expectedly. Using container tools such as Docker and [Infrastructure as Code (*WIP)]() (IaC) workflows ensures consistent configuration across platforms and machines. Small-scoped tests run without requiring a dedicated hermetic environment. Our testing suite performs as intended on every machine regardless of environmental configurations. As developers, we are able to replicate failing tests on the CI/CD runners on our machines.


## Test against Public-Facing APIs

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

### Hyrum's Law

<!-- vale Vale.Avoid = NO -->
!!! quote
    *"With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody."*  
    - Hyrum Wright
<!-- vale Vale.Avoid = YES -->

Hyrum's law states that every public-facing behavior of our implementation will be relied upon. While this includes error types and return codes, it also covers incidental actions, such as data layouts (e.g., if a seemingly random return value always follows the same pattern) and execution time (e.g., performance upgrades might trigger hitherto undetected race conditions).

We cannot foresee or control how third-party systems depend upon our implementation, and we question the feasibility of testing all public-facing characteristics of our implementation. We are aware that changes might be incompatible with current dependencies, and it is up to us to weigh the responsibility we delegate to our consumers.

## When Tests Break

Accidental breaking changes aside, changes to products will inevitably cease to pass established tests. We may have encountered a brittle test that is not scaling with our product changes. Depending on the severity of the fragility, we resolve the issue synchronously or asynchronously. Prominent brittleness may be removed by slightly altering the test and sending the initial author a direct message to corroborate our changes. Opaque tests may require a meeting to determine a resolution.

Failing tests for working code are an indicator of backward incompatibility. If these consequences have already been discussed, we ensure they are present within the [Design Document](../planning-implementations.md) and verified by all stakeholders. In case we find our design doc lacking, it is imperative to communicate the situation to our team lead until a strategy is agreed upon by all involved departments. While this sounds histrionic, most cases resolve themselves astutely with a brief email chain.


## Testing over Time

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

## Tests as Documentation

Software documentation is notoriously unreliable and commonly has a tenuous relationship with the realities of the code it references. Written documentation about the behavior of edge cases or default return values is not to be trusted. No matter the extent of the drift, documentation still "functions". Tests break.

Clear and focused tests provide context as to the purpose and limitations of code segments. Tests of edge cases demonstrate expected behavior for teams consuming our code. Demonstrated expected behavior streamlines pull requests, as code reviewers spend less manual effort verifying code correctness.

## Who writes Tests?

Some languages come with native testing tools, others require frameworks and external dependencies to execute test code. Factor in that different testing stages typically have different requirements, and we are faced with quite a collection of tools. It is reasonable to assign the selection, maintenance, or development of test tooling to dedicated teams.

It is **not** reasonable, in fact, it is highly discouraged, to move the responsibility of writing and executing the tests away from the developer writing the functionality. This change is sometimes introduced when the complexity of testing increases, such as end-to-end tests involving UI, middleware, backend services, and database entries. In order to reduce cycle times, it is imperative that developers write and maintain the tests.
