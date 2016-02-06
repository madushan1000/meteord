set -e
# for npm module re-building
apk app build-base openssl-dev git python
npm install -g node-gyp
# pre-install node source code for faster building
node-gyp install ${NODE_VERSION}

bash $METEORD_DIR/lib/cleanup.sh
