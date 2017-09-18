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
  sign) # Sign a Firefox extension.
     web-ext lint
     web-ext sign --api-key $(gpg  -d ~/.ssh/keys/AMO_JWT_ISSUER.gpg) \
                  --api-secret $(gpg  -d ~/.ssh/keys/AMO_JWT_SECRET.gpg) -v
   ;;
  download) # Download a Firefox extension which failed to download in the sign step
    # $2 is the URl that failed above.
    TOKEN="$(AMO_JWT_ISSUER=$(gpg  -d ~/.ssh/keys/AMO_JWT_ISSUER.gpg) \
      AMO_JWT_SECRET=$(gpg  -d ~/.ssh/keys/AMO_JWT_SECRET.gpg) \
      node ../jwt/gen.js)"
    curl -H "Authorization: JWT $TOKEN" "$2"
    ;;
  zip) # Package a chrome zip.
    echo "Zipping: $usedFilesOneLine"
    rm -f ../$extensionDir.zip
    zip -r $extensionDir.zip .
    mv $extensionDir.zip ..
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
