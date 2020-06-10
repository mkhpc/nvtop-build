# Automation file name: nvtop-centos-v1.0.sh
# Author: Mandeep Kumar
# Date: 10-June-2020
# Purpose: Installation of NVidia TOP, a (h)top like task monitor for NVIDIA GPUs on Cloud and On-Premise
# Language of Script: bash
# Tested OS: CentOS 6/7 

#! /bin/bash

# working directory
WORKDIR="$HOME/pkg/"

# installation path
INSTALLDIR="/opt/apps"

# CMake, ncurses and git installation
sudo yum install -y cmake ncurses-devel git 

# get the source code
cd $WORKDIR
git clone https://github.com/Syllo/nvtop.git

# create the build directory
mkdir -p nvtop/build && cd nvtop/build

# build
cmake .. -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} 
make 
make install

# Notes
#
#   # If it errors with "Could NOT find NVML (missing: NVML_INCLUDE_DIRS)"
#     try the following command instead, otherwise skip to the build with make.
#      cmake .. -DCMAKE_INSTALL_PREFIX=${INSTALLDIR} -DNVML_RETRIEVE_HEADER_ONLINE=True  
#
#   #  The build system supports multiple build type (e.g. -DCMAKE_BUILD_TYPE=RelWithDebInfo):
#      1. Release: Binary without debug information
#      2. RelWithDebInfo: Binary with debug information
#      3. Debug: Compile with warning flags and address/undefined sanitizers enabled (for development purposes)
