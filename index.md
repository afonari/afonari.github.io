---
layout: default
title: Alexandr Fonari
---

## Alexandr Fonari (firstname.lastname@gatech.edu)
Graduate Student, Department of Chemistry,  
Georgia Institute of Technology (GT), Atlanta, GA, 30332-0400.

I develop software to solve scientific problems. I have more than five years of experience with Perl, Python and Fortran languages. I use HPC technologies like OpenMPI and GlobalArrays on a day-by-day basis. My scientific expertise includes: condensed matter physics, simulation of the electronic devices, software seveloping.

I have made contributions to quantum chemistry and condensed matter software packages: NWChem (5M+ lines) and Quantum Espresso (500K+ lines). I have 10+ peer reviewed articles published.

My [resume](alexandr-fonari-resume.pdf).

### Research projects
 - [Effective mass calculator for semiconductors](emc/)  
Python script that allows to evaluate [effective mass](http://ecee.colorado.edu/~bart/book/effmass.htm) in the band extrema using *CRYSTAL* or *VASP* codes. *Quantum Espresso* support is coming soon!

### Research-related notes

{% for post in site.posts %}
 - [{{ post.date | date_to_string }}]: [{{ post.title }}]({{ post.url }})
{% endfor %}

