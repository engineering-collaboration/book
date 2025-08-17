---
title: Collaborating within a Codebase
description: Collaborating within a Codebase covers the day-to-day processes for streamlining technical product development. It focuses on a solid foundation of CI/CD which can be extended by our organization. Utilizing automation we can reduce cognitive load and ensure consistent deliveries of our product.
---

# Collaborating within a Codebase

Part two of this book covers the day-to-day processes for streamlining technical product development. It focuses on a solid foundation of CI/CD which can be extended by our organization. Utilizing automation we can <!-- vale write-good.Weasel = NO -->significantly<!-- vale write-good.Weasel = YES --> reduce cognitive load and ensure consistent deliveries of our product.

The practices covered in this part may be extended beyond our engineering departments. Our mantra is to do less, but inversely do the hard work to make things simple.

!!! note "Rewrite progress"

    The book includes a rough draft of the chapters I want to cover. However, these mostly consist of notes and currently do not offer a coherent reading experience. I am in the process of rewriting and editing the book for an initial release version. The following chapters are in a somewhat decent shape:

    - [ ] CI/CD
    - [ ] Trunk Based Development
    - [ ] Planning Implementations
    - [ ] Commits
    - [ ] Pull Requests
    - [ ] Static Analysis
    - [ ] Code Reviews
    - [ ] Merging
    - [ ] Testing
    - [ ] Release Mechanisms
    - [ ] Artifact Management
    - [ ] Release Strategies
    - [ ] Documentation
    - [ ] Repository Strategies
    - [ ] Monitoring and Observability

## Version Control

This section of the book assumes we are knowledgeable and comfortable with version control. 

Everything should be under version control. No aspect of our organization does not benefit from tracking changes over time, be it source code, infrastructure definitions, documentation, or resource manifests.

The practices covered in this part of the book are achievable with any version control tooling. However, due to the large adoption of Git across the industry the concepts will be explained using Git terminology and visual representations of Git repositories.

<!-- TODO: (Daniel) Automatic workspace configuration -->
