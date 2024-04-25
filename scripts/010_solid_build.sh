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
# - BUILD_EXAMPLES=OFF - build examples
# - DYNAMIC_SOLID=OFF  - static library
# - USE_DOUBLE=ON      - double precision
# - USE_TRACER=OFF     - tracer is used
# - CMAKE_BUILD_TYPE=Release - release build automatically add NDEBUG
#                   =Debug   - debug build library named libsolid_d.a

cmake .. -DCMAKE_BUILD_TYPE=Debug -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DBUILD_EXAMPLES=ON -DUSE_TRACER=OFF
make -j
# cmake .. -DCMAKE_BUILD_TYPE=Release -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DBUILD_EXAMPLES=ON -DUSE_TRACER=OFF
# make -j

