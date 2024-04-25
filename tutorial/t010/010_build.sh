#!/bin/bash


set -e
set -x

if [ ! -e build ] ; then
    mkdir build
fi

cd build

# - optimization turns itself on
# - USE_DOUBLE=ON     - double precision

cmake .. -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DUSE_TRACER=ON
make -j

./prog



