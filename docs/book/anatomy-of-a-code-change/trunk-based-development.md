---
title: Trunk based development
description: Trunk based development (TBD) is a source-control branching model, where we frequently integrate code into a single main branch. By employing TBD techniques we resist any pressure to create other long-lived development branches.
---

# Trunk-Based Development

Trunk-Based Development (TBD) is a source-control branching model where we frequently integrate code into a single main branch. By employing TBD techniques we resist any pressure to create other long-lived development branches.

TBD centers around enabling Continuous Integration and, by extension Continuous Delivery. When committing our changes to the main branch on a regular basis, we establish a solid foundation to satisfy the core requirements of CI/CD. This approach promotes a culture of small, incremental changes, which can help minimize conflicts and reduce the risk of errors being introduced into the codebase.

## TBD, GitHub Flow, Microsoft Release Flow

Published by the titular companies [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) and [Microsoft Release Flow](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/) are flavors of TBD. Differentiating between these concepts is a purely academic exercise. Two variables diverge between the two concepts:

1. The **lifetime of our development branches** mapped to (sub)tasks of our assigned work, ranging from a couple of hours up to a couple of days.
2. The **release mechanisms** defined to kick off our release procedure and how we deal with hotfixes of live versions.

We tune these two variables to the most sensible approach for our team's needs. The practices overlap so magnificently that we feel comfortable calling them nearly identical. Within this book, we refer to all practices via the umbrella term TBD.

## TBD Branches

TBD differentiates between three types of branches.

1. The **main branch** where all other branches diverge from and merge to.
2. Short-lived **development branches** for working on changes.
3. Depending on our release strategy, optional long-lived **release branches** dedicated per release to package a version of the product.

### Development branches

For every change to our code base, we spawn a new development branch to encapsulate our work. **All** development branches source out of the latest commit of the main branch. During development, we commit often to the development branch and push changes to the remote repository to avoid any loss of work due to hardware errors.

Once completed, we merge the changes back into main and delete the development branch after successful integration. The larger the team is, the higher the integration frequency should be.

### Release branches (optional)

Release branches within the context of TBD do not refer to a single parallel branch that releases are merged into. A release branch is a reference to a commit within the main branch. We discuss release branches in detail in [Release Mechanisms]().

While development branches merge back into main, a release branch is never merged and is expected to be <!-- vale write-good.Weasel = NO -->eventually<!-- vale write-good.Weasel = YES --> abandoned and marked as stale.

## Feature flags

Feature flags are a software development technique that allows us to enable or disable specific parts of our application. They toggle software behavior on or off for all users, groups of users, or individual users. This allows our teams to test and refine new features without interference.

### Guard work in progress

Large features expand our ideal development branch lifetime of a couple of days. We break these tasks down into subtasks and integrate our partially done feature work into our main branch periodically. This practice minimizes the risks and review effort of single massive merge requests. Using feature flags, we guard the execution of a set of instructions and prohibit any propagation to exposed UIs or APIs.

<!-- vale Vale.Terms = NO -->
### Rollout via feature flags
<!-- vale Vale.Terms = YES -->

Feature flags enable us to devise strategies of releasing software features in a controlled and scalable manner by toggling the visibility and functionality of a feature without having to deploy new code to our application.

This allows our teams to experiment with new features, gradually roll out changes to a subset of users, and quickly disable a feature with unexpected consequences. Remotely toggling feature flags increases the speed and efficiency of our software delivery while also providing greater control and stability.

## Protected Branches

Protected branches prevent unapproved integrations by authorizing <!-- vale write-good.Weasel = NO -->only<!-- vale write-good.Weasel = YES --> specified users or roles, termed *code owners*, to apply changes. Limiting the authorized people fends off accidental or unintended commits until these have been reviewed and accepted before alterations are made to critical parts of a project.

Deciding if and which branches are protected is our team's decision. Protecting branches is a tool for avoiding *accidental* breaking changes or deployments NOT for building hard dependencies to key personnel into our development pipeline. Within teams, we offer the option to override the branch protection. Blocking the deployment of an urgent hotfix because of a code owner's vacation is suboptimal.
