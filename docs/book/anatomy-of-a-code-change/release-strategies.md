# Release Strategies

The nomenclature between the individual steps of delivering software varies across our industry. For the sake of this book, we define the terms and the chronology as follows:

- **Release**: A release builds and packages our software via the Release Mechanisms discussed in the previous chapter. The entire release process spans pre-release testing, deployment, and delivery.
- **Deployment**: We define deployment as a subprocess of the release proceedings. Once a release candidate passes our automated testing suite, we deploy it for manual testing or to a staging environment. After verifying the intended improvements and ensuring a lack of regressions, we promote the deployment to a deliverable.
- **Delivery**: Clearing the deployment criteria, we launch our delivery automation system to distribute our built and tested artifacts. At the end of our delivery, our released changes have replaced the previous distributed implementation.

The above cycle completes a CI/CD automation system. For a continuous improvement culture, we monitor and observe our deliveries in production and include actionable feedback for the next cycle. Critically, we avoid isolating our development teams from operations and monitoring. Our feature developers rely on production usage metrics to make good decisions.

Not all industries and software organizations follow the above distinction. Depending on deliverable scope, intended target audience, or distributed artifacts, the steps above may be skipped, merged, altered, or extended. Using the above nomenclature as a baseline, we build a release pipeline modeled after our needs. The lack of cross-industry distinction complicates an evident structure for the chapter. Instead, we share proven strategies for us to pick and choose for our product's validation and distribution.

## Validating preview builds

We validate our builds meticulously with automated testing, manual testing, and internal deployments within our organization. Yet, the static nature of our test environment, test data, and test bias limit our aptitude to reflect our customers' realities. In order to deliver effectively, we gradually expose our changes to an increasing number of users and minimize the impact of faulty builds.

### Alpha versions

Our customers clarify our initial requirement analysis before we start working on solutions. During development, we share exploratory product builds with our customers to verify the chosen direction of development. We refer to these builds as Alpha versions. Alpha distributions consist of the earliest self-service implementations of new changes, although a lack of concise documentation requires some hand-holding of feature sets.

They showcase the current design decisions and may not meet all requirements but do not require complex setup procedures. The volume of support paired with the immediacy of feedback required motivates a reduced number of participants. Alpha phases are a private affair with frequent communication.

### Beta versions

After our initial design and implementation, we share early access builds - titled beta versions. We widen the recipient user base with early adopters, who opted into our beta program. With the growing maturity of the changes, we increase the availability of our beta releases.

A private beta scheme includes a limited number of users to manage scale and feedback. Depending on the maturity of our product, the number varies from the hundreds to the thousands. Our private beta users appraise the changes for personal - and ultimately broader - appeal. Limiting the number of participants reduces the overhead of communication and highlights common errors before testing at scale.

We promote our successful private beta program to a public one and invite more users and feedback. Public beta versions verify backwards compatibility, computing increased scale, and stability within a wider set of environments. With the increasing complexity of production environments, our customers embed our public beta releases into their production systems to observe the behavior within their systems. Besides technological acceptance, our marketing team utilizes public betas for hyping releases and engaging the community.

Preferably, we distribute preview versions with adapted licensing and limited warranty. We consider the public beta phases as the last step before releasing a new set of changes to our product line.

### Tech streams

Certain organizations and products moved from the Alpha, Beta, Release process to trunk-based development stimulated tech streams. Organizations use the term to indicate continuous public deliveries of experimental builds - referred to by the release frequency as daily builds, nightly builds, or <!-- vale write-good.Weasel = NO -->weekly<!-- vale write-good.Weasel = YES --> builds, or biweekly builds. "Biweekly" referring to every two weeks. While non-deterministic, it sounds better than "every-two-week" builds.

We have the option of releasing preview builds via milestone versions, continuous experimental streams, or a hybrid version of both approaches. To determine our initial strategy, we consider customer demands, regulatory compliance, patents and trademarks, maturity of CI/CD practices, and product release schedules, including marketing and partner contracts.

Preview builds allow our users to verify the changes and various combinations of hardware, operating systems, drivers, locales, and interoperability between software products. Hence, they provide our customers with a buffer and the ability to provide feedback and bug reports.

## Validating deployments and deliveries

Netflix no longer delivers packaged DVDs to our mailbox; we have moved beyond the era of "down for maintenance". No dedicated release personnel handles physical deliveries and switches to provide our update to the customers.

Get the binaries to the location before starting transitions.

### Blue-green deployment

We establish two identical environments for our software, one called blue and one called green. At any given time, one of the two deployments provides live traffic, while the other serves as a staging environment for our changes. The two infrastructures are virtually - and sometimes physically - separated. We tunnel traffic to both systems to verify the functionality of our changes.

Live traffic always runs through the live deployment and is duplicated to the staging environment with no external outcome. Serialized data moves unidirectionally from production to a <!-- vale write-good.Weasel = NO -->read-only<!-- vale write-good.Weasel = YES --> replica of our live database. Once confident in our changes, we swap the exposed system. The staging environment becomes our live deployment and vice versa. Thus, we establish a double buffer for our production system.

Both environments are running constantly, and all services and dependencies are deployed when activating the live system. We avoid warm-up phases during system updates. The entire system is deployed as a single unit. With blue-green deployments, we face challenges to verify changes that include modifications to database schemas. Plus, when switching our live deployment, we resolve long-running tasks or transition them to the new deployment.

### Parallel deployment

Contrary to blue-green deployment, parallel deployments do not run in segregated environments. As the name suggests, we deploy our changes directly into production alongside the current live version. We route traffic to both versions to verify our changes.

Parallel deployments facilitate reliable A/B tests, as we are running our services on identical traffic. We limit our services to read-<!-- vale write-good.Weasel = NO -->only<!-- vale write-good.Weasel = YES --> access to production data or provide separate database nodes for every parallel execution we are running.

The strategy provides actionable insights for changes to code or systemic strategies. We measure performance and scaling benefits of differing infrastructure, caching strategies, database types and architecture, and system design.

### Canary Releases

We mitigate the risk of faulty deliveries and minimize the impact of errors by delivering changes to production gradually. The term *Canary releases* originates from a coal mining practice of detecting carbon monoxide via canary birds. The tiny birds perish from the gases before affecting the miners. A dead bird signaled immediate evacuation.

When releasing with a canary methodology, we prioritize a low-impact demographic region for an initial release of our changes. We filter our demography by the chances we are deploying. We gather metrics through telemetry of our live production and over time we match regions to specific traits. Decisive factors of selecting a canary region include:

- Geographic location
- Volume of traffic
- Latency of connections
- Average bandwidth
- Prominence of end-devices ranging from mobile, to tablets, to computers and the average generation of the hardware
- Input data and API use
- Political climate and regulatory compliance

After defining the traits, we deploy our changes to the low-impact area. Should our deployment work as expected, we gradually expand the perimeters of our release. If we observe faulty behavior, we revert our deployment, fix the errors, and repeat the process. <!-- vale write-good.Weasel = NO -->Eventually<!-- vale write-good.Weasel = YES -->, we replace our global deployments with the changes, our highest impact region last.

### Rolling updates

Canary releases introduce new changes vertically across demographics. Rolling updates divert a percentage of traffic to our new deployment horizontally to verify our functionality. While conceptually similar to parallel deployments, we do not duplicate traffic. Both versions are running in production and handle user traffic individually.

We gradually increase the percentage of traffic diverted to the updated service. Over time, our new release handles a hundred percent of the traffic and replaces all running instances of the previous production service.

Rolling updates work well for self-contained changes in containerized environments. When shipping updates, we steadily spin up the new containers and shut down the running containers. Large scale changes, or inter-service dependencies complicate this procedure. As we cannot control all traffic flow, our system needs to be able to support both versions of our software for the transition period.

When faced with the challenge of deploying large scale changes, we prefer canary releases with deterministic infrastructure over mixing multiple versions into our system.

### Feature toggles

With the discussed strategies, we activate new changes as soon as the binary artifacts are available. Updates to behavior - and rollbacks - replace the live artifacts. An alternative is rolling out updates using feature toggles. We ship our binaries with the changes initially deactivated.

Our changes are physically present at the destination albeit without executing the changes. Once ready, we remotely activate the new features without replacing the distributed binaries. The strategy enables us to synchronize feature releases or deactivate faulty features without any downtime.

If we deliver features to clients' machines via feature toggles, we face the risk of users discovering or reverse-engineering our changes before our organization is ready to activate them.

## Release processes

Routines and automation reduce anxiety during our release procedure. As with all topics in this book, we aim to continuously improve our release practices; and practice makes perfect. Relying on manual interventions during the heat of the moment ultimately backfires. Hence, we verify and improve our automation tooling after every incident and rehearse our responses periodically.

Just as routines for release procedures reduce surprises, we do not force tight deadlines into releases. When we increase the frequency of releases, missing a deadline matters less. The book *Software Engineering at Google* succinctly states that *No binary is perfect*, and conventional wisdom states that *Perfect is the enemy of done*.

We avoid short notice slapdashery by not shipping last-second changes. We avoid dealing with long-period slapdashery by not releasing updates before planned downtime. Unless contractually obligated, we do not ship on Fridays or before holidays.

The ability to confidently release at any time and deal with the responses enables us to model a delivery strategy around our product and organization. We ship major updates according to the plans of our product and marketing team. We patch vulnerabilities when our security team detects or suspects exposures.
