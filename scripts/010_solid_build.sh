#!/bin/bash

# demonstration of how to compile
# exit

# version 3.5.8
# - compile solid into the build directory
# - c++11 is stricter, requires exact determination of which function to call in template
#     Quaternion.h   l.63 setValue  --->  this->setValue
# - compile statically, then the library location does not have to be resolved

set -e
set -x

cd ..

if [ ! -e build ] ; then
    mkdir build
fi

cd build

# - optimization turns itself on
# - BUILD_EXAMPLES=ON - build examples
# - DYNAMIC_SOLID=OFF - static library
# - USE_DOUBLE=ON     - double precision
# - USE_TRACER=ON     - tracer is used

cmake .. -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DBUILD_EXAMPLES=OFF -DUSE_TRACER=ON
make -j

