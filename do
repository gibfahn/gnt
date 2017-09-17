#!/bin/bash -e

# Firefox WebExtensions ID = {b6ec63ce-f41d-4348-ba6e-0013c059cf08}

# Use newlines to separate so grep -vFx works to exclude them (Chrome).
ignoreFiles="
webextension-polyfill
web-ext-artifacts
chrome-artifacts
do
doc
github-notifications-in-tabs.zip
"

# Put it all on one line for Firefox.
ignoreFilesOneLine="$(echo "$ignoreFiles" | tr '\n' ' ')"

# List of everything except $ignoreFiles.
usedFiles="$(ls | grep -vFx "$ignoreFiles")"
# Put it all on one line for zip.
usedFilesOneLine="$(echo "$usedFiles" | tr '\n' ' ')"

case $1 in
  update) # Update the submodule.
    (cd webextension-polyfill; git fetch; git merge --ff-only;  npm install)
    ;;
  lint)
     web-ext lint --ignore-files webextension-polyfill
    ;;
  build)
     web-ext lint --ignore-files webextension-polyfill
     web-ext build --ignore-files webextension-polyfill
    ;;
  sign) # Sign a Firefox extension.
     web-ext lint  --ignore-files $ignoreFilesOneLine
     web-ext build --ignore-files $ignoreFilesOneLine
     web-ext sign  --ignore-files $ignoreFilesOneLine \
       --api-key $(gpg  -d ~/.ssh/keys/AMO_JWT_ISSUER.gpg) \
       --api-secret $(gpg  -d ~/.ssh/keys/AMO_JWT_SECRET.gpg)
   ;;
  chrome) # Package a chrome zip.
    rm -f github-notifications-in-tabs.zip
    zip -r github-notifications-in-tabs.zip . -i $usedFilesOneLine
   ;;
  esac
