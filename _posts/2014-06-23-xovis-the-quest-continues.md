---
categories: []
layout: blog
title: 'XOVis: The quest continues'
created: 1403513895
---
<p><em>Note: Slides for this project are now posted to Slideshare at http://www.slideshare.net/sverma/xovis-analyticsvisualizationsugarolpc-36184541</em></p>
<p><em>Update: Martin Dluhos has published a post at OLENepal&#39;s blog site, which was written independent of this post, but acts as a good companion to this post, especially highlighting the ways in which OLENepal can compare data across schools. http://blog.olenepal.org/index.php/archives/902</em></p>
<p>The <a href="http://wiki.sugarlabs.org/go/Education_Team/Quest_for_Data" target="_blank">&quot;Quest for Data&quot;</a> project has been going on for a while now. You can take a look at <a href="{{ site.baseurl }}/node/204" target="_blank">previous</a> <a href="http://olpcjamaica.org.jm/blog/peering-journal-data" target="_blank">posts</a> to get an idea, but the short of it is that we&#39;ve had several efforts to gather data that allows us to peek into the usage behavior of projects. These have happened in Paraguay, Jamaica, Australia, India, Peru and a few other places. <a href="https://github.com/martasd/xovis" target="_blank">XOVis</a> is a newer incarnation in that string of efforts. Thankfully, this one builds on the foundations of some of the previous ones.<br />
	<a href="https://en.wikipedia.org/wiki/Learning_analytics" target="_blank"><br />
	Learning Analytics</a> is defined as a process with four phases: measurement, collection, analysis and reporting. In case of <a href="http://sugarlabs.org/" target="_blank">Sugar</a>, the measurement happens within each activity - more specifically through its metadata - where we use proxies such as <em>start time, collaboration, type of activity, file produced</em>, etc. to assess a level of engagement. For the purposes of this post, we&#39;ll go with the assumption that these proxies imply correlation with engagement, and therefore to learning (yes, this is a big assumption, but this is a blog post, and not a double-blind peer reviewed journal paper, so I won&#39;t get into it here).<br />
	<br />
	Visualization is an important stage in the reporting process, although by itself, it may lead to incomplete assessments. Visualization tends to be used with aggregates, that is the aggregate behavior of a classroom , school or a collection of schools. So, for instance, we may be interested in seeing how a group of children use Sugar activities during school hours versus outside of school hours (for those fortunate deployments where the laptop goes home).<br />
	<br />
	The data flow is from the laptop&#39;s <a href="http://wiki.laptop.org/go/Journal_Activity" target="_blank">Journal</a>, to an <a href="http://wiki.laptop.org/go/Ds-backup" target="_blank">automated Journal backup</a> set on the School Server (<a href="http://wiki.laptop.org/go/School_server" target="_blank">XS</a> or <a href="http://wiki.laptop.org/go/XS_Community_Edition" target="_blank">XSCE</a>), to the extraction of metadata, to aggregate analysis and finally visualization. There are several ways to do this, but we chose to look at a three-tier architecture: The laptop&#39;s Journal, The School Server and the hypothetical Ministry of Education or NGO central cloud service. Metadata flows from XO to XS[CE] via automated rsync backups. Metadata flows from XS[CE] to the Ministry/NGO central server through a mechanism explained below.</p>
<p><img alt="XOVis architecture" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-architecture.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>At this point, I must specify that the XOVis application was written by <a href="https://github.com/martasd" target="_blank">Martin Dluhos</a>, while he was working at <a href="http://olenepal.org" target="_blank">OLE Nepal</a>, while I helped with the overall architecture, based on my experiences in <a href="http://olpcjamaica.org.jm" target="_blank">Jamaica</a> and <a href="http://bhagmalpur.wordpress.com" target="_blank">India</a>, and <a href="http://www.andreasgros.net/visualizations/" target="_blank">Andi Gros</a> helped with the visualization front-end. The work that Martin did is thankfully built on top of what <a href="https://github.com/rgs1" target="_blank">Ra&uacute;l Guti&eacute;rrez Segal&eacute;s</a> and <a href="https://github.com/Leotis" target="_blank">Leotis Buchanan</a> did earlier in Paraguay and Jamaica respectively. We also involved input from <a href="https://github.com/tchx84" target="_blank">Martin Abente Lahaye</a> about Australia&#39;s <a href="https://github.com/tchx84/harvest-server" target="_blank">Harvest</a> system, and <a href="https://github.com/m-anish" target="_blank">Anish Mangal</a> about <a href="http://wiki.sugarlabs.org/go/Platform_Team/Usage_Statistics" target="_blank">sugar-stats</a>, and were mindful to create an architecture that can accommodate both systems (these other systems will need some coding labor, of course).<br />
	<br />
	Resuming the explanation, one of the key issues was to deal with the problem of offline and intermittent connectivity to School Servers. We needed a glue that connected the School Server to a central location, and would be resilient to pick up sync where it left off, and do so without human intervention (very much like rsync). Then we would need an engine to aggregate the data across different cross comparisons - averages and comparisons of usage by day, by month, by year, etc. This is where CouchDB magic comes in. CouchDB can:</p>
<ol>
	<li>
		Store data as json documents at the School Server.</li>
	<li>
		Generate aggregates using MapReduce.</li>
	<li>
		Store the visualization front-end (HTML+JavaScript).</li>
	<li>
		Synchronize from School Server to Ministry-of-Education/NGO over broken/intermittent connections (can also use a USB stick sneakernet).</li>
	<li>
		Make coffee while running all of the above (ok, so that&#39;s not true)</li>
</ol>
<p>Could we use CouchDB to address all these needs? Yes! So, we used CouchDB to do #1, #2, #3, and #4. For #5, you are on your own :-)</p>
<p><img alt="" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-couchdb.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>&nbsp;</p>
<p>So, this is somewhat how it goes. You can head over to GitHub (<a href="https://github.com/martasd/xovis" target="_blank">https://github.com/martasd/xovis</a>) and grab the code. If using a XS (I haven&#39;t tested yet) I&#39;d recommend that you install by hand, using the</p>
<pre class="rteindent1">
./scripts/install_xovis.sh </pre>
<p>script. If you are running your project on XSCE, use the ansible playbook for xovis.</p>
<pre class="rteindent1">
./runansible </pre>
<p>will play all playbooks and install all services, including xovis. To install xovis only, do</p>
<pre class="rteindent1">
ansible-playbook -i ansible_hosts xsce.yml --connection=local --tags=&quot;xovis&quot;</pre>
<p>Next, make sure that you have Journal backups in</p>
<pre class="rteindent1">
/library/users</pre>
<p>If you have registered XOs with this School Server, the backups will start to happen automatically (takes 30 minutes or so). If you have user backups, then you can run the <em>process_journal_stats.py</em> script to do a bunch of things.</p>
<p><img alt="" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-dfd.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>&nbsp;</p>
<pre class="rteindent1">
process_journal_stats.py all </pre>
<p>will export metadata to comma-separated value (csv) format for analysis in Excel, LibreOffice or R.</p>
<pre class="rteindent1">
process_journal_stats.py activity</pre>
<p>will spit out stats for activities</p>
<pre class="rteindent1">
process_journal_stats.py dbinsert xovis --deployment &lt;deployment-name&gt; --server http://admin:admin@127.0.0.1:5984</pre>
<p>will push the metadata into the local CouchDB database on the School Server. Note that the admin:admin userid:password may/should change.</p>
<p>Next, to visualize what your deployment has been up to, open up a browser on a machine connected to your School Server. Go to</p>
<pre class="rteindent1">
http://schoolserver:5984/&lt;deployment-name&gt;/_design/xovis-couchapp/index.html</pre>
<p>Pick your deployment from the dropdown and click on a button to check out the visualization!</p>
<p><img alt="Frequency of use" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-activity-freq.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>Frequency of use</p>
<p>&nbsp;</p>
<p><img alt="Activities tracked by month" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-activity-year.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>Activities by month</p>
<p>&nbsp;</p>
<p><img alt="Activities by time of day" src="{{ site.baseurl }}/sites/default/files/u8/xovis-analytics-visualization-sugar-olpc-time-of-day.png" style="width: 800px; height: 600px; border-width: 1px; border-style: solid;" /></p>
<p>Activities by time of day</p>
