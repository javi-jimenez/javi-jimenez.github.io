---
title: "Archives"
layout: page
permalink: /archives/
---

This page lists all posts by date.

{% for post in site.posts %}
- {{ post.date | date: "%Y-%m-%d" }} - [{{ post.title }}]({{ post.url }})
{% endfor %}
