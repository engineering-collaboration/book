# Good practices when writing tests

Before delving deeper into distinct testing scopes and strategies we can examine some generally applicable good practices when it comes to writing tests.

## Test against public facing API's

When writing tests it is best assume as little as possible of the the implementation. We aim to write tests for public facing interfaces, not private ones. Private implementations tend to change more frequently over time as additional feature requests come in and code is refactored, moved to libraries, or removed entirely.

When refactoring code we want to run tests to ensure we haven't changed behavior for implementations that call the public facing methods and API's. Testing against private implementations mostly doesn't make sense as we actively just changed the private implementation.

## Test behavior, not processes

As mentioned above when writing tests it is best to assume as little as possible of the internal workings of the implementation. Therefore we want to test against an expected *behaviour* not an expected chain of *processes*.

An example that highlights the difference is testing our serialization utilities.

```golang
func Test_WriteStringSuccess(t *testing.T) {
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

The above implementation tests whether `my_utils.WriteString` correctly writes the given input string into a file provided via a path string. The problem with the above test implementation lies within the fact that we are testing against the *process* of **how** `my_utils.WriteString` serializes the given string input.

The above implementation becomes brittle with every future evolution of `my_utils.WriteString` as it cannot account for any additional tasks that are performed, such as byte padding, prefixing metadata, serializing as clear text json vs binary json... And these are assumptions that we are writing directly to a filesystem, instead of a virtualized environment or an in-memory database.

These might be aspects that we want to test either at a later stage in the product lifecycle, or because we are working on extremely specialized software, or are working on a popular library that is being dependent on by millions of projects. I guarantee these are not aspects we want to write tests for BEFORE a specific problem has occurred in production that allowed the necessity of testing against process.

Instead we prefer writing tests against the *behavior* of **what** we expect to happen.

```golang
func Test_WriteStringSuccess(t *testing.T) {
    path := "/a/path/to/a/file"
    err := my_utils.WriteString("my-example-string", path)
    if err != nil {
		t.Fatalf("WriteString failed with error: " + err.Error())
	}

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

If the above implementation fails we can now reasonably assume that changes done to `my_utils.WriteString` or `my_utils.ReadString` are no longer compatible which is the behavior we are actually interested in mostly during the development cycle. The second implementation is less likely to be flaky, noisy and more scalable when the product scales.

Flexibility: Behavior tests are often more resilient to implementation changes since they focus on the observable behavior.
User-Centric: They closely model the user's perspective, making them better at ensuring that the software meets user expectations.

There is something to be said to test all public facing features of your implementation. You cannot possibly foresee not control how third party systems will depend on your implementation.

It is up to you to weigh the benefit and cost of automating tests to changes of your public facing API. A mature codebase with a high number of dependencies will benefit more from these kind of tests than v0.x code still in active development.

Quoting whoevers law here "Every public facing behaviour of your implementation will eventually be relied upon". This includes obvious examples such as error types and return codes, but also data layouts, e.g. if a seemingly random return value always follows the same pattern, and execution time, e.g. performance upgrades might trigger hitherthough undetected race conditions.


## Naming of tests

Method oriented tests are usually named after the method being tested. With more focused behaviour driven tests, we have a lot more flexibility and the chance to convey useful infomration. The test name is usually the first token visible to the developer when a test fails.

A good name descibes both the actions tht are being takjen on a system and the expected outcome.
Names like this are much more verbose than we'd normally want to write for methods in production code, but the use case is a different. We never need to write code that calls these, and their names frequently need to be read by humans in reports. The extra verbosity is worth it.

## Don't put logic in tests

Complexity is most often iontroduced in the form of logic. Logic is defined via the imperative parts of programming languages such as operators, loops, and conditionals. When apiece of code contains logic, you need tpo do a bit of mental computation to dtermine its result instead of just reading it off of the screen. The lesson is clear: in test code, stock to straight-line code over clever logic, and consider tolerating some duplication when it makes the test more descriptiive and meaningful.

## Good practices

DAMP (Descriptive and meaningful phrases), not DRY (don't repeat yourself)
- Strive for unchanging tests
- Test via public API
- Test state, not interactions
- Make your tests complete and concise
- Test behaviours, not methods
- Structure tests to emphasize behaviours
- Name tests
- Don't put logic in tests
- Write clear failure messages
- DAMP, over DRY
