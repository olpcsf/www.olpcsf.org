---
---

<img src="https://www.olpcsf.org/sites/default/files/images/olpcsf_title.png"
alt="One Laptop Per Child San Francisco logo">

{% for post in site.posts limit:10 %}
<h2><a href="{{ post.url | prepend: site.baseurl}}">{{ post.title | escape }}</a></h2>
<p style="font-size: small; font-style: italic; color: grey;">Submitted {% if post.author %}by {{ post.author }} {% endif %}on {{ post.created | date: "%Y-%m-%d %H:%M" }}</p>
<p>{{ post.content | strip_html | truncatewords: 50 }}</p>
{% endfor %}
