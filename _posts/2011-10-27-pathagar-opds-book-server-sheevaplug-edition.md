---
categories: []
layout: project
title: Pathagar OPDS Book Server - SheevaPlug Edition
created: 1319744531
---
<h2>
	Brief instructions:</h2>
<p>This is a project that originated after meetings at the <a href="{{ site.baseurl }}/CommunitySummit2011" target="_blank">OLPC San Francisco Community Summit 2011</a>. This image is a ready-to-go image that can be bitcopied using <a href="http://en.wikipedia.org/wiki/Dd_%28Unix%29" target="_blank">dd</a> to a 2GB or greater USB stick, and plugged into a off-the-shelf <a href="http://en.wikipedia.org/wiki/SheevaPlug" target="_blank">SheevaPlug</a> to run a <a href="http://www.slideshare.net/sverma/pathagar-a-book-server" target="_blank">Pathagar</a> <a href="http://opds-spec.org/" target="_blank">OPDS</a> Book Server.&nbsp; Get the image via torrent at <a href="http://www.clearbits.net/torrents/1865-pathagar---sheevaplug-edition-v001" target="_blank">http://www.clearbits.net/torrents/1865-pathagar---sheevaplug-edition-v001</a></p>
<pre>
dd if=pathagar-sheevaplug-0.01.img of=/dev/sdb</pre>
<p>where sdb is your USB Stick. This process will create a boot partition, a root partition and a swap partition on the USB Stick.</p>
<p>The image is a Debian Squeeze image for ARM with Apache, sqlite, python, and python-django (Pathagar is written atop python-django). The image has two accounts:</p>
<ul>
	<li>
		root (password is password. Change it ASAP!)</li>
	<li>
		bookserver (password is password. Change it ASAP!)</li>
</ul>
<p>Pathagar runs in the bookserver account and the code sits at /home/bookserver/pathagar. The code we&#39;ve used for this iteration is git&#39;able from <a href="https://github.com/manuq/pathagar" target="_blank">https://github.com/manuq/pathagar</a></p>
<p>The image runs a dhcp client, so you&#39;ll have to get clever to figure out the IP it gets from your DHCP server. We use wireshark with a filter looking for the SheevaPlug&#39;s MAC address. you can always change the IP behavior using <a href="http://wiki.debian.org/NetworkConfiguration" target="_blank">the Debian Way</a>. Once running, you can find the book server interface at &lt;yourIPaddress&gt; running at port 80. To administer Pathagar, go to &lt;yourIPaddress&gt;/admin and use the account &quot;curator&quot; with password password (change it ASAP!) to admin the account.</p>
<p>Anything else? Let us know. <a href="mailto:sverma@sfsu.edu">sverma@sfsu.edu</a> or discuss on the mailing list at <a href="http://lists.laptop.org/listinfo/library" target="_blank">http://lists.laptop.org/listinfo/library</a></p>
<p>&nbsp;</p>
<div id="__ss_4782175" style="width:425px">
	<strong style="display:block;margin:12px 0 4px"><a href="http://www.slideshare.net/sverma/pathagar-a-book-server" target="_blank" title="Pathagar: A Book Server">Pathagar: A Book Server</a></strong><iframe frameborder="0" height="355" marginheight="0" marginwidth="0" scrolling="no" src="http://www.slideshare.net/slideshow/embed_code/4782175" width="425"></iframe>
	<div style="padding:5px 0 12px">
		View more <a href="http://www.slideshare.net/" target="_blank">presentations</a> from <a href="http://www.slideshare.net/sverma" target="_blank">Sameer Verma</a></div>
</div>
<p>&nbsp;</p>
