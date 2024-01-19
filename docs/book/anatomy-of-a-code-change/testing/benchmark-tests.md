# Benchmark tests

When releasing new versions of our software our acceptance criteria exceed operational functionality and stability. In order to avoid performance regression of any kind we run our changes through relevant benchmark tests (BT). As the word *benchmark* indicates, these tests check for discrete metrics for a certain facet of our software.

## Performance tests

Testing against performance identifies performance bottlenecks within our software, and, if done over time, helps us avoid introducing performance regressions with our changes. Performance is defined as any metric occurring during runtime we care about and decide to document.

For example, we identify issues related to memory leaks and resource management by running our software at full capacity for an extended amount of time. We measure the system's maximum load and user interactions by continuously incrementing the amount of concurrent calls until a processing error crops up. We measure acceptable loading time of a web page and response times for user interactions to ensure our system meets acceptable latency standards.

Additionally, we may measure performance increasing strategies of cache effectiveness, edge content delivery, lazy loading, deferred executions, or whatever else we identify as crucial for our use cases.

## Robustness tests

While performance tests evaluate our proficiency when everything goes well, robustness tests asses our capacity of dealing with failures ranging from minor to critical.

Spike Traffic
Scalability
Disaster Recovery

Stress Testing: Stress testing is aimed at evaluating how well a system performs under extreme conditions or beyond its expected maximum capacity. This helps identify the breaking point of the system and how it recovers from failures.

Scalability Testing: This type of testing measures the system's ability to scale up or down in terms of hardware, software, or network resources. It ensures that the system can handle increased load by adding more resources.

Acceptance Testing: Testing the software to ensure that it meets the acceptance criteria and satisfies the needs of the stakeholders.

## Accessability tests

## Executing BTs

Run performance tests regularly (every couple days overnight). The longer you go without running performance tests, the harder it can be to track down the culprit.