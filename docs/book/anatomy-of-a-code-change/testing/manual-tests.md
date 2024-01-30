# Manual tests

The feasibility of automated tests has its limits. Human usability aspects are best evaluated with human judgement.

## Qualitative

Explorative manual testing appraises the quality of output and interoperability our software generates and its significance and validity to the given context. Interdisciplinary product decisions regarding usability and user experience require vision, creativity, and domain experience.

We can automate supporting processes for manual testing, e.g. we can statically analyze if every image on a webpage has an alt text, but it becomes unpractical to analyze if the alt text accurately describes the image.

We can statically verify our system follows the guidelines defined within our design system. Aesthetic components such as the color, loaded fonts, spacing. It is difficult to automatically evaluate product characteristics such as transparency, clicks to purchase, consistent experiences throughout the product.

## Security

During security tests and <!-- vale alex.ProfanityMaybe = NO -->penetration<!-- vale alex.ProfanityMaybe = YES --> tests allies uncover and exploit vulnerabilities in our system before malicious entities take advantage of them. Domain experts stress the boundaries in systems, trying to effectively break our software. Broken states in our systems lead to flaws in our product, e.g. multiple shipments of a single order.

## Executing manual tests

Strategies in user experience and accessibility steadily move from manual testing to automated testing. As security testing shifted left more and more our terms evolved, DevOps is referred to DevSecOps.
Move Manual testing to automated testing

[![Manual Test Execution](../../../assets/images/book/anatomy-of-a-code-change/testing/manual-testing-execution.webp)](../../../assets/images/book/anatomy-of-a-code-change/testing/manual-testing-execution.png)

Security Engineers and QA Engineers work in close cooperation with product owners, feature engineers, site reliability engineers, and the user base to evolve feature life-cycles and testing strategies.
