# Unit Tests

The nondescript name *unit test* causes confusion as to what is and what is not included in a unit. This lack of expressive naming has led to a plethora of interpretations and strategies. Insert Name uses the term "small scoped tests" in the book "Software Engineering at Google". I am hardly likely to do a better job at coming up with a name than Google, so this book will refer to tests in this chapter as Small Scoped Tests (SST).

SSTs are the foundation of Mike Cohn's testing pyramid. Meaning theses tests build the foundation of rapid and successful continuous integration and should be the most widespread use of tests in your code.

// insert image of testing pyramid

SST's are concise and fast. Products commonly contain thousands of unit tests that are executed within seconds. A complete suite of passing unit tests increases the confidence of introducing changes to the code base.

SST's consist of the smallest possible testable entity of your code. In most cases this is going to be a public method or function. Unit tests confirm correct and expected behavior of a single public function executed at runtime in memory.

## What is not in a Unit test?

Unit tests do not rely on any external implementations. This includes disk operations, network operations, and implementations specific to operating systems. The other fundamental constraint on small tests are that they aren't allowed to sleep, perform I/O operations, or make any blocking calls. This means that small tests aren't allowed to access the network or disk. We will talk about how to handle these instances in the Medium Scale Tests.

## When do I perform SST's?

SST's are the most common form of test with the lowest time consumption. SST's are typically run at every step of the development cycle.

- The devs machine
- on pre-merge
- on post-merge
- release

Correct behaviour
Dependencies on edge cases
Dependencies of return values
every public facing behaviour will eventually be depended on

Test behaviours, not implementation.

Split tests into behaviours, not all possible return values of a method. 


