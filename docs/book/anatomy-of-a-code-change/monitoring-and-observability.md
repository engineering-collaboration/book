# Monitoring and Observability

Our organization's competitiveness depends on our ability to react quickly to market demands. To that point, we have covered practices for testing changes, validating preview builds, and delivering updates responsibly. To understand the current market demands and plan future changes to our software, we need a way to gather information of our services in production.

## Monitoring

The most crucial facts about our software describe its health. A system that is unusable - or worse, down - reduces revenue and user trust. We monitor our system by collecting data across sources. The most basic being the availability. Online services provide HTTP endpoints to query live data of the state of our system. These endpoints have been standardized to *zPages*. The prevalence of zPages and the low fidelity information of monitoring assists us to effectively monitor third party products within our systems.

Our brand value decreases exponentially over the time our product is unresponsive. Crucial detriments to core systems require our immediate attention. When adverse metrics reach a pre-determined threshold our system sends out alerts to our staff. The on-call personnel prioritizes getting the production system back up-and-running. Fixing the error is less important than getting the production system back up-and-running.

As with tests, false positives or false negatives will depreciate the trust in the system. Other than tests, were alerts of failed tests happen at expected times during development in low-stakes environments, alerts indicate problems in production and can happen any time. If we're woken up at 3am for a severe alert that turns out to be a false positive, we'll be pretty upset. Alert fatigque, desensitation

Start with the minumum monitoring solution that has the greatest impact on costumers before moving to complex site reliability projects.

## Observability

Monitoring informs about the current state and actively warns us about occurring problems. Observability describes our ability to investigate system behavior. The complexity of observability increases with distributed architectures.

The data source, aggregation, and content. Telemetry data provides context for our observability.

Opposed to monitoring third party systems, observing these proves to be difficult. When observing systems we request data and knowledge of internal processes, which, if not provided by the original authors, are hard to come by. Our industry consolidated data and endpoints to a standard called *OpenTelemetry*, a merger of *OpenTracing* and *OpenCensus*. The standard allows us to read and evaluate telemetry data across our proprietary tech and cross-vendor services. The three pillars of telemetry data consist of logs, metrics, and traces.

What gets measured gets managed.

### Logs

Human readable textual information. Machine metadata, supplied by Otel schema and loggers. Parsable format.

log levels
log retention
sensitive data
logging performance and sampling
error logs
info logs
log aggregation between services
request id and hop counter additional to time

### Metrics

data driven product decisions
measuring traffic
usage based pricings

### Traces

measuring performance spans etc
