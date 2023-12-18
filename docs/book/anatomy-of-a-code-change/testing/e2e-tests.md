# End-to-end tests

In keeping with our naming conventions we refer to e2e tests as Large Scoped Tests (LST). LST is the pinnacle of the testing pyramid. As a reminder, from bottom to top, every layer of the pyramid reduces the amount of tests by an order of magnitude. This means if we have 1000 SST, we aim for 100 MST, and no more than 10 LST.

Done before release, or periodically on the main branch.

LST's are by nature expensive, complex, and lengthy to set up and execute. So much so that not doing and LST might be a valid option.

## End-to-end tests vs contract tests

A good practice here is to have someone from the producer and consimer teams collaborate on creating the tests, so perhaps peopler from the web shop.

Arguably, consumer-driven contracts are as much about fostering clear lines of communication and collaboration. Enforcing Consumer driven contracts is just making more explicit the lines of communication between teams that should already exist.

## Independent testability

End-to-end test environments should be able to be spawned up by each team separately. Forcing a massive end-to-end test environment can introduce problematic correlations and false positives or negatives.
