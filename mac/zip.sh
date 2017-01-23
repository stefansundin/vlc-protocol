#!/bin/bash -ex
rm -rf VLC-protocol.app.zip VLC-protocol.app
./build.sh
cp -r VLC-protocol-app VLC-protocol.app
zip -r VLC-protocol.app.zip VLC-protocol.app -x '*.DS_Store'
