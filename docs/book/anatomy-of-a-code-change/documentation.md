---
title: Documentation
description: Proven strategies to reduce the burden of writing documentation while increasing quality.
---

# Documentation

Documentation is our trade's collective bane. Similar to testing, documentation historically ranked as an afterthought of the software development cycle. Dissimilar to testing, incorrect documentation does not break our build. Errors and oversights in documentation frustrate our users when it is needed, not before.

This chapter shares proven strategies to embed the process of documenting changes into our product cycle. Following these standards reduces the burden of writing documentation while increasing quality.

## Teaching Documentation

The act of learning programming (even when taught) is an inherently isolated task. We write, submit, and receive reviews of our code. We learn about algorithms and data structures. We invert binary trees and study time complexities of hash table implementations. These are necessary lessons and build the foundation of our future career.

However, when starting our journey into computer science, our peers and mentors seldom focus on documentation. We hear ominous warnings of undocumented code becoming unrecognizable to the author when revisiting a problem six months later. A warning slightly tempered by the fact that at the beginning of our journey, our code will not survive six months.

Thus, the responsibility of teaching documentation falls entirely to engineering companies. Within this avenue, we fill empty cups.

## Shifting Left on Documentation

Drifting and missing documentation inflict long-term damage to our organization. Through the mid-to-late 2010s, modern delivery frequencies and market competitiveness birthed prophylactic measures for documentary detriments.

Our most effective prevention is to plan for documentation in our work by creating tickets and reserving the time necessary for writing it. Actively shifting left on documentation mandates that we build automation tooling for its continuous integration and delivery.

### Documentation as Code

Organically, source code changes faster than its documentation. We call this documentation drift. Useful documentation evolves at the same pace as the source code it references. To ensure complementary development, we administer documentation within the same version control system as our code.

Ephemeral words stored on a separate platform endure a high likelihood of becoming out-of-sync with up-to-date work. This practice is, at best, an expensive time sink; at worst, actively misleading. Documentation stored within a VCS correlates to the state of our code at any point in time.

Sophisticated tools allow us to search code across our entire organization. We examine references of implementations and investigate how they changed over time via dedicated windows and keyboard shortcuts. We apply the same standards to our documentation. Informative documentation written in brilliant prose benefits our reader the same amount as the crumpled up doodles in our paper bin, if neither can be found. Our engineers will spend an hour understanding the implementation itself if they cannot find the documentation within minutes.

The foundational aspects of useful documentation cover findability and bidirectional correlation between documentation and product. Once we have satisfied these essentials, we consider strategies to improve our documents' quality and consistency. Managing documentation within version control allows us to extend our existing CI/CD processes to cover automation for documentation.

We work on documentation using the same strategies and tools we use for working on product features. Feature branches and pull requests for documentation offer a familiar environment for reviews and edits before integration. Documentation style guides necessitate the form and structure of documentations. Which words to use, which words to avoid, code style of examples. Static analysis and automated tests verify our documentation's compliance with our style guide.

!!! note
    Every pull request introducing a new chapter into this book runs [static analysis using `vale.sh`](https://github.com/opencollabbook/book/actions/workflows/pr.yaml) and an AI editor to review and highlight grammatical inconsistencies.

Extending our continuous delivery practices, we build and distribute documentation to our readers across all domains. Internally, our project managers appreciate automated progress updates within their project management tool with the PR description. Fellow engineers consume a reference documentation extracted from semantic components and comments of our source code.

To reduce the workload of high-quality documentation, our engineers write documentation in editing formats, such as Markdown, LaTeX, or AsciiDoc. During the build process, we generate the needed presentation formats, e.g., upload HTML pages to our documentation webpage, email PDF documents to our sales team.

### Documentation-Driven Development

Documentation drift arises due to the increased velocity of source code compared to documentation. The term *documentation-driven development* (DDD) evangelizes penning down production-quality documentation before implementing a solution. The purest form of DDD happens organically when [planning work using design documents](./planning-implementations.md).

Arguably, a temporal reshuffling of our task list does not *drive* development. If writing source code follows writing documentation, we expect automation to eliminate aspects of our work. In 2011, Swagger API, a schema-based approach, advocated automated API generation. Since then retitled OpenAPI, the standard allows us to write a definition file to automate boilerplate code. Once the OpenAPI schema is written, tooling can generate:

- Boilerplate server code of endpoints and payloads for supported languages
- Generic unit tests for our server code
- Client libraries for supported languages
- Static documentation for our API
- Interactive documentation for our API
- Test doubles and mock servers

An industry-wide motivation to consolidate open standards and the rapid inclusion of LLM tools in developer workflows promote future DDD practices and adoption. Let's see where this is going.

## Diátaxis Framework

During his time at Canonical, [*Daniele Procida*](https://vurt.eu/) polished his work on a technical documentation framework, [*Diátaxis*](https://diataxis.fr/). This systematic approach to technical documentation separates it into four styles: tutorials, how-to guides, explanations, and technical references.

The following image is taken straight from the Diátaxis website.

[![Diagram of the Diátaxis framework](https://diataxis.fr/_images/diataxis.png)](https://diataxis.fr/)

### Tutorials

When we find ourselves interested in a new subject, we get started by entering the topic plus the word "tutorial" into our favorite search engine. The result of our query introduces us to guided sessions and workshops. As we have no subject expertise as of yet, we gain contact, comfort, and confidence in the new practice by mimicking the presented material.

When creating a tutorial, we stay aware of the imbalance of expertise. Our lesson plan consists of a clear starting point and a practical goal our student can run when completed. We introduce them to the nomenclature of our documentation's subject. When progressing through the lesson, we provide frequent results to landmark the journey. A well-structured tutorial delivers transparent progress and reliable results.

Although didactically presented by a teacher, tutorials are not lectures. We stay away from explanations that are not directly applicable to the task at hand. An overload of information convolutes our students' path to an actionable result. As teachers, we are not able to determine what our students are going to learn, <!-- vale write-good.Weasel = NO -->only<!-- vale write-good.Weasel = YES --> to facilitate an environment of learning. Our student may pursue further knowledge later at their discretion and available cognitive load.

Our user explores our product with the help of tutorials and example procedures. Internally, we create tutorials for demo projects to evangelize new technology or tools we created.

More details available at [diataxis.fr/tutorials](https://diataxis.fr/tutorials/).

### How-To Guides

Exploring a subject matter using tutorials is a serendipity-driven affair. How-to guides are the opposite. Our users have a goal in mind and are looking for the instructions on how to achieve it. The task is set by the user, not by the teacher. We provide a logical sequence of actions documenting the minimal necessary steps for the task.

Topics of how-to guides establish themselves organically for our product. Guides about common pain points are the most-read documentation of our organization. How to install our product. How to connect to a specific authentication provider. How to build for a specific platform.

For example, we create a quickstart guide omitting all unnecessary information. Our onboarding experience flourishes when users try our project with the least amount of steps possible. For sophisticated systems, we explain how to migrate data from a third-party tool to our product.

Besides onboarding, well-presented how-to guides dramatically reduce frustrations for common errors. Our readers can identify errors and navigate our guides to fix them in stressful environments.

More details available at [diataxis.fr/how-to-guides](https://diataxis.fr/how-to-guides/).

### Technical References

The former types of documentation focus on the optimal experience for our user. We omit information for readability and guide our reader through the <!-- vale write-good.Weasel = NO -->immediately<!-- vale write-good.Weasel = YES --> applicable features of our product. Technical reference, however, is fact. The information provided describes measurable and observable behavior. Software reference documentation outlines the anatomy and usage of APIs, classes, and functions. Besides the source code, references are considered the definitive source of truth.

High-quality reference material distinguishes itself with consistency, standards, and searchability. When consulting our references, our user knows where to look and what format to expect. We do not deviate in layout or information within product references. A modern searchable technical reference with detailed descriptions of behavior, return values, edge cases, and interactive examples greases the wheels for our users' adoption.

More details available at [diataxis.fr/reference](https://diataxis.fr/reference/).

### Explanations

Another product-driven type of documentation is the explanation. Where technical references highlight facts of the current state of the software, explanations reason how we got to the current state. Reading explanations does not require an available instance of the product.

We discussed [decision docs and design docs](./planning-implementations.md) in a previous chapter, both are great examples of explanation documentation. Within these documents, we consider implementation strategies, potential alternatives, and technical concessions we had to make. Explanations put other types of documentation into context.

Publicly, well-written explanations and copywriting material inform our potential customers about the advantages of our software. Typical examples cover sincere product descriptions, frequently asked questions (FAQ), and factual competitor comparisons.

More details available at [diataxis.fr/explanation](https://diataxis.fr/explanation/).

## Who is our Reader?

As with everything in this book, we improve our documentation iteratively. We continuously consider our readers' needs and extend, adapt, move, or delete our workings accordingly.

Our readers' background drives the language we use. Their technical expertise determines our use of words and acronyms. Documentation for engineers may include the acronym *HTTP* without ever writing out the full term or explaining its capabilities. For other disciplines, we consider the relevance of technical information to the task our documentation is trying to achieve. Basics of networking might not be a requirement.

Beyond disciplines, demographics and culture influence the language and tone of what we write. Humor and interpersonal formality are subjective and region-influenced. Documentation within the same region might differ between organizational cultures. We consider cultural elements when writing and when reading documentation.

After considering the Diátaxis-axis and the language, we consider where to place our documentation. We place quickstarts for software into the README within the source code repository of our product. Further information on external platforms or wiki pages. Information needed for the usage of our software cannot be placed in environments that require other credentials.

## Documentation Media

When selecting the appropriate media for our documentation, we consider the following points:

- Who is consuming the documentation?
- What are we documenting?
- How much effort is it to create the docs?
- How much effort is it to maintain the docs?
- How searchable is the format?

(WIP)

### Text

Written text is the most widespread form of documentation. It is adaptable across devices and has a low footprint in terms of storage and bandwidth. Due to the nature of how we encode text digitally, information is natively searchable. Minor updates to our product require minor edits to our documentation. Modern tooling makes it trivial to compile written documentation from various sources, e.g., meetings, videos, schemas, dictations. Accessibility tooling converts words into audible sounds or tactile patterns.

High-quality written documentation requires a lot of effort to produce. Any written work demands multiple rewrites to iron out ambiguities and comprehensive guides with logical steps. Text-based documentation is ultimately limited by the writing abilities of the author combined with the resources allocated to work on it.

Modern tooling augments platform documentation with concise examples of client calls in various programming languages and the ability to call API endpoints in a sandbox environment without any setup.

### Images

Providing visual context makes documentation more digestible. A user understands if the tool works as intended or if they are encountering unexpected errors.

Screenshots of tools and processes require less effort than writing documentation. For reasons of searchability and accessibility, we tag images with keywords and alt-text for descriptions.

### Video

If a picture is worth a thousand words, a video is worth about thirty thousand per second. Quite the literary achievement. Besides a support session, a video is the most succour we can offer our user. Our viewer is privy to the entire context and continuously validates the state to the expected one of the video.

Creating a screen recording of a feature requires less effort of our engineers than a succinctly written documentation of equal value. The major downside of videos is that minor changes require a complete re-recording, as we cannot modify small portions as we could with text documents.

Videos require additional resources to be stored, streamed, and viewed. We expect our user to have headphones or be in a quiet environment. Video documentation benefits from semantic tagging of the content across the timeline. Video transcripts enhance searchability and accessibility.

### Embedded Documentation

This form of documentation targets other developers reading our source code. It is the most frequently read by our developers and most crucial to be up-to-date. Inline comments address context for opaque code fragments. Class and function comments provide insight into their usage.

!!! note
    We're not entering the religious space of naming conventions. Suffice it to say **consistent** naming and formatting reduce cognitive load when reading source code. We follow the languages' standard practice. We avoid any mention of `foo` and `bar`.

    A name is not a name in itself but rather the context it is used within.

    - In your opinion what does `orderDesc` mean in a food delivery app?
    - In your opinion what does `orderDesc` mean in a spreadsheet application?

<!-- vale alex.Ablist = NO -->
<!-- special characters -->
Naming conventions have derailed into a zealous battlefield of uppercases, lowercases, and special characters. Our organization focuses on enforcing *terming conventions*. Consistent definition and use of infrastructure terms (server, backend, service), asynchronicity terms (concurrency, thread, process), and release terms (commit, version, revision). Using consistent terms across the codebase assists in establishing context for the code block.
<!-- vale alex.Ablist = YES -->
