---
layout: default
title: Installing Quantum Espresso 5 on Cray-XE
---

## {{ page.title }}

Instructions are given in *pw_forum* mailing list \[1\]. To summarize:

1. Swap or load module containing pgi compiler (```module swap PrgEnv-cray PrgEnv-pgi```)
1. Then run: ```./configure --enable-openmp --enable-parallel --with-scalapack ARCH=crayxt``` to configure Makefile
1. In the *make.sys* file, DFLAGS should look similar to (note ```-D__IOTK_WORKAROUND1``` flag):  
```DFLAGS = -D__IOTK_WORKAROUND1 -D__PGI -D__FFTW -D__MPI -D__PARA -D__SCALAPACK -D__OPENMP $(MANUAL_DFLAGS)```
1. Then, depending on your needs, compile necessary packages (```make pw ph```). To see the list of packages, run ```make``` with no options.

I have successfully compiled QE 5.0.3 this way on a Cray XE6 machine.

\[1\] *\[Q-e-developers\] Compiling error on Cray XE6 (UNCLASSIFIED)*: http://qe-forge.org/pipermail/q-e-developers/2012-August/000344.html