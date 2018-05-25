#!/bin/bash -ex
mkdir -p mpv-protocol-app/Contents/MacOS
gcc -framework Cocoa -o mpv-protocol-app/Contents/MacOS/mpv-protocol mpv-protocol.m
