# Rebase

The ideal approach when working with source control is to have managable pieces of changes which are coherent and able to build. After branching out of your trunk
Rebasing a branch rewrites the history of those commits on the rebase destination.

It is generally a good idea to rebase your development branch before merging it to main, regardless of your merging strategy. The idea is to have feature changes grouped by merges. 

## Rebase and merge

This strategy moves all the commits of your development branch into the main branch. The resulting git history displays all commits as if they were made on the main branch in the first place.

## Force push

Feel free to force push your dev branch.

NEVER force push main unless you are absolutely sure what you are doing. Typically you need CODEOWNER privileges to be able to push to main in the first place.
