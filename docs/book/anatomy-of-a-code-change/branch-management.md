
## GitHub Flow, Trunk-based development

In essence, there's two variables between the two concepts

1. Feature Branch life time
2. Release mechanism (Live-at-head vs tags vs dedicated branch per release)

Differentiating between these concepts is a purely academic exercise. Alternatively, it's a good way to fuel engineering zeal.

In the real world the tuning of these two variables is so team dependant and the overlap of the practices so magnificent that I feel comfortable calling the practices near identical and I will be refering to both practices as TBDGH while explaining the practices of both. It's up to us and our team to implement the most sensible approach for our organization.

## The two variables

# Feature branch longevity

In TBDGH the idea is to limit the life time of feature branches and integrate changes into the main branch often and in a timely manner. Ideally, these branches exist for a couple hours up to a couple days. As with everything, exceptions will occur. To fully embrace the upside of TBDGH, try and keep these exceptions to a minimum (couple times per year) and do not have our branch life beyond the duration of a sprint (2, 3 weeks).

## Feature flags

With TBDGH we aspire to integrate our changes often and in a timely manner, but what about features that take longer to develop than a couple hours or days? We still want to integrate partial source code often to verify that individual parts of our feature compile and work in our program. We do not want these partial solutions to be available to other processes or exposed in the UI.

In order to achieve this we can make use of the concept of feature flags. In essence a feature flag prohibits the execution of a set of instructions guarded by the flag. Real-world implementations for this can be as simple as reading an environment file or a  config file.

Check Google and stackoverflow for further implementation ideas of feature flags.

## Trunk based development

Helix' branch strategy is oriented around [**trunk based development**](https://trunkbaseddevelopment.com/). A source-control branching model, where developers collaborate on code in a single branch called 'trunk', 'main', or 'master' and **resist any pressure to create other long-lived branches**. We therefore avoid merge hell, do not break the build, and live happily ever after.

We create a short lived development branch for each JIRA ticket we tackle. Such branches allow developers to engage in eager and continuous code review of contributions before their code is integrated into the trunk.

![ubi-development-branch](../uploads/9f0e2a284766d93098d08eab12b78d6b/ubi-development-branch.png)