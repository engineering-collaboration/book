# Small scoped tests

The nondescript name *unit test* causes confusion as to what is and what is not included in a unit. The lack of expressive naming has led to a plethora of interpretations and strategies. The book "Software Engineering at Google" introduces the term "small scoped tests" (SST) which we decided to appropriate.

// insert image of testing pyramid

SSTs build the foundation of Mike Cohn's testing pyramid, enabling rapid and successful continuous integration. SSTs are the most widespread kind of tests within our code as they are concise and fast. Applications commonly contain thousands of SSTs executed within seconds. A complete suite of passing SSTs increases the confidence of introducing non-breaking changes to our code base.

## What is not in a SST?

SST's consist of the smallest possible testable entity in our code to confirm expected process of a single public behavior executed in memory. SSTs do not rely on environmental factors, including file operations, network operations, and implementations specific to operating systems. The other fundamental constraint on small tests are that they do not sleep, perform I/O operations, or make any blocking calls.

SSTs do not access the network, disk, or OS processes. These factors are covered by Medium Scaled Tests.

## When do I perform SST's?

SST's are the most common form of test with the lowest time consumption. SST's are typically run at every step of the development cycle.

- Our development machine
- On pre-merge checks
- On post-merge checks
- On pre-release checks
