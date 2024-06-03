---
title: Commits
description: Frequent commits make our life easier as we have multiple saved states to track and rollback changes during development. Periodically pushing changes stores these at a second site to prevent data loss in case of problems with our development machine.
---

# Commits

We commit frequently and push changes often. Contrary to our main branch, not all commits to our development branch need to compile or pass tests.

Frequent commits make our lives easier as we have multiple saved states to track and rollback changes during development. Periodically pushing changes stores these at a second site to prevent data loss in case of problems with our development machine.

Development commits are viewed less often than merge commits. As we aspire to keep the scope of our changes as small as needed, our development commits will seldom be visible in our main branch. We heavily encourage work-in-progress commits and pushes. Commits can be cleaned up (as discussed in [Merging]()), but progress lost is lost forever.

## Commit Isolation

When we do find ourselves having introduced unexpected changes to a production service with a large-scoped change and development commits, clean commits support future engineers in fixing problems more efficiently and reduce frustration in stressful situations.

Keeping commits inherently consistent streamlines work and improves comparing changes. The changes committed relate to each other and associate with the commit message. As most IDEs visualize the commit message and changes per code line, isolated commits with a well-formed commit message transparently communicate changes. Combining multiple bug fixes and feature development changes into a single commit message muddies the communicated intent of our change.

As we isolate computational changes, we also avoid wedging in housekeeping alterations. Refactors, variable or method naming updates, and whitespace fixes are committed separately from behavior updates to improve the readability of critical diffs.

## Commit Messages

The urge to type "Did random things" and be done with it is natural. Keeping messages short, concise, and descriptive requires significant cognitive load. Yet, the use of well-formed commit messages improves the readability and traceability of our changes. Following good practices for structuring our commit messages eases our cognitive burden.

### Subject Line

- We limit the subject line to 50 characters
- We capitalize the subject line
- We do not end the subject line with a period
- We use the present tense ("Add feature" not "Added feature")
- We use the imperative mood ("Move cursor to…" not "Moves cursor to…")

A properly formed Git commit subject line <!-- vale write-good.Weasel = NO -->correctly<!-- vale write-good.Weasel = YES --> completes the following sentence, "**If applied, this commit will** <insert our subject line here\>":

**If applied, this commit will** Cap the number of threads for concurrent uploads ✅  
**If applied, this commit will** Capped the number of threads for concurrent uploads ❌  
**If applied, this commit will** Concurrent uploads now cap the number of threads ❌  

Within the subject line, we disregard implementation strategies, since our fellow developers review the code changes, and a glance at the commit diff conveys that information. Commit messages default to commencing with the verbs "add", "remove", "update", or "refactor". We can improve our messages by starting the subject line with a representative verb, anchoring future readers to receive information in the intended context:

*Update authentication flow to be streamlined* --> *Streamline authentication flow*  
*Add authentication for the user with OpenID* --> *Authenticate user via OpenID*  

### Description Paragraph

With the dominance of the leading git platforms and trunk-based development, description paragraphs have become atypical. Detailed reasoning for changes has moved to [Pull Requests](). Nevertheless, Git commit messages can contain multi-line description paragraphs, which are considered well-formed when:

- A commit message consists of a subject line and a description
- We separate the subject from the description with a blank line
- We wrap the description at 72 characters

**Example**

```
commit bef8d931a985b9879a7ca0e4ef07f082bec1a52c
Author: Daniel Lanner <hello@daniellanner.io>
Date:   Tue Jan 2 16:10:00 2024 +0100

   Cap the number of threads for concurrent uploads

   When uploading a high number of items, some http calls time out, leading
   to errors. We limit the number of active worker threads to 16 and queue
   the items to be uploaded.

   Failed items are retried as defined in const UPLOAD_MAX_RETRY.

```
