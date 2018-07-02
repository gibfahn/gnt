#!/bin/bash

# Firefox WebExtensions ID = {b6ec63ce-f41d-4348-ba6e-0013c059cf08}

set -eu

extensionDir=github-notifications-in-tabs

# Install web-ext.
which npm &>/dev/null || . $NVM_DIR/nvm.sh
which web-ext &>/dev/null || { echo "Installing web-ext..."; npm install --global web-ext; }

case ${1:-} in
  update) # Update the submodule.
    (cd webextension-polyfill; git fetch; git merge --ff-only; npm install)
    mv ./webextension-polyfill/dist/browser-polyfill.js "$extensionDir"/
    ;;
  lint)
    (cd $extensionDir; web-ext lint)
    ;;
  build)
    (cd $extensionDir; web-ext lint; web-ext build)
    ;;
  run)
    (cd $extensionDir; web-ext run)
    ;;
  icon) # Recreate icons from svg file.
    pushd $extensionDir
    for i in 32 48 96 128; do
      inkscape -z -e "$PWD"/icons/gnt${i}x${i}.png -w $i -h $i "$PWD"/icons/gnt.svg
    done
    popd
    ;;
  *)
    echo "Invalid command, try: ./do [ update | lint | build | run | sign | zip | icon ]

    Normal update flow:
    - update: updates the submodule
    - icon: rebuilds the icons
    - build: builds the zip (upload to FF and Chrome)
    "
    ;;
esac
