---
title: DevOps, Agile, and Lean
description: Various flavors of agile project management have been trending over the years, yet all build upon iterative and incremental development, autonomous teams, and continuous improvement.
---

# DevOps, Agile, and Lean

Arguably, these terms have become quite fashionable. Various flavors of agile project management have been trending over the years, with multiple consultancies and tooling providers offering "best practice" solutions. To avoid any tribalism, bias, or emotional connotation, concluding this chapter we will avoid these terms as best as feasible and use the titular term *collaboration*.

We do not "win" by implementing trending forms of Agile or DevOps. Our customer base does not magically double because we introduce daily stand-up meetings. The sole motivator for change within organizational structures must be to strengthen market competitiveness.

## The Three Values of Collaboration in Software

Disregarding various mutations of DevOps, DevSecOps, Agile, Lean, et al., these principles are founded on identical core philosophies. These philosophies build the basis of this book and can be consolidated into the following three categories.

### Iterative and Incremental Development

We prioritize delivering working software as swiftly as possible and continuously improve it through a series of iterative cycles. Using this approach, we create organic feedback loops between development and customers. This makes our company more adaptable to business needs, organizational needs, market needs, technological needs, personnel needs, and political needs.

Ideally, each change integrated into our product keeps our product in a deliverable state, shifting the dynamic of our software from a "product for users" towards a "conversation with users". This drastically reduces work of questionable business value, including partially done work, unneeded features, and lengthy contract negotiations with clients ahead of time.

### Autonomous Teams

All of our teams produce and release working software by themselves. Teams self-organize and take responsibility for developing and releasing different aspects of our software. They design, implement, and release changes to software products without the need for hand-offs or approvals.

Every organization's employees do more than their assigned tasks. A body as complex as an organization cannot be planned into every minute detail. Autonomy of work and autonomy of communication are mandatory. If people are micro-managed or forced into overbearing bureaucratic processes, our organization's deliveries come to a halt.

### Continuous Improvement

We never reach peak performance. Organizations, technology, and the market change over time, so should our software processes. We are not done by implementing software collaboration once and patting ourselves on the back, but continuously analyze and improve our ways of doing things.

We encourage our teams and individuals to continuously improve our processes and practices. We instill a blameless culture of continual experimentation where failure is considered part of learning and innovation.

## Blameless Culture

When we blame and punish our employees for errors, we nourish a self-centered community that opposes transparent communication. This leads to people covering up mistakes and pushing them down the line. When discovered in time, these mistakes are costly to fix.

Instead, we treat human error as a symptom of the system and ask ourselves how we got here in the first place and how we can avoid it in the future. When we tackle issues cooperatively, we reframe them as learning opportunities. We cannot change people's behavior by changing their minds; we change their minds by changing people's behavior.

If coworkers feel free to share their mistakes, they increase transparency and trust within the team. At a minimum, it instructs coworkers on how to avoid costly errors without having to directly experience them. When we offer a safe environment to fail fast and fail often, we grow the cumulative body of knowledge within an organization.

A culture does not define what we do; what we do defines our culture. Hence, a culture is the result of the sociotechnical changes we apply within our organization. The processes and strategies in this book support our organization to embrace a blameless culture.

However, we should actively measure and encourage our progress internally if we want to succeed in establishing a competitive organization. The values and beliefs, explicitly and implicitly framed by our organization's hierarchy and interactions, drive our cultural movement.

## Sociotechnical Interdependence

If we automate bad practices, we increase the quantity of bad practices, not the quality. Conversely, implementing agile project management without the necessary technical processes leads to confusion, frustration, and eventual lingering resentment.

<!-- vale alex.Condescending = NO -->
The social and the technical are two interdependent parts of the same system. Technology and automation can pave the way to make it easy to do the right thing.
<!-- vale alex.Condescending = YES -->

## Metrics

The book *Accelerate* by Nicole Forsgren, Jez Humble, and Gene Kim presents the findings of the largest study done in the field of software products and continuous delivery. Conducted in 2017, it focuses on four key capabilities for software product releases:

- *Code deployment* measures the frequency of new releases of our application to our consumer.
- *Commit to deploy* describes the lead time from the last software change to staging a new code deployment.
- *Recover from downtime* defines the duration to re-establish a functioning software system after a failure. It also includes recovering from malevolent system infiltrations or denial of service attacks.
- *Change fail rate* measures how often the distributed software executable does not match the desired expectations. New code deployments should require a minimum of unexpected fixes.

The study compared these key capabilities of software distribution between high and low-performing organizations and found that (at the time) high performers had:

- **46x** more frequent code deployments
- **440x** faster lead time from commit to deploy
- **170x** faster mean time to recover from downtime
- **1/5** of fails on changes

Building these paradigms into the core of software development enables high performers to double the probability of reaching their business goals compared to low performers across industries and departments. Improving our software delivery effectiveness enhances our ability to incorporate customer feedback more effectively.
