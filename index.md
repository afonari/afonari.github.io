---
layout: default
title: Alexandr Fonari
---

## Alexandr Fonari (firstname.lastname@gatech.edu)
Graduate Student, Department of Chemistry  
Georgia Institute of Technology (GT), Atlanta, GA, 30332-0400.

I apply mathematical models (implemented in computer programs) to solve physical problems in the area of organic electronics.
My [resume](resume.html).

### Research projects
 - [Effective mass calculator for semiconductors](emc/)

### Notes on the things related to my research

{% for post in site.posts %}
 - {{ post.date | date_to_string }} [{{ post.title }}]({{ post.url }})
{% endfor %}

