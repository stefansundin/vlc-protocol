#!/bin/bash -ex
rm -rf mpv-protocol.app.zip mpv-protocol.app
./build.sh
cp -r mpv-protocol-app mpv-protocol.app
zip -r mpv-protocol.app.zip mpv-protocol.app -x '*.DS_Store'
