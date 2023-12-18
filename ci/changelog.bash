#!/bin/bash

if git describe --tags --abbrev=0 --match v*.*.*; then

    # get tag created for release
    current_t=$(git describe --tags --abbrev=0 --match v*.*.*)

    # find previous release tag to compare changes between releases
    since_tag_cmd=""
    if git describe --tags --abbrev=0 --match v*.*.* "$current_t"^; then
        since_tag_cmd="--since-tag $(git describe --tags --abbrev=0 --match v*.*.* "$current_t"^)"
        echo "using $since_tag_cmd"
    else
        echo "No previous tag found"
    fi

    # format changelogs and write to output file "cl"
    github_changelog_generator \
      -u $1 \
      -p $2 \
      -t $3 \
      --configure-sections '{"none":{"prefix":"none","labels":["none"]}}' \
      --issue-line-labels ALL \
      --output cl \
      $since_tag_cmd
else
    echo "error on reading release tag for changelog"
fi
