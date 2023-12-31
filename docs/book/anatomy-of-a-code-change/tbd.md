# Trunk based development

Trunk based development (TBD) is a source-control branching model, where we frequently integrate code into a single main branch. By employing TBD techniques we resist any pressure to create other long-lived development branches.

TBD centers around enabling Continuous Integration and by extension Continuous Delivery. When committing our changes to the main branch on a regular basis, we establish a solid foundation to satisfy the core requirements of CI/CD. This approach promotes a culture of small, incremental changes which can help minimize conflicts and reduce the risk of errors being introduced into the codebase.

## TBD, GitHub Flow, Microsoft Release Flow

Published by the titular companies [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) and [Microsoft Release Flow](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/) are flavours of TBD Differentiating between these concepts is a purely academic exercise. Two variables diverge between the two concepts:

1. The **life time of our development branches** mapped to (sub)tasks of our assigned work, ranging from a couple hours up to a couple days.
2. The **release mechanisms** defined to kick off our release procedure and how we deal with hotfixes of live versions.

We tune these two variables to the most sensible approach for our teams needs. The practices overlap so magnificently that we feel comfortable calling them near identical. Within this book we refer to all practices via the umbrella term TBD.

## TBD Branches

TBD differentiates between three types of branches.

1. The **main branch** where all other branches diverge from and merge to.
2. Short-lived **development branches** for working on changes.
3. Depending on our release strategy, optional long-lived **release branches** dedicated to per release to packaging a version of the product.

### Development branches

For every change to our code base we spawn a new development branch to encapsulate our work. **All** development branches source out of the latest commit of the main branch. During development we commit often to the development branch and push changes to the remote repository to avoid any loss of work due to hardware errors.

Once completed, we merge the changes back into main and delete the development branch after the successful integration. The larger the team is, the higher the integration frequency should be.

### Release branches (optional)

A branch dedicated to packaging and releasing a version of the product. While development branches are expected to merge back to trunk, a release branch is never merged and is expected to be abandoned eventually. We will talk about release branches in detail in chapter 8.

A release branch offers a certain flexibility for dealing with delivery and deployment, while not hindering Helix engineers at working on the next sprint on the main branch. Note that release branches are **never** merged back to master/main. Ideally, these branches are abandoned or marked as stale after a while. The head of the release branch is the currently published version.

## Feature flags

Feature flags, also known as feature toggles, are a software development technique that allows developers to enable or disable specific features or parts of their application.

Feature flags can be implemented using configuration files, environment variables, or command line flags. They can be used to turn a feature on or off for a specific user, group of users, or for the entire application. This allows teams to test and refine new features without interference.

### Guard work in progress

Features that take longer to develop than a couple hours or days should be partially integrated to `main` often to verify that individual parts of our feature compile and work in our program. These partial solutions should be unavailable to other processes and not exposed in the UI. You can use feature flags to prohibit the execution of a set of instructions guarded by the flag.

### Rollout via feature flags

Feature flags can be used for devising strategies of releasing software features in a controlled and scalable manner. They allow developers to toggle the visibility and functionality of a feature in an application without having to deploy new code.

This allows teams to experiment with new features, gradually roll out changes to a subset of users, and quickly disable a feature if it has unexpected consequences. This helps to increase the speed and efficiency of software delivery, while also providing greater control and stability.

## Protected Branches

Protected branches prevent unapproved changed to be integrated into specific branches. Once a branch is protected, only specified users or roles - typically termed *Codeowners* - can make changes to it.

This helps to prevent accidental or unintended changes and promote collaboration and code review. This ensure that only approved changes are made to critical parts of a project.

Deciding if and which branches are protected is a team decision. This is a tool for avoiding *accidental* breaking changes or deployments by building hard dependencies to key personal into your development pipeline. Carefully consider the additional overhead,  redundancies, and overrides needed to maintain continous integration in this environment. You may not want to block the deployment of an urgent hotfix until a code owner has been made available to approve the changes.
