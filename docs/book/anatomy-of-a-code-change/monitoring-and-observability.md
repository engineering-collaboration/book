# Monitoring and Observability

Our organization's competitiveness depends on our ability to react quickly to market demands. To that point, we have covered practices for testing changes, validating preview builds, and delivering updates responsibly. To understand the current market demands and plan future changes to our software, we need a way to gather information of our services in production.

## Monitoring

The most crucial facts about our software describe its health. A system that is unusable - or worse, down - reduces revenue and user trust. We monitor our system by collecting data across sources. The most basic being the availability. Online services provide HTTP endpoints to query live data of the state of our system. These endpoints have been standardized to *zPages*. The prevalence of zPages and the low fidelity information of monitoring assists us to effectively monitor third party products within our systems.

Our brand value decreases exponentially over the time our product is unresponsive. Crucial detriments to core systems require our immediate attention. When adverse metrics reach a pre-determined threshold our system sends out alerts to our staff. The on-call personnel prioritizes getting the production system back up-and-running. Fixing the error is less important than getting the production system back up-and-running.

As with tests, false positives or false negatives will depreciate the trust in the system. Other than tests, were alerts of failed tests happen at expected times during development in low-stakes environments, alerts indicate problems in production and can happen any time. If we're woken up at 3am for a severe alert that turns out to be a false positive, we'll be pretty upset. Alert fatigque, desensitation

Start with the minumum monitoring solution that has the greatest impact on costumers before moving to complex site reliability projects.

## Observability

Monitoring informs about the current state and actively warns us about occurring problems. Observability describes our ability to investigate system behavior. The complexity of observability increases with distributed architectures.

The data source, aggregation, and content. Telemetry data provides context for our observability. We need to know what events happen 

Opposed to monitoring third party systems, observing these proves to be difficult. When observing systems we request data and knowledge of internal processes, which, if not provided by the original authors, are hard to come by. Our industry consolidated data and endpoints to a standard called *OpenTelemetry*, a merger of *OpenTracing* and *OpenCensus*. The standard allows us to read and evaluate telemetry data across our proprietary tech and cross-vendor services. The three pillars of telemetry data consist of logs, metrics, and traces.

What gets measured gets managed. vs big data

### Logs

Logs are a collection of information serialized as human readable text, that provide insight into the happenings of our software.

Logging data models offer metadata and context for the readable message output. *OpenTelemetry* supplies a standardized schema for a broad spectrum of shared fields. For product specific features we extend the schema with our necessary fields.

For interoperability, we print our logs in a standardized parsable format, typically json. For distributed services reading the logs directly from the providing source proves impossible. Log aggregation. request id and hop counter additional to time

Severity levels of log entries indicate the gravity of the stored information. The *OpenTelemetry* data model defines the following events, ordered in ascending severity.

Level | Meaning
----- | -------
TRACE | A fine-grained debugging event. Typically disabled in default configurations.
DEBUG | A debugging event.
INFO  | An informational event. Indicates that an event happened.
WARN  | A warning event. Not an error but is likely more important than an informational event.
ERROR | An error event. Something went wrong.
FATAL | A fatal error such as application or system crash.

Besides giving context, log levels allow us to disallow messages below a certain threshold. Filtering logging output reduces the verbosity of our application and thus increases our runtime performance. Logging - while helpful for observability and debugging - brings a significant performance overhead with it.

When building and deploying for *Release*, we disable *DEBUG* logs per default. The necessity of printing application state and data for helpful debugging sessions is at odds with the discipline of security and confidentiality for production logs. Regardless of log level, we never print sensitive information.

To further decrease performance needs of logging, we introduce log sampling. Our logging implementation collects repeated information over our sampling time. Lower storage, less performance overhead. We report the number of repetitions.

The amount of storage needed for application logs escalates rapidly. The effort of sampling logs and eliminating duplicate entries becomes worthwhile in short time. We log retention length for different entries to store the smallest number needed. Legal compliance forces us to retain certain logs for either a minimum or maximum amount of time.

### Metrics

data driven product decisions
measuring traffic
usage based pricings

### Traces

measuring performance spans etc
