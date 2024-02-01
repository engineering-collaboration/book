---
title: Good practices
description: Before delving deeper into distinct testing scopes and strategies we examine generally applicable good practices when it comes to writing tests.
---

# Good practices

Before delving deeper into distinct testing scopes and strategies, we examine generally applicable good practices when it comes to writing tests.

## Test against public facing APIs

When writing tests we assume as little as possible of the implementation. We compose tests for public facing interfaces, not private ones. Private implementations change more frequently over time as additional feature requests come in and code is refactored, moved to libraries, or removed entirely.

When refactoring code we run tests to ensure we haven't changed behavior for implementations that call the public facing methods and APIs. Testing against private implementations increases the workload, as we actively just changed the private implementation and are now required to update the tests. It is a hurdle comprised of more effort than benefit.

## Test behavior, not processes

Good tests assume as little as possible of the internal workings of the implementation and test against an expected *behaviour* not an expected chain of *processes*. An example highlighting the difference:

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
    // public facing ReadString instead of os lib
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
If the above implementation fails we can now reasonably assume that changes done to `my_utils.WriteString` or `my_utils.ReadString` are no longer compatible, which is the behavior we are actually interested in during the development cycle. The second implementation is less likely to be flaky and scales with the product. It also models our customers behavior, validating that the software meets our user's expectations.
<!-- vale write-good.Weasel = YES -->

### Hyrum's law

<!-- vale Vale.Avoid = NO -->
!!! quote
    *"With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody."*  
    - Hyrum Wright
<!-- vale Vale.Avoid = YES -->

Hyrum's law states that every public facing behavior of our implementation will be relied upon. While this includes error types and return codes, it also covers incidental actions, such as data layouts (e.g. if a seemingly random return value always follows the same pattern) and execution time (e.g. performance upgrades might trigger hitherto undetected race conditions).

We cannot foresee or control how third party systems depend upon our implementation and we question the feasibility of testing all public facing characteristics of our implementation. We are aware that changes might be incompatible with current dependencies and it is up to us to weigh the responsibility we delegate to our consumers.

## When tests break

Accidental breaking changes aside, changes to products will inevitably cease to pass established tests. We may have encountered a brittle test which is not scaling with our product changes. Depending on the severity of the fragility we resolve the issue synchronously or asynchronously. Prominent brittleness may be removed by slightly altering the test and sending the initial author a direct message to corroborate our changes. Opaque tests may require a meeting to determine a resolution.

Failing tests for working code is an indicator of backwards incompatibility. If these consequences have already been discussed, we ensure they are present within the [Design Document](../planning-implementations.md) and verified by all stakeholders. In case we find our design doc lacking, it is imperative to communicate the situation to our team lead until a strategy is agreed upon by all involved departments. While this sounds histrionic, most cases resolve themselves astutely with a brief email chain.

## Naming of tests

Method oriented tests are named after the method being tested. Names of behavior driven tests offer the chance to convey useful information, as the name is the first token visible to us on failing tests.

A good name describes the actions being taken on a system and the expected outcome. We encourage increased verbosity in test method names compared to production code method names as the use case is different. We never write code that calls these, and their names frequently need to be read by humans in reports. The extra verbosity is worth it.

Concise naming combined with clear failure messages enable us to fix our implementation transgressions with poise and grace. Test method naming and error messages follow the acronym DAMP (descriptive and meaningful phrases) rather than DRY (don't repeat yourself).

## Don't put logic in tests

Complexity is introduced in the form of logic, such as operators, loops, and conditionals. When a piece of code contains logic, we require <!-- vale alex.Ablist = NO -->mental<!-- vale alex.Ablist = YES --> computation to determine its result instead of just reading it off the screen. In test code we stick to straight-line code over clever logic. Duplication is preferred when it makes the test more descriptive and meaningful.
