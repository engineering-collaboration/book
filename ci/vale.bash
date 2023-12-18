#!/bin/bash

# read all md file paths from mkdocs nav section
src=($(cat mkdocs-dist.yml))

targets=("")

for i in "${src[@]}"
do
    if [[ $i == \'./book* ]]
    then
        # update path for vale
        # replace trailing '
        repl=${i/.md\'/.md}

        # prepend docs directory
        repl=${repl/\'.\/book/.\/docs\/book}

        targets+=($repl)
    fi
done

vale ${targets[*]}
