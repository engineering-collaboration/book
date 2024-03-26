# Release Strategies

The nomenclature between the individual steps of delivering software varies across our industry. For the sake of this book we define the terms and the chronology as follows:

- **Release**: A release builds and packages our software via the Release Mechanisms discussed in the previous chapter. The entire release process arches across pre-release testing, deployment, and delivery.
- **Deployment**: We define deployment as a subprocess of the release proceedings. Once a release candidate passed our automated testing suite, we deploy it for manual testing or to a staging environment. After verifying the intended improvements and a ensuring a lack of regressions, we promote the deployment to a deliverable.
- **Delivery**: Clearing the deployment criteria, we launch our delivery automation system to distribute our built and tested artifacts. At the end of our delivery, our released changes have replaced the previous distributed implementation.

The above cycle completes a CI/CD automation system. For a continuous improvement culture we monitor and observe our deliveries in production and include actionable feedback for the next cycle. Critically, we avoid siloing our development teams from operations and monitoring. Our feature developers rely on production usage metrics to make good decisions.

Not all industries and software organizations follow the above distinction. Depending on deliverable scope, intended target audience, or distributed artifacts the steps above may be skipped, merged, altered, or extended. Using the above nomenclature as a baseline, we build a release pipeline modelled after our needs.

## Deployment strategies

  - Blue-green deployment
  - Tech streams
  - Alpha Beta releases

## Delivery strategies

As Netflix no longer delivers packaged DVDs to our mailbox, we have moved beyond the era of "down for maintenance". No dedicated release personnel handles physical leavers and switches to provide our update to the customers.

  - Canary releases
  - parallell run
  - rolling upgrades
  - feature toggles
  - zero-downtime


automation
feedback

how often
what time
demographic
geographic

Generally reduce lead time.

If you have releases every week, it matters less if an engineer misses a deadline. The feature is shipped the week after.


