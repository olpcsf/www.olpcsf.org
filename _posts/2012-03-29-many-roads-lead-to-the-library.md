---
categories: []
layout: blog
title: Many roads lead to the Library
created: 1333040986
---
<p>Many deployments use a school server. Some use the <a href="http://wiki.laptop.org/go/School_server" target="_blank">official OLPC XS</a>, while others use homegrown boxes to serve content, updates, etc. The official OLPC XS School Server (currently at version 0.7) uses <a href="http://moodle.org" target="_blank">Moodle </a>as its backbone. Even server admin scripts are hooked into the Moodle interface to run backups, manage theft deterrence and push updates.</p>
<p>&nbsp;</p>
<div id="__ss_4680042" style="width:425px">
	<strong style="display:block;margin:12px 0 4px"><a href="http://www.slideshare.net/sverma/xs-olpc-school-server" target="_blank" title="XS: OLPC School Server">XS: OLPC School Server</a></strong><iframe frameborder="0" height="355" marginheight="0" marginwidth="0" scrolling="no" src="http://www.slideshare.net/slideshow/embed_code/4680042" width="425"></iframe>
	<div style="padding:5px 0 12px">
		View more <a href="http://www.slideshare.net/" target="_blank">presentations</a> from <a href="http://www.slideshare.net/sverma" target="_blank">Sameer Verma</a></div>
</div>
<p>The one feature that&#39;s missing is a library. I&#39;m not quite sure how we would go about building a library via Moodle. however, we do have a parallel project called <a href="http://www.slideshare.net/sverma/pathagar-a-book-server" target="_blank">Pathagar</a>. This is a python-django based book server that serves books (actually any kind of a file) via a browser and also via OPDS so the <a href="http://activities.sugarlabs.org/en-US/sugar/addon/4304" target="_blank">Get Books</a> activity can hook into this directly.</p>
<p>We have several different platforms that run Pathagar. We even have a Debian-based version that <a href="http://olpcsf.org/projects/pathagar-sheevaplug-edition" target="_blank">runs off a SheevaPlug</a>! However, in terms of providing services, if there is a box that already provides services (such as the OLPC XS School Server) it does not make sense to have yet another box to provide library services. Perhaps we should run Pathagar in parallel, but on the same box and serve the books via a &quot;Library&quot; virtual host setting in Apache.</p>
<p>Another possibility would be to rewrite Pathagar in PHP and pull that into Moodle as a plug-in, but that&#39;s wishful thinking. I&#39;m going to try to build Pathagar (starting with <a href="http://en.flossmanuals.net/e-book-enlightenment/the-pathagar-book-server/" target="_blank">instructions from James Simmons</a>) on a XS 0.7 platform in parallel with the XS and report back.</p>
<p><img alt="" src="/sites/default/files/u8/Screenshot_1_2_3_4.png" style="width: 600px; height: 450px;" /></p>
