---
layout: default
title: Displacing atoms along a normal mode (phonon) in VASP
---

## {{ page.title }}

Sometimes \[1\] it is required to calculate a quantity which is the derivative of another quantity with respect to the normal mode. An example is the Raman activity, which is defined as the derivative of the polarization along the normal mode \[x\].

### How to run
1. Download the [archive](https://gist.github.com/alexandr-fonari/4452625/download). Repo is [here](https://github.com/alexandr-fonari/Main/tree/master/VASP).
1. Place **VASP-displace_10RC.pl** in your ```$PATH```.
1. Modify ```@displacements``` array (located at the beginning of the script) as desired.
1. Run in the directory that contains **vasprun.xml** file from the previous phonon calculation \[3\].
1. **DISPCAR** will be created, containing all the displaced geometries (total: ```length_of_@displacement_array*number_normal_modes```).

### Test for correctness
In order to be sure that the displacement is made along the harmonic potential energy surface of the mode, one can displace atoms by a characteristic length of the harmonic oscillator \[2\]. In this case, the difference between energies of the optimized and displaced geometries should equal to half of the energy of the mode (```deltaE == 1/2hv```).

### References
\[1\] https://github.com/alexandr-fonari/Main/blob/master/nonlocal-e-ph-phonons.md  
\[2\] http://en.wikiversity.org/wiki/Quantum_harmonic_oscillator  
\[3\] ```IBRION``` tag in the [VASP Manual](http://cms.mpi.univie.ac.at/vasp/vasp/IBRION_tag_NFREE_tag.html)
