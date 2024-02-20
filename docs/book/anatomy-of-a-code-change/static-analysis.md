# Static analysis

Static analysis scans the syntax of our code without actually executing it. It verifies that we follow agreed-upon conventions in our solution to maintain consistent readability, avoid bugs, and prevent security vulnerabilities before running our code. Static analysis is run at every step of our code change: pre-merge, post-merge, and pre-release.

## Code readability

The most fundamental form of static analysis uses pattern matching to ensure our compliance with internally agreed-upon code formatting. We follow our organization's conventions regarding the type of whitespace, indentation, maximum line length, naming of objects, etc. We execute code linters specific to the programming language and extend these to cover the needs of our team.

Maintaining a consistent code base reduces friction when integrating our work within and across our teams by reducing the cognitive load when reading code. People can focus on the content of what is being written if the syntax layout is identical to the layout of their work.

Aside from programmatic syntax, we utilize static analysis practices for documentation. Pattern matching enforces practices that enrich embedded documentation by flagging improperly formatted comments across functions and objects. External documentation follows style guides that we enforce by configuring our static analysis tools.

## Software conditions

Data flow analysis informs us about unused variables, uninitialized variables, and null pointer dereferences before we execute our code to discover crashes. Race conditions in multithreading environments are infamously difficult to spot and fix when the problem arises in production and can be prevented to a degree with sophisticated static analysis.

Call graph analysis flags potential performance bottlenecks and visualizes dependencies and call stacks. Configuring our analysis tool allows us to enforce organization-wide rules in the areas of flow control, for example, unsanctioned error handling. Dependencies to libraries with security violations expose a potential <!-- vale alex.ProfanityMaybe = NO -->attack<!-- vale alex.ProfanityMaybe = YES --> vector to malicious third parties. Static analysis highlights problematic dependencies before executing the code and endangering our system.

Resource leak detection in static analysis flags missing closures of objects, allocated memory, or network connections. These aspects severely affect the runtime stability of our system and subject us to high-security risks. Hostile actors piggyback on open database connections or memory layouts to read exposed data or inject unintended behavior.

## Using static analysis

We define goals for static analysis and monitor the progress over time. Propitiously, the output of this process lends itself to distinctly measurable metrics. We track the number and nature of issues detected, as well as the time it takes to address them. When migrating away from certain libraries, we deprecate the use of these to guard against new dependencies popping up across the organization.

Our tools do not merely flag misuse of certain aspects but offer solutions. Wherever possible, we automate resolutions of static analysis issues. Every manual step creates cognitive load which opens the door to frustration and failure to follow standardized practices.

Throughout the organization, we enforce high-impact issues and severe security vulnerabilities with static analysis; we wield it as a scalpel, not a hammer. A facilitating team of security and performance experts creates the smallest common denominator in collaboration with stakeholders across the organization.

Aside from prime issues, every team configures tooling to minimize noise and maximize development velocity. As with anything in the CI/CD mindset, static analysis practices evolve. We remove noisy configurations, add new rules to face novel problems, and adjust the severity of recommendations over time.
