#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

git clone https://github.com/ahaoboy/rquickjs-cli.git rquickjs-cli --depth=1
cd rquickjs-cli

cargo pgo build

cargo pgo run -- ../run.js
cargo pgo run -- ../run.js

cargo pgo optimize

mkdir ../dist

cp -r ../target/$TARGET/release/rquickjs ../dist/rqjs-pgo

cd ..

ls -lh dist

tar -czf ./rqjs-pgo-${TARGET}.tar.gz -C dist .
ls -l ./rqjs-pgo-${TARGET}.tar.gz