---
title: The anatomy of a code change
description: The anatomy of a code change covers the day-to-day processes for streamlining technical product development. It focuses on a solid foundation of CI/CD which can be extended by our organization. Utilizing automation we can reduce cognitive load and ensure consistent deliveries of our product.
---

# The anatomy of a code change

!!! note
    Part 3 of the book is being polished. *The anatomy of a code change* will be released on a chapter basis. Consult the task list below for an overview of the chapters in this part.

Part three of this book covers the day-to-day processes for streamlining technical product development. It focuses on a solid foundation of CI/CD which can be extended by our organization. Utilizing automation we can <!-- vale write-good.Weasel = NO -->significantly<!-- vale write-good.Weasel = YES --> reduce cognitive load and ensure consistent deliveries of our product.

The practices covered in this part may be extended beyond our engineering departments. Our mantra is to do less, but inversely do the hard work to make things <!-- vale alex.Condescending = NO -->simple<!-- vale alex.Condescending = YES -->.

The current progress of this section:

- [x] CICD
- [x] Trunk based development
- [x] Planning implementations
- [x] Commits
- [x] Pull requests
- [x] Static analysis
- [x] Code reviews
- [ ] Merging
- [x] Testing
- [ ] Release mechanisms
- [ ] Documentation
- [ ] Artifact management
- [ ] Release strategies
- [ ] Repository strategies
- [ ] Infrastructure as code
- [ ] Monitoring and observability

## Version Control

This section of the book assumes we are knowledgeable and comfortable with version control. 

Everything should be under version control. No aspect of our organization does not benefit from tracking changes over time, be it source code, infrastructure definitions, documentation, or resource manifests.

The practices covered in this part of the book are achievable with any version control tooling. However, due to the large adoption of Git across the industry the concepts will be explained using Git terminology and visual representations of Git repositories.
