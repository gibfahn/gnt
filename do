#!/bin/bash -e

# Firefox WebExtensions ID = {b6ec63ce-f41d-4348-ba6e-0013c059cf08}

case $1 in
  update)
    (cd webextension-polyfill; git fetch; git merge --ff-only;  npm install)
    ;;
  lint)
     web-ext lint --ignore-files webextension-polyfill
    ;;
  build)
     web-ext lint --ignore-files webextension-polyfill
     web-ext build --ignore-files webextension-polyfill
    ;;
  sign)
     web-ext lint --ignore-files webextension-polyfill
     web-ext build --ignore-files webextension-polyfill
     web-ext sign --ignore-files webextension-polyfill \
       --api-key $(gpg  -d ~/.ssh/keys/AMO_JWT_ISSUER.gpg) \
       --api-secret $(gpg  -d ~/.ssh/keys/AMO_JWT_SECRET.gpg)
  esac
