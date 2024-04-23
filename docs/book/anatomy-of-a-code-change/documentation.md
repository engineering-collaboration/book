# Documentation

Everybodies favourite topic. Documentation is the one topic 99% of the industry agree that it is insufficiently done and 98% agree that writing additional documentation is a hassle they cannot be arsed to do. Throughout our industry we consensually lament the lack of documentation across the board. 

## Documentation drive development

## Documentation automation

## Documentation standards

https://diataxis.fr/

style guides

docs as code
version control

vale.sh

These are the phrases everybody was taught while learning programming.

"I don't even know what I did 6 months ago."

So if this is taught as a basis of software engineering, why is this still a problem?
The problem is that while being taught software engineering, it is an inherently isolated task. You wrote the code, you submitted the code, and the code is reviewed without you present. Besides "cheating" and sharing code assignments in University there is no code collaboration. This means every graduate can invert a binary tree and tell you the Big O performance of dictionaries, but no graduate has experience writing documentation.

Teaching documentation is the responsibility of engineering companies.

- Explicitly plan documentation tickets
- Make documentation part of the review process
- Make it worthwhile and findable... it's a waste of time if nobody reads it
- Automate as much as possible
- Know your audience

Making documentation
Generating documentation

Text, images, videos
Transcripts, alt texts

Full video documentations
semantic connections to error messages

# Who's gonna read it?

While putting words to document consider how these words will eventually be received.

- Culture (language, level of sophistication, humor)
- Discipline (terms)
- What are they trying to achieve?

The absolute first priority when writing documentation has to be findability. The most informative testament of engineering brilliance written in beautiful prose with well thought out examples shares its value with a napkin on my desk if its just as difficult to find.

## Documentation for Product

For some to me inexplicable reason PM's love Confluence. Offer alternatives and accept your PM's final word. Then make machines do the writing. As with any code I am a big fan of embeding your documentation into a git repository and track the changes that way.

Keep in mind this is documentation that YOU as the engineer want to share with the PM. It is not your job. Typically these are things regarding research of existing technology, reports on prototypes, decision making processes on the final product implementation.

This is the stuff you reference when a couple months down the line a product owner changes their mind.

## Documentation for Engineering

"I am not too interested in the internals, I just want to spin it up and try it out."

If over the last month five people asked you

"Where do I find the implementation of that particular behaviour?"

you might consider adding a FAQ to the docs.

Documentation of processes.

## Documentation for Clients

Intuitive guide for pain points.


# Inline Documentation

Inline documentation refers to documentation embedded in the source code. This form of documentation is exclusively read by other developers. This documentation is the one read most frequently and crucial to be up-to-date.

## Comments

Keep it concise: Comments should be short and to the point. Avoid writing long paragraphs or unnecessary information. The purpose of a comment is to provide context, not to repeat the code.

Use clear language: Make sure your comments are easy to understand and use clear, concise language. Avoid using technical jargon or obscure terminology that might confuse others.

Comment as you go: It's easier to write comments as you write your code rather than going back later and trying to remember what you were thinking. Make a habit of writing comments as you go.

Explain why, not what: Don't just describe what the code is doing; explain why it's doing it. This will help others understand the context and purpose of the code.

Be consistent: Use a consistent style and format for your comments throughout your codebase. This will make it easier for others to read and understand your code.

Use meaningful names: Use descriptive and meaningful names for variables, functions, and classes. This will make your code easier to understand and reduce the need for comments.

Avoid redundant comments: Avoid commenting on obvious code or code that is self-explanatory. For example, commenting "i++" is redundant since it's clear that the loop variable is being incremented.

Update comments as needed: Code changes over time, and comments can quickly become outdated. Make sure to update your comments as needed to reflect any changes in the code.

## Naming

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

### Naming Conventions

It's the 21st century. We have Intellisense. If I see another Hungarian noation I am going to scream.

> Obviously, where there are industry standards, stick to them.

### Naming Terms

This is what you want to be focused on. Enforce a definition and naming of broad terms. Server vs backend vs service. Using consistent terms across the code base assists on establishing context for the code block.
