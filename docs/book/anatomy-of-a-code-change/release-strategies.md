# Release Strategies

The nomenclature between the individual steps of delivering software varies across our industry. For the sake of this book we define the terms and the chronology as follows:

- **Release**: A release builds and packages our software via the Release Mechanisms discussed in the previous chapter. The entire release process arches across pre-release testing, deployment, and delivery.
- **Deployment**: We define deployment as a subprocess of the release proceedings. Once a release candidate passed our automated testing suite, we deploy it for manual testing or to a staging environment. After verifying the intended improvements and a ensuring a lack of regressions, we promote the deployment to a deliverable.
- **Delivery**: Clearing the deployment criteria, we launch our delivery automation system to distribute our built and tested artifacts. At the end of our delivery, our released changes have replaced the previous distributed implementation.

The above cycle completes a CI/CD automation system. For a continuous improvement culture we monitor and observe our deliveries in production and include actionable feedback for the next cycle. Critically, we avoid siloing our development teams from operations and monitoring. Our feature developers rely on production usage metrics to make good decisions.

Not all industries and software organizations follow the above distinction. Depending on deliverable scope, intended target audience, or distributed artifacts the steps above may be skipped, merged, altered, or extended. Using the above nomenclature as a baseline, we build a release pipeline modelled after our needs. The lack of cross-industry distinction complicates an evident structure for the chapter. Instead we share proven strategies for us to pick and choose for our product's validation and distribution.

## Validating preview builds

We validate our builds meticulously with automated testing, manual testing and internal deployments within our organization. Yet, the static nature of our test environment, test data, and test bias limits our aptitude to reflect our costumers realities. In order to deliver effectively, we gradually expose our changes to an increasing amount of users and minimize impact of faulty builds.

### Alpha versions

Our customers clarify our initial requirement analysis before we start working on solutions. During development we share exploratory product builds with our customers to verify the chosen direction of development. We refer to these builds as Alpha versions. Alpha distributions consist of the earliest self-service implementations of new changes, although a lack of concise documentation requires some hand-holding of feature sets.

They showcase the current design decisions and may not meet all requirements, but do not require complex setup procedures. The volume of support paired with the immediacy of feedback required motivates a reduced amount of participants. Alpha phases are a private affair with frequent communication.

### Beta versions

After our initial design and implementation, we share early access builds - titled beta versions. We widen the recipient user base with early adopters, who opted-in to our beta program. With growing maturity of the changes, we increase the availability of our beta releases.

A private beta scheme includes a limited amount of users to manage scale and feedback. Depending on the maturity of our product, the number varies from the hundreds to the thousands. Our private beta users appraise the changes for personal - and ultimately broader - appeal. Limiting the amount of participants reduces the overhead of communication and highlights common errors before testing at scale.
 
We promote our successful private beta program to a public one and invite more users and feedback. Public beta versions verify backwards compatibility, computing increased scale, and stability within a wider set of environments. With increasing complexity of production environments, our customers embed our public beta releases into their production systems to observe the behavior within their systems. Besides technological acceptance, our marketing team utilizes public betas for hyping releases and engaging the community.

Preferably, we distribute preview versions with adapted licensing and limited warranty. We consider public the beta phases as the last step before releasing a new set of changes to our product line.

### Tech streams

Certain organizations and products moved from the Alpha, Beta, Release process to trunk-based development stimulated tech streams. Organizations use the term to indicate continuous public deliveries of experimental builds - referred to by the release frequency as daily builds, nightly builds, or weekly builds, or biweekly builds. "Biweekly" referring to every two weeks. While non-deterministic, it sounds better than "every-two-week" builds.

We have the option of releasing preview builds via milestone versions, continuous experimental streams, or a hybrid version of the both approaches. To determine our initial strategy, we consider customer demands, regulatory compliance, patents and trademarks, maturity of CI/CD practices, and product release schedules, including marketing and partner contracts.

## Validating deployments and deliveries

Netflix no longer delivers packaged DVDs to our mailbox, we have moved beyond the era of "down for maintenance". No dedicated release personnel handles physical leavers and switches to provide our update to the customers.

Get the binaries to the location before starting transitions.

### Blue green deployment

We provide two identical environments for our software, one called blue and one called green. At any given time, one of the two deployments provides live traffic, while the other serves as a staging environment for our changes. The two infrastructures are virtually - and sometimes physically - separated. We tunnel traffic two both systems to verify the functionality of our changes before going live.

Traffic always runs through the live deployment and is duplicated to the staging environment. The infrastructure of both systems are as similar as possible. Serialized data moves unidirectionally from production to a read-only replica of our live database.

Once confident in our changes, we switch deployments. The staging environment becomes our live deployment and vice versa. Thus, we establish a double buffer for our production system.

Changes to database schemas are difficult, and long-running tasks must be resolved or transitioned to the new deployment. We ensure hermetic environments of our dependencies, as the entire system is deployed as a single unit.

### Parallel deployment

Contrary to blue-green deployment, parallel executions do not run in segregated environments, but next to the current service in production. The distinction is. Parallel runs simplify A/B tests when upgrading services.

Running successful deployments is another beast compared to handling live traffic in a produciton environment. We may never feel fully confident of changes until they run in production. To minimize the impact of a faulty delivery, we deliver changes gradually. 

### Canary Releases

Canary releases follow the titular practice of bringing canary birds into mine to check for breathable air. A dead canary signalled a rapid evacuation. When releasing with a canary methodology we prioritize a low-impact geographical region or low traffic time for an initial release of our changes.

Another decisive factor of selecting our canary region relates to the nature of the changes and how they interact with traffic. Over time we observe regions to retain individual traits. The volume of traffic, the latency of connections, the average bandwidth. The prominence of end-devices ranging from mobile, to tablets, to computers and the average generation of the hardware.

Canary regions can be seperated by input data and API use.

If we observe faulty behavior, we revert our deployment, fix the errors and repeat the process. Gradually we replace our global deployments with the changes, our highest impact region last.

### Rolling updates

Compared to canary releases, rolling updates split traffic horizontally, not vertically. We divert a low percentage of traffic to our new deployment to verify functionality. Over time the new release replaces all running instances of the previous production service.

Dependencies

Support across versions

### Feature toggles

When updating via feature toggles, we have already shipped the code to production. We remotely activate feature toggles of our service without touching the codebase.

Before coming in the precarious position of 

## Release processes

Establishing a routine for release procedures reduces surprises. We do not delay releases for tight deadlines. If we release every week, missing a deadline matters less. The feature is shipped a week after. Squeezing in updates at the last second introduces schlampigkeit.

We do not ship on Fridays or before holidays.

practice, practice, practice. Tryying to remember something in the heat of the moment is a recipe for disaster.

No binary is perfect.

Ship continously



automation
feedback

how often
what time
demographic
geographic

Generally reduce lead time.

If you have releases every week, it matters less if an engineer misses a deadline. The feature is shipped the week after.

### Development cycles and Long term support

Why not just delay the acceptance of release builds. Around the millenium an accepted workflow was to wait for a product to be publicly available for a year before updating in order to achieve the same benefits as a tech stream. This practice is a security nightmare. When vulnerabilities are detected, we patch and distribute these immediately (in both the tech stream and release stream). Our customers are able to safely update the release without the additional changes.

Across industries *tech streams* may instead also denote active development cycles between major releases.

This three to six month delay enables our users to verify the changes in various combinations of hardware, operating systems, drivers, locales, and interoperability between software products. Hence, tech streams provide our customers with a buffer and the ability to provide feedback and bug reports.
