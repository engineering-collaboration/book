# Monitoring and Observability

Our organization's competitiveness depends on our ability to react quickly to market demands. To that point, we have covered practices for testing changes, validating preview builds, and delivering updates responsibly. To understand the current market demands and plan future changes to our software, we need a way to gather information of our services in production.

## Monitoring

The most crucial facts about our software describe its health. A system that is unusable - or worse, down - reduces revenue and user trust. We monitor our system by collecting data across sources. The most basic being the availability. Online services provide zPages to query HTTP endpoints that provides live data of the state of our system.

Our brand value decreases exponentially over the time our product is unresponsive. Crucial detriments to core systems require our immediate attention. When adverse metrics reach a pre-determined threshold our system sends out alerts to our staff. The on-call personnel prioritizes getting the production system back up-and-running. Fixing the error is less important than getting the production system back up-and-running.

As with tests, false positives or false negatives will depreciate the trust in the system. Other than tests, were alerts of failed tests happen at expected times during development in low-stakes environments, alerts indicate problems in production and can happen any time. If we're woken up at 3am for a severe alert that turns out to be a false positive, we'll be pretty upset. Alert fatigque, desensitation

Start with the minumum monitoring solution that has the greatest impact on costumers before moving to complex site reliability projects.

## Observability

Monitoring informs about the current state and actively warns us about occurring problems. Observability describes our ability to investigate system behavior. The complexity of observability increases with distributed architectures.

## Telemetry

Telemetry data provides context for our observability. 

opentelemetry

What gets measured gets managed

### Logs

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
