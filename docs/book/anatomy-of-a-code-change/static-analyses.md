# Static analysis

Upon creating PR's you may want to verify good practices of the implementation. Static analyses refers to tooling that checks the submitted code in its raw state. Opposed to tests that analyse code execution, static analyses reviews the syntax of the typed code.

This step verifies that the engineer followed agreed upon processes on how to achieve the required features.

Internally agreed formatting of the code

- Whitespace
- Variable naming
- Method naming

Agreed upon implementations

- No exceptions
- Internal libraries vs standard libraries
- No legacy code

Documentation

- consistent documentation layout


Static analysis is the process of analyzing code without actually executing it. It is an important part of software development as it helps to detect potential bugs, security vulnerabilities, and code quality issues early on in the development cycle. Here are some good practices for conducting effective static analysis:

Choose the Right Tool: There are many static analysis tools available, each with its own strengths and weaknesses. Choose a tool that is well-suited for the project and that can detect the types of issues that are important for the project.

Set Clear Goals: Define clear goals for the static analysis process. This includes identifying the types of issues that need to be detected, the severity of the issues, and the level of coverage required.

Establish Baselines: Establish baseline metrics for the code before the analysis begins. This helps to measure the effectiveness of the static analysis process and track improvements over time.

Run Analysis Regularly: Static analysis should be run regularly throughout the development cycle, ideally after each major code change. This helps to detect issues early on and ensure that the code is of high quality.

Integrate with CI/CD: Static analysis should be integrated with the continuous integration/continuous deployment (CI/CD) pipeline. This ensures that issues are caught early and that code is not deployed until it meets the required standards.

Focus on High-Impact Issues: Focus on detecting high-impact issues first, such as security vulnerabilities and critical bugs. This ensures that the most important issues are addressed first.

Customize Rules: Customize the analysis rules to suit the project's specific needs. This includes adding or removing rules as necessary, and adjusting the severity of the rules to match the project's requirements.

Collaborate and Discuss: Static analysis should be a collaborative process, with developers and security experts working together to identify and address issues. It's important to encourage open communication and discussion to ensure that everyone is on the same page.

Automate Remediation: Whenever possible, automate the remediation of issues detected by the static analysis process. This helps to ensure that issues are addressed quickly and consistently.

Monitor Progress: Monitor the progress of the static analysis process over time. This includes tracking the number and severity of issues detected, as well as the time it takes to address them. This helps to ensure that the process is effective and that the code is of high quality.