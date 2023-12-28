# Commit messages

# keep commits inherntly consistent

do not mix feauters and whitespace
bugifxes and feautres
fixes across different bugs
commit frequently

Writing commit messages sucks. Keeping messages short, concise and descriptive produces a significant cognitive load. The urge to type "Did things" or "Updated stuff" and be done with is completely natural.

The use of well formed commit messages improves readability and traceability of the repository. Thankfully, there is a set of good practices that can help structure our commit messages and ease cognitive burden.

- Limit the subject line to 50 characters
- Capitalize the subject line
- Do not end the subject line with a period

**Example**

```commit eb0b56b19017ab5c16c745e6da39c53126924ed6  
Author: Dinah Mite <dinah.mite@snowtrack.io>  
Date:   Fri Aug 1 22:57:55 2014 +0200

   Simplify serialize.h's exception handling
```

## Wording of commit subject lines

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Do not reference issues and pull requests within the subject line
- Reference issues and pull requests liberally within the description

A properly formed Git commit subject line should always be able to complete the following sentence:

"*If applied, this commit will* \<insert our subject line here\>"

**Example**  

*If applied, this commit will* refactor subsystem X for readability ✅  
*If applied, this commit will* refactored subsystem X for readability ❌  
*If applied, this commit will* subsystem X being refactored for Dinah's rebase ❌  

I find it helpful to start the message with a descriptive verb that does a lot of heavy lifting. I typically try to turn one of the representative words into a verb.

- e.g. *Update authentication flow to be streamlined* --> *Streamline authentication flow*
- e.g. *Add authentication for user with OpenID* --> *Authenticate user via OpenID*

## Description paragraph

Git commit messages can contain multiline description paragraphs. If we feel we cannot convey necessary information in a 50 character subject append a description using the following format:

- A commit message consists of a subject line and a description
- Separate subject from description with a blank line
- Wrap the description at 72 characters
- Use the description to explain what and why vs. how

**Example**

```commit eb0b56b19017ab5c16c745e6da39c53126924ed6  
Author: Dinah Mite <dinah.mite@snowtrack.io>  
Date:   Fri Aug 1 22:57:55 2014 +0200

   Simplify serialize.h's exception handling

   Remove the 'state' and 'exceptmask' from serialize.h's stream
   implementations, as well as related methods.

   As exceptmask always included 'failbit', and setstate was always
   called with bits = failbit, all it did was immediately raise an
   exception. Get rid of those variables, and replace the setstate
   with direct exception throwing (which also removes some dead
   code).
```

### When to add description paragraphs

A detailed message description is helpful for obscure and opaque changes and bug fixes for difficult to reproduce circumstances. 

Do not be hampered by unnecessary zeal. Developers are used to reading code and a quick glance at the diff conways the same amount of information as reading through the message description. More so, as we'll see HOW the changes were made.
I tend to stick to message subjects only and write commit message descriptions between two and six times per year when I deem it necessary.

My commit messages were very lax for years. That is until the day I was hunting down an obscure bug that required me to understand certain code changes over the last three years where the original author had already moved to a different company. Let's collectively make each other's life a little bit easier.

## Summary

- Primarily focus on the subject line
- Find a descriptive verb to start the message with. If we're struggling, fall back to one of the classics (Update, Add, Remove, Refactor, ...).
- Once in a while, if necessary, add a commit message description paragraph
- Don't be too hard on ourselves, the commits will be squashed anyway
