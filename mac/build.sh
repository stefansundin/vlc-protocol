#!/bin/bash -ex
mkdir -p VLC-protocol-app/Contents/MacOS
gcc -mmacosx-version-min=10.15 -arch x86_64 -arch arm64 -framework Cocoa -o VLC-protocol-app/Contents/MacOS/vlc-protocol vlc-protocol.m
