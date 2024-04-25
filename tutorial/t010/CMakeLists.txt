# Specify the minimum version for CMake
cmake_minimum_required(VERSION 3.10)

# Project's name
project(prog)

# --- COMPILER FLAGS -------------------------------------------------
# set g++ to g++12
# set(CMAKE_CXX_COMPILER "g++-12")
# set c to c12
# set(CMAKE_C_COMPILER "gcc-12")

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)

# --- OPTIONS ----------------------------------------------------------
# Tracing
option(USE_TRACER "Use tracing." OFF)
if(USE_TRACER)
  add_definitions(-DUSE_TRACER)
endif(USE_TRACER)

# Double-precision floating-point numbers
option(USE_DOUBLES "Use double-precision floating-point numbers." OFF)
if(USE_DOUBLES)
    add_definitions(-DUSE_DOUBLES)
endif(USE_DOUBLES)

# --- SOURCES ----------------------------------------------------------

# Collect all source files in the src directory
file(GLOB SOURCES "src/*.cpp")

# add include_directories ../../include
include_directories(../../include)


# Add executable target with source files
add_executable(${PROJECT_NAME} ${SOURCES})

# set_target_properties(${PROJECT_NAME} PROPERTIES
#     RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)

# link with libfmt
target_link_libraries(${PROJECT_NAME} fmt)