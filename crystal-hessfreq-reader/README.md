## HESSFREQ reader

**HESSFREQ reader** diagonalizes the Hessian written by CRYSTAL program \[1\] and writes frequencies and displacements into file similar to one generated using Quantum Espresso (see below). In order to obtain *HESSFREQ.DAT*, one needs to do a `FREQCALC` run. Format of the *HESSFREQ.DAT* file is:
```
FORMAT(1P,4E21.13)
```

## Usage
Run as:  
```
hessfreq_read HESSFREQ.DAT
```
Note, in the current directory file *masses* should also be present. It has structure:  
```
natoms (1 int)
mass of atom 1 in amu (1 float)
mass of atom 2 in amu (1 float)
[...]
mass of atom natoms in amu (1 float)
```

## Installation
```
gfortran -llapack -o hessfreq_read hessfreq_read.f90
```
Note, other compilers have not been tested. Although, should compile without lots of issues.

## Requirements
 1. gfortran
 1. LAPACK

## Running the Tests
TODO

## License
MIT.