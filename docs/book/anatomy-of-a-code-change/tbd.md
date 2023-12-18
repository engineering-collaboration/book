# Trunk based development

Trunk based development (TBD) is a source-control branching model, where developers collaborate on code in a single branch called ‘trunk’ *, resist any pressure to create other long-lived development branches by employing documented techniques.

TBD is a key enabler of Continuous Integration and by extension Continuous Delivery. When individuals on a team are committing their changes to the trunk on a regular basis it becomes easy to satisfy the core requirements of Continuous Integration. This approach promotes a culture of small, incremental changes which can help minimize conflicts and reduce the risk of errors being introduced into the codebase.

## TBD, GitHub Flow, Microsoft Release Flow

Published by the titular companies [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow) and [Microsoft Release Flow](https://devblogs.microsoft.com/devops/release-flow-how-we-do-branching-on-the-vsts-team/) are flavours of trunk-based-development.

Differentiating between these concepts is a purely academic exercise (or a good way of fueling engineering zeal). In essence, there are two variables that diverge to some degree between the two concepts:

1. Feature branch life time
2. Release mechanisms

In praxis, the tuning of these two variables is so team dependant and the overlap of the practices so magnificent that I feel comfortable calling the practices near identical. I will use the umbrella term TBD to refer to all practices in this book. It's up to you and your team to implement the most sensible approach for your organization.

### Feature branch life time

In TBD the idea is to integrate feature branches into the main branch often and in a timely manner. Ideally, feature branches exist for a couple hours up to a couple days. You will find these branches to organically map to ticket (sub)tasks.

### Release mechanisms

We will discuss these in detail in chapter 8. Release mechanisms define how you kick off the release procedure and how to deal with hotfixes of released versions.

## TBD Branches

Branches are a part of your everyday development process. When you want to add a new feature or fix a bug—no matter how big or how small—you spawn a new branch to encapsulate your changes. The larger the team is, the higher the integration frequency should be. Also eases burden of review as more people are available.

> The implementation behind Git branches is much more lightweight than other version control system models. Instead of copying files from directory to directory (P4V), Git stores a branch as a reference to a commit. In this sense, a branch represents the tip of a series of commits—it's not a container for commits. 

TBD differentiates between three types of branches.

### Trunk

Aka **main branch** aka **master branch**. The branch where **all** other branches diverge from and merge to.

### Development branches

Aka **feature branches**. Short-lived branches for working on features and bug fixes. **All** development branches are branched out of the latest commit of main. Upon completion of the work, the development branch is merged back into main and deleted after a successful integration. If your team uses a ticketing or task tracking system it is generally considered a good idea to reference the ticket in the branch name, e.g. REF-1234-fix-cad-currency.

During development it is advised to commit often and push these changes to the remote repository to avoid any loss of work due to hardware errors. On the branch the developer goes through the usual cycle of writing tests, writing code, running tests and committing frequently (commits can always be squashed later).

### Release branches (optional)

A branch dedicated to packaging and releasing a version of the product. While development branches are expected to merge back to trunk, a release branch is never merged and is expected to be abandoned eventually. We will talk about release branches in detail in chapter 8.

A release branch offers a certain flexibility for dealing with delivery and deployment, while not hindering Helix engineers at working on the next sprint on the main branch. Note that release branches are **never** merged back to master/main. Ideally, these branches are abandoned or marked as stale after a while. The head of the release branch is the currently published version.

## TBD Supporting Concepts

### Feature flags

Feature flags, also known as feature toggles, are a software development technique that allows developers to enable or disable specific features or parts of their application.

Feature flags can be implemented using configuration files, environment variables, or command line flags. They can be used to turn a feature on or off for a specific user, group of users, or for the entire application. This allows teams to test and refine new features without interference.

#### Guard work in progress

Features that take longer to develop than a couple hours or days should be partially integrated to `main` often to verify that individual parts of our feature compile and work in our program. These partial solutions should be unavailable to other processes and not exposed in the UI. You can use feature flags to prohibit the execution of a set of instructions guarded by the flag.

#### Rollout via feature flags

Feature flags can be used for devising strategies of releasing software features in a controlled and scalable manner. They allow developers to toggle the visibility and functionality of a feature in an application without having to deploy new code.

This allows teams to experiment with new features, gradually roll out changes to a subset of users, and quickly disable a feature if it has unexpected consequences. This helps to increase the speed and efficiency of software delivery, while also providing greater control and stability.

### Protected Branches

Protected branches prevent unapproved changed to be integrated into specific branches. Once a branch is protected, only specified users or roles - typically termed *Codeowners* - can make changes to it.

This helps to prevent accidental or unintended changes and promote collaboration and code review. This ensure that only approved changes are made to critical parts of a project.

Deciding if and which branches are protected is a team decision. This is a tool for avoiding *accidental* breaking changes or deployments by building hard dependencies to key personal into your development pipeline. Carefully consider the additional overhead,  redundancies, and overrides needed to maintain continous integration in this environment. You may not want to block the deployment of an urgent hotfix until a code owner has been made available to approve the changes.
