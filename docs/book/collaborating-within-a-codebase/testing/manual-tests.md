---
title: Manual Tests
description: The feasibility of automated tests has its limits. Human usability aspects are best evaluated with human judgment.
---

# Manual Tests

The feasibility of automated tests has its limits. Human usability aspects are best evaluated with human judgment.

## Qualitative

Explorative manual testing appraises the quality of the output our software generates and its significance and validity in the given context. Interdisciplinary product decisions regarding usability and user experience require vision, creativity, and domain experience.

We automate supporting processes for manual testing; for example, we can statically analyze if every image on a webpage has an alt text, but it becomes impractical to analyze if the alt text accurately describes the image.

We statically verify that our system follows the guidelines defined within our design system. Aesthetic components such as color, loaded fonts, and spacing. It is difficult to automatically evaluate product characteristics such as transparency, clicks to purchase, and consistent experiences throughout the product.

## Security

During security tests and <!-- vale alex.ProfanityMaybe = NO -->penetration<!-- vale alex.ProfanityMaybe = YES --> tests, allies uncover and exploit vulnerabilities in our system before malicious entities take advantage of them. Domain experts stress the boundaries in systems, trying to effectively break our software. Broken states in our systems lead to flaws in our product, such as multiple shipments of a single order.

## Nightly, Alpha, and Beta Programs

Thus far, we have discussed manual tests done internally or by third-party providers. A common strategy to demonstrate build stability and user acceptance is to offer early releases to a restricted control group consisting of power users. Sorted by recency, these programs are termed:

- Nightly releases - A build of our current head of the main branch.
- Alpha releases - The first phase in our product release cycle. We cooperate with power users on customer acceptance for features.
- Beta releases - The second phase in our product release cycle. We iterate on feature stability with a wider audience.
- Tech streams - Full releases of our product with limited warranty. Participants access releases a quarter early to authenticate that the upgrade functions with their projects and infrastructure.

The major benefit of early access programs is the user diversity. Our software is tested across a broad spectrum of cultures, hardware combinations, software requirements, and security restrictions. No other testing environment consolidates feedback about localization flaws, crashes with select hardware drivers, or mistaken runtime assumptions.

These (semi-)public manual testing strategies require dedicated personnel with product experience qualified in communications. This is much less a technological role than it is a mediatory role. Often, our software builds the base of the livelihood of our users. Perceived detrimental changes fuel anxiety and emotional responses.

## Executing Manual Tests

Strategies in user experience and accessibility steadily move from manual testing to automated testing. As security testing shifted left more and more, our terms evolved; for example, DevOps is now referred to as DevSecOps. Regardless of labels, we intend to shift all feasible product aspects left and introduce them to earlier testing stages.

[![Manual Test Execution](../../../assets/images/book/collaborating-within-a-codebase/testing/manual-testing-execution.webp)](../../../assets/images/book/collaborating-within-a-codebase/testing/manual-testing-execution.png)

Security Engineers and QA Engineers work in close cooperation with product owners, feature engineers, site reliability engineers, and the user base to evolve feature life-cycles and testing strategies.
