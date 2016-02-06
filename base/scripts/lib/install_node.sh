#!/bin/bash
set -e
NODE_VERSION=0.10.41
NODE_ARCH=x64

# check we need to do this or not

NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

cd /tmp
apk add --update curl make gcc g++ binutils-gold python linux-headers paxctl libgcc libstdc++

CONFIG_FLAGS="--fully-static --without-npm" DEL_PKGS="libgcc libstdc++" RM_DIRS=/usr/include

curl -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz | tar -xz
cd /node-${VERSION}
./configure --prefix=/usr ${CONFIG_FLAGS}
make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1)
make install
paxctl -cm /usr/bin/node
cd /
if [ -x /usr/bin/npm ]; then
    npm install -g npm@${NPM_VERSION}
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf;
fi
apk del curl make gcc g++ binutils-gold python linux-headers paxctl ${DEL_PKGS}
rm -rf /etc/ssl /node-${VERSION} ${RM_DIRS} \
   /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
   /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
