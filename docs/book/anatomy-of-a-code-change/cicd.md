# CI/CD

The acronym CI/CD refers to three continuous practices.

- Continuous Integration
- Continuous Deployment
- Continuous Delivery

It is a software development practice where developers integrate code frequently, and the system automatically builds, tests and deploys the code to production. This helps teams to detect and fix errors quickly, improve collaboration among developers and increase the speed of delivering new features to users.

> The terms **Continuous Deployment** and **Continuous Delivery** have been used interchangeably to such a degree that there's a probable chance our team uses these terms vice versa. I'm not partial to any order. In this text we *deploy* to test (stage) and *deliver* to production (client).

The goal of CI/CD is to reduce the time between writing code and releasing it to production, while ensuring that the code is of high quality and is not prone to errors. Tasks that require no thinking are better than by machines. People are incredibly bad at not thinking and repetition. It's frustrating work that reduces employment satisfaction.

If an organization has no continuous integration strategy in place, it typically is set up to merge all branching source code together on one day (known as *merge day*). The resulting work can be tedious, manual, and time-intensive and slow down release cadence significantly. The procedure to verify a stable version expands from hours to weeks or months as the volume of changes is rampant.

## Continuous Integration

Continuous Integration (CI) is as a software development practice where members of a team integrate their work frequently. Each integration is verified by automated builds and tests to detect integration errors as quickly as possible.

The fundamental goal of CI is to automatically catch problematic changes as early as possible by continuously assembling and testing complex and rapidly evolving ecosystems.

This offers verifiable and timely proof that the application is good to progress to the next stage. We don't need to just hope that all contributors are very careful, responsible and thorough; we can just guarantee the working state of our application at various points.

## Continuous Deployment

Continuous Deployment (CD) is an extension of continuous integration. After the code changes have been successfully integrated and the static analyses has passed we build the application and run automated integration tests.

As the CI tests changes to our source code, CD tests the changes to our compiled machine code. If all tests pass we can now be certain to have a functioning package of our application. These packages are now staged for testing. Typical deployment testing can consist of one or more of the following mechanisms:

- Internal manual testing through Quality Control Engineers.
- Automated end-to-end tests in a separate staging environment.
- Running the staged application and the current production application side-by-side with current production data.
- A beta program of power users that subscribe to so-called *nightly builds*

> Remember the **Change fail rate** of the motivational chapter?
> 
> We Expect our change rate to rise while working on our CD. As our company is transitioning to new workflows and tool-sets legacy code will have to be transitioned to work in a new environment. While other metrics may see immediate minor improvement the change rate may initially rise.

# Continuous Delivery

Continuous Delivery (CD) is an extension of continuous deployment. It describes the automation process of delivering the tried and tested package from a testing environment to production.

Improving our software delivery effectiveness will improve our ability to work in small batches and incorporate customer feedback more rapidly. This is especially effective if our client is a different department within the same organization as updates and feedback can be exchanged with a high degree of velocity.

Continuous delivery is not appropriate for all software projects. It requires a high level of automation and testing, as well as a robust rollback process in case of issues. It is generally most suitable for internal deliveries or projects with a high degree of stability and a low risk of breaking changes.

## Responsibility

With CI/CD engineers should be responsible for their individual integrations into the main branch. This has numerous advantages over having dedicated branch masters or build masters. A wide familiarity with our version control tool-set removes hard dependencies on specialized individuals. Instead of extinguishing petty fires and solving day-to-day problems these individuals are now free to build more sophisticated tooling and automate tedious processes.

Engineers integrating into main and verifying their changes work as intended minimizes downstream surprises. If the same person writes the source code, the tests, the documentation and is in charge of integrating the changes successfully, chances are pretty high that unexpected behavior is caught immediately.

Additionally, engineers who supervise their changes from commit to integration to subsequent release identified more strongly with the product they worked on and the organization they worked for. (TODO: insert reference)

Having the engineers be responsible for their individual integrations into the main branch has numerous advantages. A wide familiarity with our version control toolset removes hard dependencies on specialized individuals. Instead of extinguishing petty fires and solving day-to-day problems these individuals are now free to build more sophisticated tooling and automate tedious processes.

Engineers integrating into main and verifying their changes work as intended minimizes downstream surprises.

- Removes branch master or buildmaster

## Employee satisfaction

As mentioned, teams that do well with continuous delivery and tracking changes from commit to release identify more strongly with the product they worked on and the organization they worked for.

Before implementing CD, the engineers working at the Bing team at Microsoft reported a work/life balance satisfaction score of 38%. After implementing these technical practices, the scores jumped to 75%. The difference is striking. It means the technical staff were better able to manage professional duties during work hours and keep stress of work at work.

You build it, you own it. Increases transparency, feedback loops, learning for next feature. Less friction and turnover compared to "maintenance" engineers.

Teams that did well with faster lead times and frequent deployments experience reduced stress, seem to manage professional duties more easily during work hours, and report higher employee satisfaction. The developers of these teams also appeared to identify more strongly with the product they worked on and the organization they worked for.


## Shift Left

If people are working around rules, processes or systems because they get in the way that's no use.
Also make sure that once established, all members are following the processes or systems.
In order to maintain a blameless, learning-focused environment, teams values, culture and tools must match.

Different developers and different departments have different criteria on how to define successful implementation or collaboration. It is important that each team owns the end-to-end workflow to implement the respective criteria themselves. There is no DevOps department that solves problems for them. DevOps may initially help provide a setup and provide a number of services via a platform, but teams themselves implement and own their ci/cd pipeline.

What behaviours do we want to encourage among our employees?
How do people work around existing tools or workflows?
How can tools be used to encourage specific behaviour?

- Work in Small batches
- Computers perform repetitive tasks, people solve problems
- Everyone is responsible
- Configuraiton management


## Shift Left

If we consider our development in a chronological order from left to right, left being the conception of a product, right being the release of the final product, the amount of time needed to fix an error grows exponentially.

Shifting left refers to detecting problems in our project as early as possible and ideally minimize their impact on our project. A bug fixed on the developers machine during development is a lot cheaper than a bug fixed on a live deployment with multiple dependencies.

To quote (TODO: insert dude), shifting left is about "paying attention to the low fuel warning light on an automobile versus running out of gas on the highway".




