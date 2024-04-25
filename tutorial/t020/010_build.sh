#!/bin/bash


set -e
set -x

if [ ! -e build ] ; then
    mkdir build
fi

cd build

# - optimization turns itself on
# - USE_DOUBLE=ON     - double precision

cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DUSE_TRACER=OFF
make -j

./prog



