# Large scoped tests

Large scoped tests (LST) test the flow of commands from user input across different API's, serialization strategies and verifies the returned behavior is as expected.

Within the cosmology of automated testing LSTs represent the most expensive, complex, and lengthy test suite to set up and execute. Commonly referred to as *end-to-end tests* or *system tests*, they cover the pinnacle of the testing pyramid. From bottom to top, every layer of the pyramid reduces the amount of tests by an order of magnitude. A project containing 1000 SST, includes 100 MST, and comprises no more than 10 LST.

LSTs are so subjective to the organizations and products they are run in, no solution applies across companies. The technology stack and approach of game companies has little in common with the approach of cloud providers, which in turn differ tremendously from mobile applications or embedded systems. The complex nature of LST makes disregarding them altogether a valid option.

## Independent testability

Due to the complexity and effort of creating environments for LSTs an instinctive initial approach is to run a second deployment, identical to the live production, dedicated to staging and verifying our changes. This approach may well be a good solution for us, but it is an expensive endeavour and does not scale well.

An increasing amount of teams staging changes to the same environment inflates the brittleness of said environment. Forcing a massive end-to-end test environment introduces problematic correlations and false positives or negatives. If we do offer LST staging areas we must ensure every team can spin up a fenced off instance to singularly test changes specified by that team. 

## Contract testing

Similar to test doubles introduced in MSTs, contract testing presents an alternative to testing against implementations in an LST environment. Whereas test doubles require technology domain experience, contract testing is built upon cross team communications effort. Establishing consumer-driven contracts formalize the clear lines of communication between vertical teams enforced by the team interactions discussed in [Team Interactions](../../anatomy-of-a-software-company/team-interactions.md).

Consumer driven contracts

Schema testing, API testing, contract testing

Contract testing works exceptionally well when our organization embraces documentation driven development, a practice where documentation is written first and boilerplate code is generated based on the schema of the documentation. OpenAPI (previously Swagger) schemas is a popular standard with a rich economy of open source tooling. The obvious dependency of contract testing is a lack of documentation drift, something realistically only achievable if the documentation drives source code, not the other way round.

A good practice here is to have someone from the producer and consumer teams collaborate on creating the tests, so perhaps peopler from the web shop.

## Executing LSTs

Done before release, or periodically on the main branch.
