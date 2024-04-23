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
# -DBUILD_EXAMPLES=ON - build examples
# -DDYNAMIC_SOLID=OFF - static library
# -DUSE_DOUBLE - normal single precision

#cmake ../solid3 -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON
cmake .. -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_DOUBLES=ON -DBUILD_EXAMPLES=OFF
#cmake .. -DDYNAMIC_SOLID=OFF -DCMAKE_VERBOSE_MAKEFILE=ON
make -j

