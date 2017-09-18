#!/bin/bash -e

# Firefox WebExtensions ID = {b6ec63ce-f41d-4348-ba6e-0013c059cf08}

extensionDir=github-notifications-in-tabs

pushd $extensionDir

case $1 in
  update) # Update the submodule.
    git fetch; git merge --ff-only; npm install
    mv ./webextension-polyfill/dist/browser-polyfill.js $extensionDir
    ;;
  lint)
    web-ext lint
    ;;
  build)
    web-ext lint; web-ext build
    ;;
  run)
    which web-ext &>/dev/null || . $NVM_DIR/nvm.sh
      web-ext run
    ;;
  zip) # Package the extension into a zip.
    echo "Zipping: $usedFilesOneLine"
    rm -f ../$extensionDir.zip
    zip -r ../$extensionDir.zip .
   ;;
  icon) # Recreate icons from svg file.
    for i in 32 48 96 128; do
      inkscape -z -e "$PWD"/icons/gnt${i}x${i}.png -w $i -h $i "$PWD"/icons/gnt.svg
    done
    ;;
  *)
    echo "Invalid command, try: ./do [ update | lint | build | run | sign | zip | icon ]"
    ;;
esac

popd
