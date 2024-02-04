# Contributing

A big welcome and thank you for considering contributing to **OpenCollaboration** ❤️

Reading and following these guidelines will help us make the contribution process easy and effective for everyone involved. It also communicates that we agree to respect the time of the contributors managing and developing this open-source project.

- [Contributing](#contributing)
  - [Getting Started](#getting-started)
  - [Prose](#prose)
  - [Linting](#linting)
  - [Pull Request](#pull-request)
  - [Code of Conduct](#code-of-conduct)

## Getting Started

Contributions are made to this repo via Issues and Pull Requests (PRs). If we have never contributed before, [the first timer's guide on the *auth0* blog](https://auth0.com/blog/a-first-timers-guide-to-an-open-source-project/) showcases tips on how to get started. A few general guidelines:

- We create Issues for chapter drafts, major edits, and distribution changes before starting any work.
- No Issues are needed for proofreading tasks and minor edits. Feedback is handled in PRs.
- We search for existing Issues and PRs before creating our own.

We work hard to ensure issues are handled in a timely manner, but a friendly ping in the comment thread as a reminder is welcome.

## Prose

The contents of this book follow four basic editorial rules for prose which are enforced with our linting tools.

- The book addresses readers exclusively in the plural first-person form, *we*. We do not use *I* or *you*.
- We write with certainty. *Trunk based development can support CI/CD* becomes *Trunk based development supports CI/CD*.
- We avoid weasel words and unnecessary filler words.
- When feasible, we prefer English Prime. We avoid all forms of the verb *to be*.

## Linting

We verify our prose using [vale.sh](), an open-source, command-line tool for editorial style guides. Download and install the tool via [the installation instructions](https://vale.sh/docs/vale-cli/installation/).

This repository contains two MkDocs configurations. `mkdocs.yaml` for local development and `mkdocs-dist.yaml` for building and distributing the published site. The configurations differ mainly in the navigation section.

The bash script located at `ci/vale.bash` parses `mkdocs-dist.yaml` and analysis only the chapters to be published. This eliminates noise for work in progress notes when linting our prose using the following command.

```sh
bash ci/vale.bash
```

PRs will only be integrated with zero errors, warnings, or suggestions.

> When polishing our chapter we comment the line `write-good.E-Prime = NO` in `.vale.ini`. While english prime is too confining of a requirement for integration testing, it does highlight potential writing improvements.

## Pull Request

To successfully integrate our changes into the main branch, we follow some basic rules.

- For major edits, drafts, and meta changes we open an Issue to discuss our proposal first.
- We limit the changes to the topic in question.
- We label our PR accordingly
- We retain a linear commit history. We rebase locally on latest main and force push our development branch, then merge using the *Squash and merge* option.

Non-maintainers follow the ["fork-and-pull" Git workflow](https://github.com/susam/gitpr).

1. Fork the repository to your own Github account
2. Clone the project to your machine
3. Create a branch locally with a succinct but descriptive name
4. Commit changes to the branch
5. Following any formatting and testing guidelines specific to this repo
6. Push changes to your fork
7. Open a PR in our repository and follow the PR template so that we can efficiently review the changes.

## Code of Conduct

We take our open-source community seriously and hold ourselves and other contributors to high standards of communication. By participating and contributing to this project, you agree to uphold our [Code of Conduct](CODE-OF-CONDUCT.md).
