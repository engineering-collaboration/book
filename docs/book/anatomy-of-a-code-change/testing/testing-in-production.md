# Testing in production

The vast majority of tests focus on preprodcution validation. Specifically we are using tests to ensure software is of sufficient quality before it is deployed into production. Passing (or failing) tests area gating condition for deciding whether the software should be deployed.

Testing does not end once our software is deployed. It is embarrassing for our company if we are the last to know whether our live software is running or not. We do not rely on bug reports from our user base to be made aware of active problems. Since our production deployment varies to our test environment we either test in production or live a lie.

## Rollouts

When releasing new versions we can roll our changes out to the public in iterations. Blue-green deployments and canary releases appraise working functionality and evaluate product decisions with a subset of our user base before fully committing to distributing changes. We cover these procedures in detail in the chapter [Release Strategies]().

## Production systems

A live system used by a high number of users functions differently than our internal test environment. Our system copes with a higher amount of users, noise, requests, bots, infrastructure dependencies.

cache (in)validation
Availability
token timeouts

third party
links
refs
contact forms

registering fake user and perform tasks

## chaos engineering
