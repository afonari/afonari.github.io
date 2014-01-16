---
layout: default
title: Installing NWChem 6.3 on MacOS X Mountain Lion
---

## {{ page.title }}

### Prerequisites

#### 1. GCC and gfortran
See [here](https://sites.google.com/site/dwhipp/tutorials/mac_compilers#mlion) instructions for installing gcc and gfortran by David M. Whipp.

My two cents:

 * The separate installation package of the command line tools is available from the [Apple Developer site](https://developer.apple.com/downloads/index.action?=Command%20Line%20Tools%20%28OS%20X%20Mountain%20Lion%29) (free registration required). Also see the [SO thread](http://stackoverflow.com/questions/9353444/how-to-use-install-gcc-on-mac-os-x-10-8-xcode-4-4).
 * Instead of separate ```gunzip``` and ```tar -xvf``` one can use:  
```sudo tar -zxvf gcc-mlion.tar.tar.gz -C /```

#### 2. openmpi
See [here](https://sites.google.com/site/dwhipp/tutorials/installing-open-mpi-on-mac-os-x) instructions by David M. Whipp again.

### Compiling NWChem
 1. Download NWChem ([version](http://www.nwchem-sw.org/images/Nwchem-6.3.revision1-src.2013-05-28.tar.gz) used in this tutorial).
 1. Unpack it: ```tar -zxvf Nwchem-6.3.revision1-src.2013-05-28.tar.gz```
 1. Change directory to `nwchem-6.3-src.2013-05-28/`
 1. Define environment variables: `source vars.sh` (see below contents of the vars.sh file)
 1. Charge directory to `src/`
 1. Run `make nwchem_config`
 1. Run `make &> make.log`

Run NWChem as:  
`mpirun -n 4 /Users/user/nwchem-6.3-src.2013-05-28/bin/MACX64/nwchem in.nw &> out.nw`

### Some helpful reference data

Contents of the `vars.sh`:
```bash
#!/bin/bash

export NWCHEM_TOP=/Users/user/nwchem-6.3-src.2013-05-28
export NWCHEM_TARGET=MACX64
export NWCHEM_MODULES="qm"

export MPI_LOC=/usr/local #location of the openmpi installation 
export MPI_LIB=$MPI_LOC/lib
export MPI_INCLUDE=$MPI_LOC/include 
export LIBMPI="-lmpi_f90 -lmpi_f77 -lmpi"
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y

export FC=gfortran
export CC=gcc
export F77=gfortran

export HAS_BLAS=no
export USE_NOFSCHECK=TRUE
export LARGE_FILES=TRUE

```

GCC version used:
```bash
$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/x86_64-apple-darwin12.3.0/4.8.1/lto-wrapper
Target: x86_64-apple-darwin12.3.0
Configured with: ../gcc-4.8-20130404/configure --enable-languages=fortran,c++
Thread model: posix
gcc version 4.8.1 20130404 (prerelease) (GCC)
```

Gforgran version used:
```bash
$ gfortran -v
Using built-in specs.
COLLECT_GCC=gfortran
COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/x86_64-apple-darwin12.3.0/4.8.1/lto-wrapper
Target: x86_64-apple-darwin12.3.0
Configured with: ../gcc-4.8-20130404/configure --enable-languages=fortran,c++
Thread model: posix
gcc version 4.8.1 20130404 (prerelease) (GCC)
```
