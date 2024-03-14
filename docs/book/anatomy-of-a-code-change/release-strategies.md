  - Blue-green deployment
  - Canary releases


Generally reduce lead time.

If you have releases every week, it matters less if an engineer misses a deadline. The feature is shipped the week after.


Relying on the internet for our dependencies means that somebody else owns the availability and consistency of our builds.


### Artifacts

A release typically consists of multiple artifacts. These can be

- The executable binary
- The Docker image
- Kubernetes resource definitions
- Static Documentation
- Interactive Documentation as OpenAPI
- Changelists

### Changelists

It is a good idea to
Communicate to humans what changed

### Semantic Versioning

Dependencies are hard
Communicate to tools what changed
