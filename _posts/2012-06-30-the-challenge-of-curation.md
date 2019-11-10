---
categories: []
layout: blog
title: The challenge of curation
created: 1341040160
---
<p>Last year, right after the <a href="http://olpcs.org/Community Summit 2011" target="_blank">OLPC SF Community Summit 2011</a>, I had the pleasure of attending <a href="http://bib.archive.org/" target="_blank">Books in Broswers</a> (BiB-II) at the <a href="http://archive.org" target="_blank">Internet Archive</a>. It was a plan made with <a href="https://en.wikipedia.org/wiki/User:Sj" target="_blank">SJ</a> on-the-fly to take the <a href="http://www.slideshare.net/sverma/pathagar-a-book-server" target="_blank">Pathagar OPDS Book Server</a> and put it on a <a href="http://olpcsf.org/projects/pathagar-sheevaplug-edition" target="_blank">4-watt SheevaPlug</a>. The very cool and awesome duo of <a href="https://en.wikipedia.org/wiki/Mary_Lou_Jepsen" target="_blank">Mary Lou Jepsen</a> and <a href="http://www.pixelqi.com/about_us" target="_blank">John Ryan</a> helped us present the unit (it was a last minute thing...we weren&#39;t on the agenda). We even live-tested the unit. About 150 people hit the box and it held up. Load tests revealed that the plug server could serve 500 simultaneous users!</p>
<p>&nbsp;</p>
<p>&nbsp;<iframe allowfullscreen="" frameborder="0" height="315" src="http://www.youtube.com/embed/ikvwj54koLk" width="560"></iframe></p>
<p>&nbsp;</p>
<p>So, we had a self-contained book server, that could run off a solar panel, and arguably serve thousands of books in the middle of nowhere - a Wi-Fi bubble, that serves up books to all within its reach.&nbsp; Heck, we even have a <a href="http://olpcsf.org/node/60" target="_blank">virtual machine, complete with Pathagar</a> on it!</p>
<p>Where do we get the books? The Internet Archive of course! With its 3 million plus books, its a vast ocean to fish from. The bigger challenge is the fishing part.</p>
<ol>
	<li>
		How do you curate content for your little Wi-Fi bubble?</li>
	<li>
		And once you do so, how do you pull it all together?</li>
</ol>
<p>Raj Kumar (<a href="https://twitter.com/rajbot" target="_blank">@rajbot</a>) at the Internet Archive had the answer. They have this script they have been working on, which pulls the books/media directly form the Archive. The script needs to be fed a bookmark file, that one may create after signing up at the Internet Archive. After a few conversations and a few trials, Raj has pointed me to the very cool <a href="https://github.com/rajbot/fetch_ia_item" target="_blank">fetch_IA_item</a> script.&nbsp;</p>
<p>To get rolling:</p>
<ol>
	<li>
		Sign up for an account on the <a href="http://archive.org/account/login.php" target="_blank">Internet Archive</a>.</li>
	<li>
		Log in</li>
	<li>
		Look for stuff on the Archive&#39;s pages, and when you find something interesting, bookmark it.</li>
	<li>
		Go to your &quot;Patron Info&quot; page, and grab the link for your bookmark file.</li>
	<li>
		Go to <a href="https://github.com/rajbot/fetch_ia_item" target="_blank">https://github.com/rajbot/fetch_ia_item</a> and get the script either as a zip file, or via git
		<ul>
			<li>
				<span style="font-family: courier new,courier,monospace;">git clone git://github.com/rajbot/fetch_ia_item.git</span></li>
		</ul>
	</li>
	<li>
		In the <em>fetch_IA_item</em> folder, edit the <em>fetch_IA_item.py</em> file and replace the sample user id with your own archive.org id (mine is <em>sverma</em>, as in the example).</li>
	<li>
		Run it. You&#39;ll need python for this.
		<ul>
			<li>
				<span style="font-family: courier new,courier,monospace;">python fetch_IA_item.py</span></li>
		</ul>
	</li>
	<li>
		If you have books or other media in your bookmarks, the media and its metadata will start coming in. You can interrupt in the middle (<em>CTRL-c</em>) and pick up where you left off.</li>
</ol>
<p>Works like a charm! Thank you Raj and the team at the Internet Archive. You guys rock!</p>
<p>Next, we need to work on getting the metadata into an appropriate json or csv format for Pathagar, but that&#39;s another project.</p>
