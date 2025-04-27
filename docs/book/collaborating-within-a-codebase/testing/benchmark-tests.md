---
title: Benchmark Tests
description: In order to avoid any kind of performance regression, we run our changes through relevant benchmark tests. As the word benchmark indicates, these tests check for discrete metrics for a certain facet of our software.
---

# Well, working software

Once we reliably ship working software with the help of automated functional testing, we should take a moment to appreciate our accomplishment. Running frequent and dependable tests places us in the higher echelons of software companies. I'm confident that implementing the large-scoped automated tests inspired us to consider how else we might monitor software quality beyond function. But, just as wine tasting, tattoos, home improvements, once we have a taste for it, we're planning the next one.

This chapter covers ideas and strategies on how we move from "Well, it's working." to "It's working well.".

## Benchmark Tests

As the word *benchmark* indicates, these tests validate discrete metrics for a certain facet of our software. The evaluated benchmarks of our software indicate whether our organization meets the acceptance criteria set by our stakeholders. Measured metrics help us analyze and compare our performance to competitors on the market. In order to avoid any kind of performance regression, we write and run benchmark tests.

The primary example benchmarks performance. We write tests to identify efficiency bottlenecks within our software and. Over time, the practice helps us avoid performance regressions with our changes. We define performance as any metric occurring during runtime that we care about and decide to document.

For example, we identify issues related to memory leaks and resource management by running our software at full capacity for an extended amount of time. We measure the system's maximum load and user interactions by continuously incrementing the amount of concurrent calls until processing errors crop up. We measure the acceptable loading time of a web page and response times for user interactions to ensure our system meets acceptable latency standards.

We may measure performance-increasing strategies of cache effectiveness, edge content delivery, lazy loading, deferred executions, or whatever else we identify as crucial for our use cases.

While *performance tests* evaluate our proficiency when everything goes well, *robustness tests* assess our capacity for dealing with increased load and failures.

We evaluate our system's ability to adapt to traffic spikes and increased resource requirements by scaling up or down in terms of hardware, software, or network resources. We test our system's conduct under extreme conditions or beyond its expected maximum capacity, pinpointing the stress our software handles before breaking. When things break, we want them to break well-defined and with immediacy. Non-determinism and unknown states in our software are hazardous things.

After the worst has happened and our software crashed either due to a lack of scalability or malicious third-party attacks, we test our disaster recovery measures. Shorter durations to fully recover from downtime minimize potential costs and revenue losses to our organization.

## Accessibility Tests

We maximize the number of potential users by making certain our software is usable by a broad spectrum of people. Traditionally, accessibility was related to physical traits, such as vision, mobility and motor skills, hearing, speech, or cognitive disabilities. Depending on our product, we utilize a mix of static and runtime tests to verify perceptibility and input options for various senses to interact with our software. We test for contrasting color palettes, labeling, navigation, text-to-speech, font size and content zooming, and inspect our UIs and APIs against our design system to ensure internal consistency within the software.

We extend physical accessibility traits with demographic, economical, and geographic factors. We test whether our software runs on a broad range of devices, potential outdated hardware, and with low-bandwidth internet. Our payment options and processing work beyond US credit cards, our application layout adapts for reading both left-to-right and right-to-left, our software uses culturally invariant upper-case and lower-case characters when processing input text and we support a broad range of character encoding.

If our distribution location requires regulatory compliance, we appraise those when releasing changes to our software. We test against these requirements when packaging localized versions of our package.

We run benchmark tests multiple times a week during low-traffic hours during the week or on the weekend. The longer we go without running performance tests, the harder it can be to track down the culprit.

[![Benchmark Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/benchmark-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/benchmark-execution.png)


## Manual Tests

The feasibility of automated tests has its limits. Human usability aspects are best evaluated with human judgment.

### Qualitative

Explorative manual testing appraises the quality of the output our software generates and its significance and validity in the given context. Interdisciplinary product decisions regarding usability and user experience require vision, creativity, and domain experience.

We automate supporting processes for manual testing; for example, we can statically analyze if every image on a webpage has an alt text, but it becomes impractical to analyze if the alt text accurately describes the image.

We statically verify that our system follows the guidelines defined within our design system. Aesthetic components such as color, loaded fonts, and spacing. It is difficult to automatically evaluate product characteristics such as transparency, clicks to purchase, and consistent experiences throughout the product.

### Security

During security tests and <!-- vale alex.ProfanityMaybe = NO -->penetration<!-- vale alex.ProfanityMaybe = YES --> tests, allies uncover and exploit vulnerabilities in our system before malicious entities take advantage of them. Domain experts stress the boundaries in systems, trying to effectively break our software. Broken states in our systems lead to flaws in our product, such as multiple shipments of a single order.

### Nightly, Alpha, and Beta Programs

Thus far, we have discussed manual tests done internally or by third-party providers. A common strategy to demonstrate build stability and user acceptance is to offer early releases to a restricted control group consisting of power users. Sorted by recency, these programs are termed:

- Nightly releases - A build of our current head of the main branch.
- Alpha releases - The first phase in our product release cycle. We cooperate with power users on customer acceptance for features.
- Beta releases - The second phase in our product release cycle. We iterate on feature stability with a wider audience.
- Tech streams - Full releases of our product with limited warranty. Participants access releases a quarter early to authenticate that the upgrade functions with their projects and infrastructure.

The major benefit of early access programs is the user diversity. Our software is tested across a broad spectrum of cultures, hardware combinations, software requirements, and security restrictions. No other testing environment consolidates feedback about localization flaws, crashes with select hardware drivers, or mistaken runtime assumptions.

These (semi-)public manual testing strategies require dedicated personnel with product experience qualified in communications. This is much less a technological role than it is a mediatory role. Often, our software builds the base of the livelihood of our users. Perceived detrimental changes fuel anxiety and emotional responses.

Strategies in user experience and accessibility steadily move from manual testing to automated testing. As security testing shifted left more and more, our terms evolved; for example, DevOps is now referred to as DevSecOps. Regardless of labels, we intend to shift all feasible product aspects left and introduce them to earlier testing stages.

[![Manual Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/manual-testing-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/manual-testing-execution.png)

Security Engineers and QA Engineers work in close cooperation with product owners, feature engineers, site reliability engineers, and the user base to evolve feature life-cycles and testing strategies.


## Testing in Production

The vast majority of tests focus on pre-production validation, specifically using tests to ensure that the software is of sufficient quality before deploying it into production. Test outcomes influence the decision on whether our software should be deployed.

[![Testing In Production Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-in-prod-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-in-prod-execution.png)

Alas, testing does not end once our software is in production. It would be embarrassing for our company if we were the last to know whether our live software is running or not. We do not rely on bug reports from our user base to be made aware of active problems. Since our production deployment varies from our test environment, we either test in production or live a lie.

### Incremental Rollouts

When releasing new versions, we roll out our changes to the public in iterations. Blue-green deployments and canary releases appraise working functionality and evaluate product decisions with a subset of our user base before fully committing to distributing changes. We cover these procedures in detail in [Release Strategies (*WIP)]().

### Production Systems

A live system used by a high number of users functions differently than our internal test environment. Our system copes with a higher amount of users, requests, bots, noise, and infrastructure dependencies.

Aspects of our systems need to be verified in production to assess real-world functionality. We monitor and evaluate caching and cache invalidation, token timeouts, availability across zones, and other metrics indicative of performance and system health.

As we do not have full control over our third-party integrations and partner contracts, these may solely be effectively tested continuously in live environments. We certify working anchors, referral links, and third-party modules periodically to maintain agreements with partner entities and proactively provide feedback in case of outages.

Registering fake users, our manual and automated tests perform tasks to verify expected outcomes of LSTs within the noisy live environments. Utilizing this pool of fake users, the product and quality departments uncover unexpected or opaque behavior for varying user groups.

### Chaos Engineering

<!-- vale write-good.Weasel = NO -->
<!-- only just works -->
If not pioneered by Netflix, chaos engineering is certainly being spearheaded by the streaming service. It is a practice of purposefully wrecking services in our live production software. As Netflix reached a global scale of constant availability, the chance of outages across a worldwide system reaches certainty. Natural disasters, political interference, limitations of celestial mechanics combined with a global IT infrastructure that [only just works](http://www0.cs.ucl.ac.uk/staff/m.handley/papers/only-just-works.pdf) constrain the workings of our offering.
<!-- vale write-good.Weasel = YES -->

By introducing [Chaos Monkey](https://netflix.github.io/chaosmonkey/), a tool wreaking havoc on production systems, the mindset of engineers switched from *services might fail* to *services will be killed*. This practice leads to more robust systems as potential fragility (like network timeouts) is elevated from an outlier to being the norm. When outages do happen, the system and its services are designed to cope.


## Testing Strategy

Throughout this chapter, we discussed types of testing across the development cycle. From working on changes to releasing to production, we balance the execution of tests between utility and execution complexity, cost, and time. We have arrived at a solid foundation for a testing strategy for our organization.

[![Testing Strategy](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-strategy.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/testing-strategy.png)

This base presents a well-founded starting ground to work from. Depending on our product, technology, and client demographic, we evolve the testing procedure into a strategy modeled to our needs. The balance between the cost of LSTs, benchmark tests, and manual tests compared to the frequency of faulty integrations ultimately defines the execution order, dependency, and concurrency fitted to our needs.

Sticking to the testing pyramid for automated tests supports building short feedback cycles with a low change fail rate. Manual qualitative tests are difficult to discretely put into context with a test number but should be the least amount of executed tests in our product release cycle. Or rather, we aim for releases not being dependent on qualitative manual testing at all.

As with the terms *unit*, *integration*, and *end-to-end*, software testing strategies birthed the labels *smoke tests*, *sanity tests*, and *regression tests* for various flavors and testing verticality. While it may make sense to group the execution of a set of MSTs and LSTs into these categories, we do not zealously follow them or mimic our testing strategy to suit predefined terms.

Testing is a complex topic with subjective implementations that evolve to fit our needs.
