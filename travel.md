---
layout: page
title: Travelling, stories and pictures
permalink: /travel/
tags: photos travel

kalga:
  - path: /images/kalga-1.jpg
    caption: Photo 1
  - path: /images/kalga-2.jpg
    caption: Photo 2
  - path: /images/kalga-3.jpg
    caption: Photo 3
  - path: /images/kalga-4.jpg
    caption: Photo 4
  - path: /images/kalga-5.jpg
    caption: Photo 5
  - path: /images/kalga-6.jpg
    caption: Photo 6
---

Kalga
===

During July of 2021, I went to this village near Kasol, Himachal Pradesh, called Kalga. Kalga is 
the part of a triplet of villages, Pulga, Tulga and of course Kalga.

During my week long stay, I saw double rainbows, went hiking, saw natural waterfalls, and a lot
of stuff :)

Here are some pictures from my stay. Drop me an email at saivineet89@gmail.com for more info.

<a href='https://www.instagram.com/svineet_/' style='font-family:1em;'>
    <svg class="svg-icon">
        <use xlink:href="/assets/minima-social-icons.svg#instagram"></use>
    </svg>
    <span class="username">My Instagram</span>
</a>

<div class="photo-gallery">
  {% for image in page.kalga %}
    <img src="{{ image.path }}" alt="{{ image.caption }}"/>
  {% endfor %}
</div>


