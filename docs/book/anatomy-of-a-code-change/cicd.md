# CI/CD

The acronym CI/CD refers to three continuous practices.

- Continuous Integration
- Continuous Deployment
- Continuous Delivery

The process describes a software development practice where developers integrate code frequently, and the system automatically builds, tests and deploys the code to production. The discipline combined with automation practices support teams to detect and fix errors quickly and increase the speed of delivering new features to users while ensuring that the code is of high quality and resistant to errors.

The biggest asset our employees bring to the company is the experience and skill of solving domain problems creatively. CI/CD shifts the responsibility of mindless repetitive tasks to computers, freeing up our teams to do their best work. 

!!! note
    The terms **Continuous Deployment** and **Continuous Delivery** have been used interchangeably to such a degree that there's a probable chance our team uses these terms vice versa. We are not partial to any order. In this book we *deploy* to test (stage) and *deliver* to production (client).

If an organization has no continuous integration strategy in place, it typically is set up to merge all branching source code together on one day, known as *merge day*. The resulting work is tedious, manual, and time-intensive. Verifying a stable version this way slows down release cadence from hours to weeks with the high volume of changes. CI/CD with collaborative project management splits work into small batches, minimizing integration work.

## Continuous Integration

Continuous Integration (CI) is a software development practice where members of a team integrate their work frequently to the shared source code. Each integration is verified by automated builds and tests to detect integration errors as quickly as possible. The fundamental goal of CI is to automatically catch problematic changes as <!-- vale write-good.Weasel = NO -->early<!-- vale write-good.Weasel = YES --> as possible by continuously assembling and testing complex and rapidly evolving ecosystems.

This offers verifiable and <!-- vale write-good.Weasel = NO -->timely<!-- vale write-good.Weasel = YES --> proof that the application is good to progress to the next stage. We don't need to hope that all contributors are careful, responsible and thorough; we can just guarantee the working state of our application at various points in time.

## Continuous Deployment

Continuous Deployment (CD) is an extension of continuous integration. After the static analyses has passed and the code changes have been integrated and we build the application and run automated integration tests.

As the CI tests changes to our source code, CD tests the changes to our compiled machine code. If all tests pass we are certain to have a functioning package of our application. These packages are now staged for testing. Typical deployment testing can consist of one or more of the following mechanisms:

- Internal manual testing through Quality Control Engineers.
- Automated end-to-end tests in a separate staging environment.
- Running the staged application and the current production application side-by-side with current production data.
- A beta program of power users that subscribe to so-called *nightly builds*

!!! note
    Remember the **Change fail rate** of the motivational chapter?

    We expect our change rate to rise while working on our CD. As our company is transitioning to new workflows and tool-sets, legacy code will have to be transitioned to work in a new environment. While other metrics see immediate minor improvement the change rate may initially rise.

## Continuous Delivery

Continuous Delivery (CD) is an extension of continuous deployment. It describes the automation process of delivering the tried and tested package from a testing environment to production.

Improving our software delivery effectiveness will improve our ability to work in small batches and incorporate customer feedback more rapidly. This is <!-- vale write-good.Weasel = NO -->especially<!-- vale write-good.Weasel = YES --> effective if our client is an internal team within the same organization as updates and comments can be exchanged with a high degree of velocity.

Continuous delivery is not appropriate for all software projects. It requires a high level of automation and testing, as well as a robust rollback process in case of issues. It is generally most suitable for internal deliveries or projects with a high degree of stability and a low risk of breaking changes.

## Shift Left

!!! quote
    *"Shifting left is about paying attention to the low fuel warning light on an automobile versus running out of gas on the highway."*  
    - Misquoted, need author

If we consider our development in a chronological order from left to right, left being the conception of a product, right being the release of the final product, the amount of time needed to fix an error grows exponentially.

Using CI/CD to shift left refers to detecting problems in our project as <!-- vale write-good.Weasel = NO -->early<!-- vale write-good.Weasel = YES --> as possible and ideally minimize their impact on our project. A bug fixed on the developers machine during development is a lot cheaper than a bug fixed on a live deployment with multiple dependencies.

## Responsibility

<!-- vale alex.Race = NO -->
<!-- build masters branch masters -->
Some organizations employ dedicated build masters or branch masters who's job it is to manage integrations and ensure consistent deployments. This practice leads to unnecessary handoffs and dependencies between teams. With CI/CD practices within vertical teams engineers are responsible for their individual integrations into the main branch and the subsequent deployment to production.
<!-- vale alex.Race = YES -->

Engineers integrating into main and verifying their changes work as intended minimizes downstream surprises. When the same person writes the source code, the tests, the documentation and is in charge of integrating the changes, chances are pretty high that unexpected behavior is caught during this process.

Different departments and developers have different criteria on how to define successful implementation or collaboration. A ci/cd focused enabling team may initially help provide a setup with foundational services, but each vertical team owns and subsequently implement respective end-to-end workflow. Vertical teams design and enforce criteria for the success of the team, as people routinely bypassing rules or processes renders these mute.

## Employee satisfaction

According to the study done by Accelerate, teams that did well with CI/CD experience higher employee satisfaction. Trust in our testing and deployment pipeline increases confidence in the work done. This trust reduces stress during work hours and also increases the quality of down time with family and friends.

<!-- vale Vale.Avoid = NO -->
<!-- you build it, you own it -->
Members of autonomous vertical teams accompany changes through inception, implementation, and release. Teams who release changes autonomously identify more strongly with the product they worked on and the organization they worked for. The saying *you build it, you own it* increases the connection to the feature and supports organic transparency, feedback loops, and learning.
<!-- vale Vale.Avoid = YES -->
