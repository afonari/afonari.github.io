---
layout: default
title: Alexandr Fonari
---

Graduate Student, Department of Chemistry,  
Georgia Institute of Technology, Atlanta, GA, 30332

![Me](me.jpg)

I develop software to solve scientific problems with more than five years of experience with Perl, Python and Fortran languages. I use HPC technologies like OpenMPI and GlobalArrays on a day-by-day basis. My scientific expertise includes: condensed matter physics, simulation of the electronic devices and software developing.

I have made contributions to quantum chemistry and condensed matter software packages: NWChem (5M+ lines) and Quantum Espresso (500K+ lines). I have 10+ peer reviewed articles published.

My [resume](afonari_resume.pdf) (updated 07/2015).

### Research projects
 - [Effective mass calculator for semiconductors](emc/)  
Python script that allows to evaluate [effective mass](http://ecee.colorado.edu/~bart/book/effmass.htm) in the band extrema using *CRYSTAL* or *VASP* codes. *Quantum Espresso* support is coming soon!

### Useful one-liners
 - Install a locally stored pypi package in the user directory even if the package has been installed system-wise:  
`pip install --user --upgrade -e /path/to/un-tarred/folder`

### Research-related notes

{% for post in site.posts %}
 - [{{ post.date | date_to_string }}]: [{{ post.title }}]({{ post.url }})
{% endfor %}

