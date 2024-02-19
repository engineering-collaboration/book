# Static analysis

Static analysis scans the syntax of our code without actually executing it. It verifies that we follow agreed-upon conventions in our solution to maintain consistent readability, avoid bugs, and prevent security vulnerabilities before running our code. Static analysis is run at every step of our code change; pre-merge, post-merge, and pre-release.

## Readability

The most fundamental form of static analysis uses pattern matching to ensure our compliance to an internally agreed code formatting. We follow our organization's conventions regarding the type of whitespace, indentation, maximum line length, naming of objects, etc. We execute code linters specific to the programming language and extend these to cover the needs of our team.

Maintaining a consistent code base reduces friction when integrating our work within and across our teams by reducing the cognitive load when reading code. People can focus on the content of what is being written, if the syntax layout is identical to the layout of their work.

- consistent documentation layout

## Security and SBOM

Resource leak detection
Race conditions
Call graph analysis
data flow analysis
- No exceptions
- Internal libraries vs standard libraries
- No legacy code

## Using static analysis

Monitor the progress of the static analysis process over time. This includes tracking the number and severity of issues detected, as well as the time it takes to address them. This helps to ensure that the process is effective and that the code is of high quality.

Define clear goals for the static analysis process. This includes identifying the types of issues that need to be detected, the severity of the issues, and the level of coverage required. Focus on detecting high-impact issues first, such as security vulnerabilities and critical bugs. This ensures that the most important issues are addressed first. Customize the analysis rules to suit the project's specific needs. This includes adding or removing rules as necessary, and adjusting the severity of the rules to match the project's requirements. Static analysis should be a collaborative process, with developers and security experts working together to identify and address issues. It's important to encourage open communication and discussion to ensure that everyone is on the same page.

Whenever possible, automate the remediation of issues detected by the static analysis process. This helps to ensure that issues are addressed quickly and consistently.
