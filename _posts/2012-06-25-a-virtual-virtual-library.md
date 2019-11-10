---
categories: []
layout: blog
title: A Virtual Virtual Library
created: 1340647067
---
<p>This is a virtual (as in digital) library, running inside a virtual machine. So, the title isn&#39;t a typo <img alt="smiley" height="20" src="http://olpcsf.org/sites/all/libraries/ckeditor/plugins/smiley/images/regular_smile.gif" title="smiley" width="20" /></p>
<p>This is a joint effort between me and Alex Kleider, who helped me debug, test and document the endeavor (or endeavour, as Alex would put it). The documentation and virtual machine took shape, largely driven by our need to have the <a href="http://www.slideshare.net/sverma/pathagar-a-book-server" target="_blank">Pathagar Book Server</a> running on a <a href="https://www.globalscaletechnologies.com/t-dreamplugdetails.aspx" target="_blank">DreamPlug</a> for Madagascar. To that end, we sat down and installed Pathagar on a virtual machine and documented the steps. We used <a href="http://en.flossmanuals.net/e-book-enlightenment/the-pathagar-book-server/" target="_blank">James Simmons&#39; instructions</a> as a starting point. While the original Pathagar application was <a href="https://github.com/sayamindu/pathagar" target="_blank">written by Sayamindu Dasgupta and Kushal Das</a>, we used <a href="https://github.com/manuq/pathagar" target="_blank">Manuel Quinones&#39; version</a> that has some more tweaks and fixes.</p>
<p>To get started:</p>
<ol>
	<li>
		Grab and install a copy of your favorite virtualization platform such as <a href="http://www.vmware.com/products/player/" target="_blank" title="VMWare Player">VMPlayer</a> or <a href="https://www.virtualbox.org/" target="_blank" title="VirtualBox">Virtualbox</a>. I use VirtualBox under Ubuntu 12.04 LTS, which is where I built this VM (VM itself is a Ubuntu 12.04 LTS 32 bit server build). Your experience with other VM environments may vary.</li>
	<li>
		Download the OVA file from <a href="http://dev.laptop.org/~sverma/pathagar/vm-pathagar.ova.zip" target="_blank">http://dev.laptop.org/~sverma/pathagar/vm-pathagar.ova.zip</a></li>
	<li>
		<a href="https://en.wikipedia.org/wiki/Md5sum" target="_blank" title="Check md5sum">Check the md5sum hash</a> of the file. md5sum of the <em>vm-pathagar.ova.zip</em> file is 61102e9ca59aa34008d3163aa5dde8fc. After you unzip the file, md5sum of the <em>vm-pathagar.ova</em> file should be ce6414f6c7b1c901211fc5f366a9e135</li>
	<li>
		<div>
			In VirtualBox, go to <em>File | Import Appliance</em> and point to the OVA file. This will import the VM into your machine. Be sure to adjust the RAM etc. to your liking. I&rsquo;ve set it at 1024MB.</div>
	</li>
	<li>
		Before you start your VM, go into <em>Machine | Settings</em> and check the <em>Network</em> settings. Bridge the VM&#39;s interface to your network&#39;s interface. When testing this on my laptop, I bridge the network to wlan0, which talks to my Wi-Fi network at home. The VM is set to expect an IP address via DHCP from this interface.</li>
	<li>
		Start your VM. When booted up, login as <em>pat</em>. Password is <em>pat::hagar</em></li>
	<li>
		As a responsible citizen, change the password to your liking.</li>
	<li>
		<em>ifconfig</em> will give you your VM&#39;s IP address. Go to a browser on your network (host machine or other computer) and plug in your IP in the browser. You should be looking at Pathagar&#39;s opening page with a few preloaded books.</li>
	<li>
		To administer the book server, go to &lt;IP address&gt;/admin and log in as bsadmin (password bs::admin). Create accounts as you see fit.</li>
	<li>
		To simply add books, log in using the &quot;Login&quot; link on the upper right of the Pathagar page, and add books using the &quot;Add Books&quot; link on the upper right as well.</li>
</ol>
<p>&nbsp;</p>
<p><a href="/sites/default/files/u8/Screenshot from 2012-06-23 19%3A23%3A33.png"><img alt="" src="/sites/default/files/u8/Screenshot%20from%202012-06-23%2019%3A23%3A33.png" style="width: 319px; height: 245px;" /></a><a href="/sites/default/files/u8/Screenshot from 2012-06-23 19%3A24%3A03.png"><img alt="" src="/sites/default/files/u8/Screenshot%20from%202012-06-23%2019%3A24%3A03.png" style="width: 319px; height: 245px;" /></a><a href="/sites/default/files/u8/Screenshot from 2012-06-23 19%3A27%3A53.png"><img alt="" src="/sites/default/files/u8/Screenshot%20from%202012-06-23%2019%3A27%3A53.png" style="width: 320px; height: 273px;" /></a><a href="/sites/default/files/u8/Screenshot from 2012-06-23 20%3A03%3A55.png"><img alt="" src="/sites/default/files/u8/Screenshot%20from%202012-06-23%2020%3A03%3A55.png" style="width: 320px; height: 265px;" /></a><a href="/sites/default/files/u8/Screenshot from 2012-06-26 20%3A12%3A54.png"><img alt="" src="/sites/default/files/u8/Screenshot%20from%202012-06-26%2020%3A12%3A54.png" style="width: 640px; height: 452px;" /></a></p>
<p>&nbsp;</p>
