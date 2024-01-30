# Testing in production

The vast majority of tests focus on pre-production validation. Specifically we are using tests to ensure software is of sufficient quality before it is deployed into production. Passing (or failing) tests area gating condition for deciding whether the software should be deployed.

[![Testing In Production Execution](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-in-prod-execution.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/testing-in-prod-execution.png)

Testing does not end once our software is deployed. It is embarrassing for our company if we are the last to know whether our live software is running or not. We do not rely on bug reports from our user base to be made aware of active problems. Since our production deployment varies to our test environment we either test in production or live a lie.

## Incremental rollouts

When releasing new versions we can roll our changes out to the public in iterations. Blue-green deployments and canary releases appraise working functionality and evaluate product decisions with a subset of our user base before fully committing to distributing changes. We cover these procedures in detail in the chapter [Release Strategies]().

## Production systems

A live system used by a high number of users functions differently than our internal test environment. Our system copes with a higher amount of users, requests, bots, noise, infrastructure dependencies.

Aspects of our system need to be verified in production to assess real world functionality. We monitor and evaluate caching and cache invalidation, token timeouts, availability across zones, and other metrics indicative of performance and system health.

As we do not have full control of our third party integrations and partner contracts, these may solely be effectively tested continuously in live environments. We certify working anchors, referral links, and third party modules periodically in order to maintain agreements with partner entities and proactively provide feedback in case of outages.

Registering fake users, our manual and automated tests perform tasks to verify expected outcomes of LSTs within the noisy live environments. Utilizing this pool of fake users, the product and quality departments uncover unexpected or opaque behavior for varying user groups.

## Chaos engineering

<!-- vale write-good.Weasel = NO -->
<!-- only just works -->
If not pioneered by Netflix, chaos engineering is certainly being spearheaded by the streaming service. It is a practice of purposefully wrecking system services of our live production software. As Netflix reached a global scale of constant availability, the chance of outages across a worldwide service reaches a certainty. Natural disasters, political interference, limitations of physics combined with a global IT infrastructure that [only just works](http://www0.cs.ucl.ac.uk/staff/m.handley/papers/only-just-works.pdf) constrain the workings of our offering.
<!-- vale write-good.Weasel = YES -->

By introducing [Chaos Monkey](https://netflix.github.io/chaosmonkey/), a tool wreaking havoc on production systems, the mindset of engineers switched from *services might fail* to *services will be killed*. This practice leads to more robust systems as potential fragility, like network timeouts, is elevated to the norm instead of outliers. When they do happen, the system and its services are designed to cope.
