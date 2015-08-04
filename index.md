---
layout: default
title: Alexandr Fonari
---

### Summary

Graduate Student, Department of Chemistry,  
Georgia Institute of Technology, Atlanta, GA, 30332

![](me.jpg)

I develop software to solve scientific problems with more than five years of experience with Perl, Python and Fortran languages. I use HPC technologies like OpenMPI and GlobalArrays on a day-by-day basis. My scientific expertise includes: condensed matter physics, simulation of the electronic devices and software developing.

I have made contributions to quantum chemistry and condensed matter software packages: NWChem (5M+ lines) and Quantum Espresso (500K+ lines). I have 10+ peer reviewed articles published.

### News

 - [29 Jul 2015]: Got my PhD! [Thesis PDF](http://afonari.com/FONARI-DISSERTATION-2015.pdf).
 - [02 Jul 2015]: Added list of publications (top menu &uarr;)
 - [05 Jun 2015]: *Mode-selective vibrational modulation of charge transport* manuscript accepted to Nature Communications!

### Research projects

 - [Effective mass calculator for semiconductors](emc/)  
Python script that allows to evaluate [effective mass](http://ecee.colorado.edu/~bart/book/effmass.htm) in the band extrema using *CRYSTAL* or *VASP* codes. *Quantum Espresso* support is coming soon!

### Notes

{% for post in site.posts %}
 - [{{ post.date | date_to_string }}]: [{{ post.title }}]({{ post.url }})
{% endfor %}

