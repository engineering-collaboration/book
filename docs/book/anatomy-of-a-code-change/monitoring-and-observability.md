# Monitoring and Observability

Market competitiveness relies on two foundational aspects, understanding market demands, and being able to react on those with little delay. The majority of this book deals with the second topic. We covered the need for autonomous delivery practices for teams and applicable strategies of testing changes, validating preview builds, and delivering updates quickly yet responsibly.

The topic of understanding - or downright predicting - the current market demands combines empirical market research, heuristic feedback loops, and data-driven product decisions. Purely starting from a solid base of a secure, stable, and responsive application, may we start the prophetic process of building towards organizational growth.

Via monitoring and observability we gather information about our software in production. Implementing strategic monitoring and observability allows us to react to errors, analyze system performance, enhance our customer's journeys and evaluate feature acceptance. Armed with this information, we make meaningful decisions for our future development.

## Monitoring

Users, having lost trust in our offering once, are costly to reengage with our product. Our brand value decreases exponentially over the time our product is unresponsive. Hence, an unusable or unresponsive system reduces immediate and future revenue. To minimize downtime, we monitor our system health by collecting data across its sources. Crucial detriments to core systems require our immediate attention. 

Monitoring endpoints of online services converged into so-called *zPages*, popular ones being *Healthz*, *RPCz*, *Statsz*, *Tracez*. Querying live data enables us to collect information about the health of our software. The prevalence of zPages across the industry assists us to effectively monitor third party products within our systems.

Using these endpoints we gather runtime aspects, such as response time, CPU usage, and memory allocation. When these metrics reach a pre-determined adverse threshold, our system sends out alerts to our on-call personnel. In these kind of emergencies the sole priority is to get the production system back up-and-running. We have time to discovering and fix the error in relative piece after our organization stops hemorrhaging revenue.

False positives or false negatives depreciate the trust in our monitoring system posthaste as alerts in production may happen at any time. If we're woken up at 3 a.m. for a severe alert that turns out to be a false positive, we'll be pretty upset. A high volume of low-impact alerts lead to fatigue and desensitization. Desensitized on-call engineers are more <!-- vale write-good.Weasel = NO -->likely<!-- vale write-good.Weasel = YES --> to miss-prioritize high-impact alerts.

We continuously adjust our alert system to balance immediacy and volume.

## Observability

!!! quote
    *"What gets measured gets managed."*  
    - Peter Drucker

Our monitoring tools actively inform us about occurring problems in our software. Our observability tools enable to investigate our software's behavior during those problems. The foundation of observability is telemetry data and the relation between data sources. The complexities of observability have become a priority conversation within distributed architectures. The complexities of information aggregation across distributed sources have spawned a multitude of tools. 

Opposed to monitoring third party systems, observing these proves to be difficult. When observing systems we request data and knowledge of internal processes, which, if not provided by the original authors, are hard to come by. Our industry consolidated to a data standard called *OpenTelemetry*. The standard allows us to read and evaluate telemetry data across our proprietary tech and cross-vendor services. The three pillars of telemetry data consist of logs, metrics, and traces.

### Logs

Logs are a collection of information serialized as human readable text providing insight into the happenings of our software. Our developers print output when events happen or certain code procedures are called. Logs are typically either written to a file, or collected from `stdout` and `stderr`. Across distributed products we face challenges when aggregating logging information. We need tools to centralize logs across all machines or instances. Logs serialized solely to our customers machine proves useless to us when investigating errors.

We design logging schemas (or data models) to correlate metadata and context to our message output. An open source schema, called *OpenTelemetry*, has found favour across a broad spectrum of technical fields. For interoperability, OpenTelemetry logs in a standardized parsable format, typically json. A common meta field is the severity level of log entries, which indicates the gravity of the stored information. The *OpenTelemetry* data model defines the following events, ordered in ascending severity.

Level | Meaning
----- | -------
TRACE | A fine-grained debugging event. Typically <!-- vale alex.Ablist = NO -->disabled<!-- vale alex.Ablist = YES --> in default configurations.
DEBUG | A debugging event.
INFO  | An informational event. Indicates that an event happened.
WARN  | A warning event. Not an error but more important than an informational event.
ERROR | An error event. Something went wrong.
FATAL | A fatal error such as application or system crash.

Besides giving context, log levels allow us to disable messages below a certain threshold. Filtering logging output reduces the verbosity of our application and thus increases our runtime performance. Logging - while helpful for observability and debugging - brings a significant performance overhead with it.

When building and deploying for *Release*, we disable *DEBUG* logs per default. The necessity of printing application state and data for helpful debugging sessions is at odds with the discipline of security and confidentiality for production logs. Regardless of log level, we never print sensitive information.

To further decrease the performance needs of logging, we introduce log sampling. Our logging implementation collects repeated information over our sampling time leading to lower storage requirements and less performance overhead. The amount of storage needed for application logs escalates rapidly. The effort of sampling logs and eliminating duplicate entries becomes worthwhile in short time. We log retention length for different entries to store the smallest number needed. Legal compliance forces us to retain certain logs for either a minimum or maximum amount of time.

### Metrics

Using metrics, we investigate specific questions about our user's interaction with our product. In order to make business decisions we gather insight on our customers interactions with our offering. Metrics provide tangible information to validate releases. During the rollout release procedure we empirically verify feature acceptance by comparing relevant metrics before and after our deployment. Empirical user feedback sessions and A/B tests help us measure feature acceptance.

We record and evaluate behavioral patterns of our users to plan future changes. Insights to which features are used most and how our users navigate to them helps us make our application more accessible and cheaper to run. By recording traffic, we prepare additional resources for seasonal traffic spikes, and scale down (and save money) during low-traffic times.

Measuring and calculating user acquisition costs and customer retention rates allows us to make informed business decisions. Tracking marketing conversions and sign-ups helps us to make educated guesses on how to improve our customer journey and maximize sales, and keep customers. The backbone of our pricing policy and business plan is data-driven. Usage-based pricing models require detailed metrics per user to invoice our customers. We predict costs for perpetual licenses, flat-rates and subscription based models with continued support to calculate our pricing tiers.

Popular subscription-based storage providers offer a terabyte of data for USD 9.99 per month. An infeasible pricing, if our users actually made use of it. By gathering and calculating actual storage and egress usage of average users, we can calculate the optimal pricing of what users are willing to pay versus our risk assessment of losing money for every user.

### Traces

Using logs and metrics, we are observing discrete events, rather than a holistic process with end-to-end visibility. Tracking a complete event through various services within distributed systems is a non-trivial task. A distributed environment consisting of synchronous requests and event driven message buses obfuscates interdependent procedures.

An end-to-end trace is composed of spans. A span measures a manually defined unit of work and records the start time, end time, operation name, and passed metadata. Hence, we are able to break down the entire request into subprocesses to debug and identify bottle necks. Being able to understand the resources usage of child spans and tasks helps us improve performance.

Debugging the tree of spans helps identify performance bottlenecks, unexpected latencies, and points of failure by showing time spent and resource allocation for the recorded processes. Traces are often used in conjunction with logs and metrics to provide a comprehensive observability solution. While logs provide detailed event data and metrics offer aggregated performance statistics, traces connect these pieces of information to specific requests or transactions.

In client applications or monoliths, traces are mapped to performance benchmarking and debugging. A detailed event or frame breakdown informs the engineer about the amount of milliseconds spent on a particular code execution.

## Telemetry Correlation

We touched upon the non-triviality of aggregating logs and telemetry data. But even after consolidating all our globally occurring logs into a single source, we face the difficulty of correlating the outputs with each other. Traditionally, we correlate telemetry data across three factors.

The **time of execution** provides context when grouping and analyzing logs and errors. However, timestamps are an unreliable indicator of execution order. Two events occurring after one another on different machines may record inverse timestamps due to configuration drift and noise of the different environments.

We correlate observability data by an **execution context**. This allows us to correlate telemetry from different components of a distributed system that participated in the particular request execution. To achieve this we generate unique request identifiers for traffic passing our API gateway (most tools provide this out of the box). To establish execution order, we append a hop counter in the meta data that increments every time the context is passed on.

If our system utilizes tracing tools, we extend the execution context with a trace context to granularly aggregate logs. We replace our hop counter with the trace id and span id. To consolidate our spans to a shared trace, we propagate our execution context. 

The origin of the telemetry is also known as the **resource context**. We store information about the source of our data, the machine it is running on, the name and version of our software, the internal IP address, telemetry exporter library, the client IP address. Using these three correlations we are able to filter, query and analyze across a broad set of requirements.

### Beyond structured data

Within data gathering and evaluation two workflow concepts have established themselves, *extract-transform-load* (ETL) and *extract-load-transform* (ELT). The former cleans and organizes data before storing them in a database, the latter stores raw data and organizes it based on a later analytics query. ELT reduces the initial performance need, as we store data without any mandatory structuring process. The overhead happens when evaluating our stored data.

With data pipelines migrating from ETL workflows to ELT, our metrics gathering moves towards a big-data approach. Instead of designing specific questions and implementing predetermined metrics, we record and submit all events within our system to a data lake. Product owners collaborate with data analysts to answer product questions using already existing data. We believe the immediacy and flexibility of insights into user behavior offsets the additional overhead and costs of providing additional infrastructure and domain experts.

## Costs of Monitoring and Observability

Monitoring and observability is expensive across all dimensions, resources, burn rate, and personnel. We store additional data, handle additional traffic, and maintain more systems. The increased CPU load necessary to structure data, perform IO operations, and aggregate information demands horizontal or vertical scaling to fulfill the same amount of traffic. We need to understand and comply to data governance across political regions.

We start with the minimum monitoring solution that has the greatest impact on costumers and scale our observability with our product. Implementing an ELK stack in an early stage startup realistically doubles the cost of infrastructure. Not having effective site reliability is an expensive risk for established platforms. Global enterprises can wield data lakes and data analytics with competence and power. As with any business decision, we calculate our costs and benefits to decide the scale of our observability to investment in future growth and market competitiveness.
