# Commits during development

We commit frequently and push changes often. Contrary to our main branch, not all commits to our development branch need to compile or pass tests.

With frequent commits we make our life easier as we have multiple saved states to track and rollback changes during development. Periodically pushing changes stores these at a second site to prevent data loss in case of problems with our development machine.

## Commit Hygiene

Development commits are viewed less often than merge commits. As we aspire to keep the scope of our chances as small as needed our development commits will likely never be visible in our main branch. If we ever do find ourselves having introduced unexpected changes to a production service with a large scoped change, clean commits support future engineers in fixing problems more efficiently and reduce frustration in stressful situations.

Keeping commits inherently consistent by subject streamlines work and changes. Most IDE's visualise the commit changes per line. Isolated commits with a well-formed commit message transparently communicates changes. 

The readability of diff's between commits is greatly improved if whitespace changes are committed separately.

We heavily encourage work in progress commits and pushes. Commits can be cleaned up (as discussed in [Merging]()), but progress lost is lost forever.

## Commit messages

The urge to type "Did random things" and be done with is completely natural. Keeping messages short, concise, and descriptive requires significant cognitive load. Yet, the use of well formed commit messages improves readability and traceability of our changes. Following good practices for structuring our commit messages eases our cognitive burden.

### Subject line

- We limit the subject line to 50 characters
- We capitalize the subject line
- We do not end the subject line with a period
- We use the present tense ("Add feature" not "Added feature")
- We use the imperative mood ("Move cursor to..." not "Moves cursor to...")

A properly formed Git commit subject line correctly completes the following sentence, "**If applied, this commit will** <insert our subject line here\>"

**If applied, this commit will** Cap the number of threads for concurrent uploads ✅  
**If applied, this commit will** Capped the number of threads for concurrent uploads ❌  
**If applied, this commit will** Concurrent uploads now cap the number of threads ❌  

### Description paragraph

With the dominance of the leading git platforms and trunk based development, description paragraphs have become atypical. Detailed reasoning of changes have moved to [Pull Requests](). Nevertheless, Git commit messages can contain multiline description paragraphs which are considered well-formed when:

- A commit message consists of a subject line and a description
- We separate subject from description with a blank line
- We wrap the description at 72 characters

**Example**

```
commit bef8d931a985b9879a7ca0e4ef07f082bec1a52c
Author: Daniel Lanner <hello@daniellanner.io>
Date:   Tue Jan 2 16:10:00 2024 +0100

   Cap the number of threads for concurrent uploads

   When uploading a high number of items some http calls time out leading
   to errors. We limit the number of active worker threads to 16 and queue
   the items to be uploaded.

   Failed items are retried as defined in const UPLOAD_MAX_RETRY.

```

### Wording

A detailed message description is helpful for obscure and opaque changes and bug fixes for difficult to reproduce circumstances. 

I find it helpful to start the message with a descriptive verb that does a lot of heavy lifting. I typically try to turn one of the representative words into a verb.

*Update authentication flow to be streamlined* --> *Streamline authentication flow*  
*Add authentication for user with OpenID* --> *Authenticate user via OpenID*

Do not be hampered by unnecessary zeal. Developers are used to reading code and a quick glance at the diff conways the same amount of information as reading through the message description. More so, as we'll see HOW the changes were made.
I tend to stick to message subjects only and write commit message descriptions between two and six times per year when I deem it necessary.

My commit messages were very lax for years. That is until the day I was hunting down an obscure bug that required me to understand certain code changes over the last three years where the original author had already moved to a different company. Let's collectively make each other's life a little bit easier.

We preface this chapter reiterating that we are not righteous zealots distanced from reality. Let us enjoy our collection of good practices for commits and strive to whichever parts we deem most useful.