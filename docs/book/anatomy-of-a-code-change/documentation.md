# Documentation

Documentation is our trade's collective bane. Similar to testing, documentation historically ranked as an afterthought of the software development cycle. Dissimilar to testing, incorrect documentation does not break our build. Errors and oversights frustrate our customers and fellow engineers only when clear documentation is needed, not before.

This chapter shares proven strategies and standards to embed the process of documenting changes into our product cycle. Following these standards reduces the burden of writing documentation while increasing the quality.

## Teaching documentation

The act of learning programming (even when taught) is an inherently isolated task. We write code, submit code, and receive a review of our code. We learn about algorithms and data structures. We invert binary trees and study time complexities of hash table implementations. These are necessary lessons and build the foundation of our future career.

However, when starting our journey into computer science our peers and mentors seldomly focus on documentation. We hear ominous warnings of undocumented code becoming unrecognizable to the author after six months. A warning slightly tampered by the fact that when starting out, our code will not survive six months.

Thus, the responsibility of teaching documentation falls completely to engineering companies.

## Shifting left on documentation

We are aware how drifting and missing documentation inflicts long-term damage to our organization. Through the mid to late 2010s, modern delivery frequencies and market competitiveness evolved our mere awareness into actionable measures taken.

We actively plan for documentation in our work. We create tickets to reserve the necessary time for writing documentation and review it as we would the source code it accompanies. Shifting left on documentation mandates that we build automation tooling for continuous integration and deliver.

### Documentation as code

Organically, source code changes faster than its documentation. We call this documentation drift. Ephemeral words stored on a separate platform with a fleeting relationship to the code it references is, at best, an expensive time sink; at worst, actively misleading.

Source code evolves until our organization goes out of business. Useful documentation evolves at the same pace. As important us up-to-date documentation is for building upon the status quo, we need to be able to recall the documentation of the state of our code at any point in time. Hence, we administer documentation with version control systems (VCS).

Modern VCS platforms enable us to search for code snippets across our entire organization. We examine references of implementations and investigate how they changed over time. Via dedicated windows and keyboard shortcuts we traverse all source code ever written within seconds. We apply the same standards to our documentation. Information that is impossible or difficult to find may as well not exist in the context of our work. Our engineers will spend an hour understanding the implementation itself if they cannot find the documentation within minutes.

If we are able to find documentation, ensure the state of our code and documentation are in sync, we arrive at the question of quality and consistency. When writing source code we employ static analysis for styling, security, and error detection. We extend these practices to our documentation.

On pull requests, the repository of this book scans the chapters using `vale.sh`. [See the examples.](https://github.com/opencollabbook/book/actions/workflows/pr.yaml)

style guides

Making documentation
Generating documentation
automation

The absolute first priority when writing documentation has to be findability. The most informative testament of engineering brilliance written in beautiful prose with well thought out examples shares its value with a napkin on my desk if its just as difficult to find.

### Documentation driven development

Documentation drift arises due to increased velocity of source code compared to documentation. The term *documentation driven development* (DDD) evangelizes penning down production-quality documentation before implementing a solution. The purest form of DDD happens organically when [planning work using design documents](./planning-implementations.md).

Arguably, a temporal reshuffling of our task list does not *drive* development. If writing source code follows writing documentation, we expect some automation to eliminate aspects of our work. In 2011 a schema based approach advocated a unified API generation with the release of Swagger API. Since then retitled OpenAPI, the standard allows us to write a definition file in yaml or json to automate boilerplate code. Once the OpenAPI schema is written, tooling can generate:

- Boilerplate server code of endpoints and payloads for supported languages
- Generic unit tests for our server code
- Client libraries for supported languages
- Static documentation for our API
- Interactive documentation for our API
- Test doubles and mock servers

An industry-wide motivation to consolidate open standards and the rapid inclusion of LLM tools in developer workflows promote future DDD practices and adoption. Let's see where this is going.

## Diátaxis framework

During his time at Canonical, [*Daniele Procida*](https://vurt.eu/) polished his work on a technical documentation framework, [*Diátaxis*](https://diataxis.fr/). This systematic approach to technical documentation separates it into four styles, tutorials, how-to guides, explanations, and technical references.

The following image is taken straight from the Diataxis website.

[![](https://diataxis.fr/_images/diataxis.png)](https://diataxis.fr/)

### Tutorials

When we find ourselves interested in a new subject, we get started by entering the topic plus the word "tutorial" into our favorite search engine. The results of our query introduce us to guided sessions for us to follow. As we have no subject expertise as of yet, we gain contact, comfort, and eventually confidence in the new practice by mimicking the presented material.

When creating a tutorial, we stay aware of the imbalance of expertise. Our lesson plan consists of a clear starting point and a practical goal our student is able to run. We introduce them to the nomenclature of our documentation's subject. When progressing through the lesson, we provide frequent results to landmark the journey. A well-structured tutorial delivers transparent progress and reliable results.

Although didactically presented by a teacher, tutorials are not lectures. We stay away from explanations that are not directly applicable to the task at hand. An overload of information convolutes our students path to an actionable result. As teachers, we are not able to determine what our students are going to learn, only to facilitate an environment of learning. Our student may pursue further knowledge later at their discretion and available cognitive load.

### How-to guides

The student has a specific idea what to achieve.

Intuitive guide for pain points.

How-to guides are directions that guide the reader through a problem or towards a result. How-to guides are goal-oriented.
Well-written how-to guides that address the right questions are likely to be the most-read sections of your documentation.

help the user accomplish a task

The sequences of action in a how-to guide sometimes need to fork and overlap, and they have multiple entry and exit-points.
Omit the unnecessary
Describe a logical sequence


### Explanations

### Technical References



As with everything in this book we improve our documentation iteratively. Procida warns against focusing too much on the Diaxis structure of existing documentation, and suggests to continously apply Diátaxis standards:

- What user need is represented by this?
- How well does it serve that need?
- What can be added, moved, removed or changed to serve that need better?
- Do its language and logic meet the requirements of this mode of documentation?

https://diataxis.fr/

- Know your audience

Text, images, videos
Transcripts, alt texts

Full video documentations
semantic connections to error messages

## Docs for user


While putting words to document consider how these words will eventually be received.

- Culture (language, level of sophistication, humor)
- Discipline (terms)
- What are they trying to achieve?
- What situation do they encounter the docs? stressful environment, error fixes

Video docs are not much help if no audio available.
Video docs are not helpful if too long without semantic segments

For some to me inexplicable reason PM's love Confluence. Offer alternatives and accept your PM's final word. Then make machines do the writing. As with any code I am a big fan of embeding your documentation into a git repository and track the changes that way.

Keep in mind this is documentation that YOU as the engineer want to share with the PM. It is not your job. Typically these are things regarding research of existing technology, reports on prototypes, decision making processes on the final product implementation.

This is the stuff you reference when a couple months down the line a product owner changes their mind.

"I am not too interested in the internals, I just want to spin it up and try it out."

If over the last month five people asked you

"Where do I find the implementation of that particular behaviour?"

you might consider adding a FAQ to the docs.

Documentation of processes.

## Documentation media

### Text

### Images

### Video

### Transcripts

### Embedded Documentation

Inline documentation refers to documentation embedded in the source code. This form of documentation is exclusively read by other developers. This documentation is the one read most frequently and crucial to be up-to-date.

#### Comments

Keep it concise: Comments should be short and to the point. Avoid writing long paragraphs or unnecessary information. The purpose of a comment is to provide context, not to repeat the code.

Use clear language: Make sure your comments are easy to understand and use clear, concise language. Avoid using technical jargon or obscure terminology that might confuse others.

Comment as you go: It's easier to write comments as you write your code rather than going back later and trying to remember what you were thinking. Make a habit of writing comments as you go.

Explain why, not what: Don't just describe what the code is doing; explain why it's doing it. This will help others understand the context and purpose of the code.

Be consistent: Use a consistent style and format for your comments throughout your codebase. This will make it easier for others to read and understand your code.

Use meaningful names: Use descriptive and meaningful names for variables, functions, and classes. This will make your code easier to understand and reduce the need for comments.

Avoid redundant comments: Avoid commenting on obvious code or code that is self-explanatory. For example, commenting "i++" is redundant since it's clear that the loop variable is being incremented.

Update comments as needed: Code changes over time, and comments can quickly become outdated. Make sure to update your comments as needed to reflect any changes in the code.

#### Naming

Use descriptive names: Variable names should be descriptive and convey the purpose of the variable. Avoid using single-letter or vague names like "x" or "temp". Instead, use names that accurately describe what the variable represents.

Use camelCase: In most programming languages, it's common to use camelCase to name variables. CamelCase involves writing the first word in lowercase and then capitalizing the first letter of each subsequent word. For example, "firstName" or "numStudents".

Use meaningful abbreviations: If you need to use an abbreviation in a variable name, make sure it's a well-known abbreviation or one that is commonly used in your industry or domain. Avoid using abbreviations that might be ambiguous or confusing.

Use consistent naming conventions: Use consistent naming conventions throughout your codebase. This makes it easier for other developers to understand your code and helps maintain consistency across your project.

Avoid using reserved keywords: Avoid using reserved keywords or names that might conflict with existing functions or variables in your programming language.

Be mindful of scope: The name of a variable should reflect its scope. For example, if a variable is only used within a specific function, it should have a name that reflects that scope.

Avoid using numbers: Avoid using numbers in variable names, except for when they're an essential part of the variable's purpose, such as "numStudents" or "maxAttempts".

A name is not a name in itself, but rather the context it is used within.

In my opinion it is absolutely fine and even preferable to call your variables `x` and `y`. While your TA might duct you points for not using `rectWidth` and `rectHeight` the Pythagorean theorem is not commonly referred to as `Cathetus^2 + Ancathetus^2 = Hypotenuse^2`.

In your opinion what does `orderDesc` mean in the code base of a food delivery app?
In your opinion what does `orderDesc` mean in the code base of a spread sheet application?

If `orderDesc` in the food delivery app actually sorts deliveries by descending order you would probably role with it but would be a little surprised. Avoiding these little surprises goes a long way for code readability.

Please note, that the solution here is not spelling out every word in every variable. The solution is to be aware of the context your variables and functions are named within.

#### Naming Conventions

It's the 21st century. We have Intellisense. If I see another Hungarian noation I am going to scream.

> Obviously, where there are industry standards, stick to them.

#### Naming Terms

This is what you want to be focused on. Enforce a definition and naming of broad terms. Server vs backend vs service. Using consistent terms across the code base assists on establishing context for the code block.
