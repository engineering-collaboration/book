---
title: Internal supporting teams
description: It is common to have complex or shared problems that may be solved more efficiently by supporting teams within an organization. Besides working directly on public product features, stream-aligned teams may deliver internal practices.
---

# Internal supporting teams

!!! abstract "This section is heavily based on the book *Team Topologies*."

All teams within our organization should strive to be vertical teams, and most of our vertical teams work on features of the software product we publicly sell. However, it is common to have complex or shared problems that may be solved more efficiently by supporting teams within an organization. Besides working directly on public product features, stream-aligned teams may deliver internal practices.

Supporting teams reduce the burden on other vertical teams. For example, cloud teams ensure necessary policies, controls, and audits for hosting applications on provided infrastructure. Product teams need autonomy to provision their environments and resources in the cloud, creating new images and templates where necessary.

If we find that task switching puts an increasing amount of cognitive load on our vertical team, we spin one of the tasks into a new separate vertical team. We should do the same if we find a certain aspect of our development is taking away resources from our vertical team's actual task of providing marketable features.

## Types of supporting teams

In the 2012 paper, *A Taxonomy of Dependencies in Agile Software Development*, Diane Strode and Sid Huff propose three different categories of dependencies: knowledge, task, and resource dependencies. In the book *Team Topologies*, supporting teams are differentiated into three different flavors:

- Enabling teams
- Complicated-Subsystem teams
- Platform teams

A supporting team is a nested team consisting of vertical teams and potentially consuming other supporting teams. Typically, we want a 6:1 to 9:1 mapping between vertical teams working on the product we sell and vertical teams working on other deliverables.

Throughout these processes, remember Conway's Law. Changes to our departments will ultimately find their way into the architecture of our software. Software architecture is a continuous process. In modern times, no commercial software is as trivial as to be designed in whole and not influenced by changes.

### Enabling team

The purpose of enabling teams is to understand potential areas of improvements of vertical teams. Enabling teams stay up-to-date with new approaches, tooling, and practices to bridge internal knowledge gaps. Enabling teams typically appear in the form of coaches, consultants, and research and development.

For example, our organization is required to fully transition from the deprecated Python version 2.7 to version 3.x. An enabling team is set up to research the challenges, timing, and behavior parity in future versions. The enabling team may build best practice guides, automation tooling, and testing suites. After the enabling team has solidified an approach, it collaborates with vertical teams across the organization to ensure a successful transition.

On a more egocentric note, an enabling team may also be set up to apply the processes described in this book across vertical teams.

### Complicated-Subsystem Teams

When a vertical team comes across a task that requires specialized knowledge, it might be advisable to spin out that task into a separate team. Typically, these teams work on libraries that are then consumed by product teams. Examples are 3D rendering, time and date management, and image compression.

The driving factor of establishing a complicated-subsystem is to reduce the cognitive load of a vertical team, not necessarily to share the component across multiple vertical teams. High communication with stream-aligned team during early exploration and development. Reduced interaction with stream-aligned team during later stages.

### Platform teams

!!! quote
    *A digital platform is a foundation of self-service APIs, tools, services, knowledge, and support, which are arranged as a compelling internal product. Autonomous delivery teams can make use of the platform to deliver product features at a higher pace, with reduced coordination.*  
    - Evan Bottcher

Platform teams build internal products with the same sophistication needed to be commercially publicly. Platforms offer a high level of self-service documentation, contacts to support engineers, and a polished UX and API.

Our vertical product teams maintain full ownership of building, running, and fixing their application in production. Our platform teams provide internal self-service services to reduce the cognitive load that would be required to develop the underlying services. Platform teams have a strong focus on usability and treat the platform as a product with a typical product life cycle.

For example, our organization has been utilizing object storage from a popular cloud provider. We have reached a maturity and size that we decide to try and lower costs by building internal teams that focus on internal needs. We start recruiting for multiple vertical teams that establish an internal storage platform team.

However, platforms can be as small as providing a thin wrapper or merely extended documentation and implementation examples of a publicly available product.

## Team topology over time

As with most topics covered in this book, teams are not static. It is not sufficient to choose a team boundary a single time and expect no further changes. With the adoption of additional technology, market practices, competitors, and internal knowledge, our team constellations and interaction modes will evolve.

If we can track our team interactions, we can make decisions regarding team responsibilities. If we find exclusive strong dependencies and a reduced cognitive load of maintaining a platform or library, it might be advantageous to empower the team to do so.

A relevant topic for this book is a different example. Learning and setting up CI/CD principles requires high cognitive load that can be tasked to an enabling team. The enabling team will set up a minimal pipeline for vertical teams, and after a hand-off and education period, the vertical team is responsible for adjusting the pipeline to their needs.

## Provide supporting teams at cost

Successful companies follow a general rule that actionable feedback originates from paying customers solely. These are the people willing to spend money on the problem we are solving; these are the people we primarily listen to.

We set up the same strategy with our internal deliveries and offer products of supporting teams to vertical teams at cost. If vertical teams and their leads have to budget their dependencies on enabling teams, platform teams, or complicated subsystem teams, we can reason that <!-- vale write-good.Weasel = NO -->only<!-- vale write-good.Weasel = YES --> necessary technology survives within our organization.

Internal payments support baseline metrics of usage and help avoid building bloated platforms with <!-- vale alex.ProfanityMaybe = NO -->sexy<!-- vale alex.ProfanityMaybe = YES --> but unnecessary features. Platform teams should strive for the thinnest viable platform able to support our vertical teams to generate product revenue.
