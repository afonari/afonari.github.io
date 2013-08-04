#!/bin/bash

# make sure you change NWCHEM_TOP appropriately!

export NWCHEM_TOP=/Users/pie/nwchem-6.3-src.2013-05-28
export NWCHEM_TARGET=MACX64
export NWCHEM_MODULES="qm"

export MPI_LOC=/usr/local #location of openmpi installation 
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