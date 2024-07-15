#!/bin/bash

###
### Replace open graph social cards

pattern='<meta  property="og:image" .* >'
replacement='<meta  property="og:image"  content="https://engineering-collaboration.io/assets/social.png" >'

# replace generated social cards with static image recursively in all files
# check for platform for proper invocation of sed
# macos expects temp file location for in place file changes
if [[ "$OSTYPE" == "darwin"* ]]; then
    grep -rl '<meta  property="og:image"' site | xargs sed -i '' "s|${pattern}|${replacement}|g"
else
    grep -rl '<meta  property="og:image"' site | xargs sed -i "s|${pattern}|${replacement}|g"
fi


###
### Replace twitter social cards

pattern='<meta  name="twitter:image" .* >'
replacement='<meta  name="twitter:image"  content="https://engineering-collaboration.io/assets/social.png" >'

# replace generated social cards with static image recursively in all files
# check for platform for proper invocation of sed
# macos expects temp file location for in place file changes
if [[ "$OSTYPE" == "darwin"* ]]; then
    grep -rl '<meta  name="twitter:image"' site | xargs sed -i '' "s|${pattern}|${replacement}|g"
else
    grep -rl '<meta  name="twitter:image"' site | xargs sed -i "s|${pattern}|${replacement}|g"
fi
