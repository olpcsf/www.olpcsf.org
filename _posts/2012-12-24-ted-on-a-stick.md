---
categories: []
layout: blog
title: TED on a Stick?
created: 1356375417
---
<p>I find <a href="http://www.ted.com" target="_blank">TED</a> talks to be quite interesting and invigorating. They challenge conventional thinking and provide interesting solutions. I&#39;ve even gone so far as to apply some of the recommendations from some of these talks - my favorite international travel water filter is the <a href="http://www.ted.com/talks/michael_pritchard_invents_a_water_filter.html" target="_blank">LifeSaver</a> bottle. Not only is it an amazing piece of technology, it came out of an approach where water provision is done through a decentralized local model, instead of a centralized global one. The LifeSaver is a filter that one can carry and drink from a local source, instead of relying on a centralized water source of questionable quality.</p>
<p>Anyway, coming back to the topic: To provide TED talks to a local community, so that they may get ideas to solve their own problems. For instance, how would the kids in <a href="http://bhagmalpur.wordpress.com" target="_blank">Bhagmalpur</a> get to TED? They can&#39;t, because we get no more than 2.4kbps over a mobile phone. So, if the kids can&#39;t get to TED, we take TED to them! TED talks are released under a Creative Commons license. There are over a thousand talks. Downloading these one at a time is a bit of work. Looking around, I found MetaTED.</p>
<p>From their <a href="http://metated.petarmaric.com/" target="_blank">site</a>:</p>
<p class="rteindent1"><em>&quot;metaTED is a tool that makes it easy to download all of the <a href="http://www.ted.com/">TED talks</a>. It does so by creating metalinks of TED talks varying in both the quality levels and possible talk groupings by directory.&quot;</em></p>
<p>The links are to a metalink file. Metalink files are XML files with data on the talks and where to get these. They look something like:</p>
<pre class="rteindent1">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;metalink version=&quot;3.0&quot; xmlns=&quot;http://www.metalinker.org/&quot;
          origin=&quot;http://metated.petarmaric.com/metalinks/TED-talks-in-high-quality.en.metalink&quot; type=&quot;dynamic&quot;
          pubdate=&quot;Wed, 01 Sep 2010 12:13:26 -0000&quot; refreshdate=&quot;Wed, 19 Dec 2012 02:00:10 -0000&quot;
          generator=&quot;metaTED 2.0.4&quot;&gt;
    &lt;publisher&gt;
        &lt;name&gt;Petar Marić&lt;/name&gt;
        &lt;url&gt;http://www.petarmaric.com/&lt;/url&gt;
    &lt;/publisher&gt;
    &lt;description&gt;Download TED talks with English subtitles encoded in high quality&lt;/description&gt;
    &lt;tags&gt;TED, download, video&lt;/tags&gt;
    &lt;files&gt;
        &lt;file name=&quot;Rives - The  4 a.m. mystery.en.srt&quot;&gt;
            &lt;resources&gt;
                &lt;url type=&quot;http&quot;&gt;http://tedsubtitles.appspot.com/getsubtitles?langcode=en&amp;amp;tedurl=http://www.ted.com/talks/rives_on_4_a_m.html&lt;/url&gt;
            &lt;/resources&gt;
        &lt;/file&gt;</pre>
<p>I used <a href="http://aria2.sourceforge.net/" target="_blank">aria2</a> to grab a subset of the files. I am using the low-quality Hindi subtitled files for use on the XO-1. <em>Note: The .srt files responsible for subtitles didn&#39;t come through.</em> <em>Maybe they are just not there for Hindi?</em></p>
<p>&nbsp;</p>
<pre class="rteindent1">
aria2c http://metated.petarmaric.com/metalinks/TED-talks-in-standard-quality.hi.metalink</pre>
<p>&nbsp;</p>
<p>After downloading these I got 1,368 items, totalling 9.8 GB. The XO plays Ogg Theora files natively in the Browse activity. So, I converted these to Ogg Theora format using <a href="http://v2v.cc/~j/ffmpeg2theora/" target="_blank">ffmpeg2theora</a>.</p>
<p><em>Note: Before converting, it&#39;s a good idea to backup the folder of TED talks so that you have a copy and you don&#39;t have to re-download 10GB or so in case you botch the conversion </em><img alt="smiley" height="20" src="{{ site.baseurl }}/sites/all/libraries/ckeditor/plugins/smiley/images/regular_smile.gif" title="smiley" width="20" /></p>
<p>To convert he MP4 files to Ogg Theora run at the command prompt:</p>
<pre class="rteindent1">

find &lt;path-to-mp4-downloads&gt; -name *.mp4 -exec ffmpeg2theora --videoquality 6 {} \;
</pre>
<p>&nbsp;</p>
<p>You will still have the MP4 files in the folders, so to remove those (save space, avoid confusion), you can run:</p>
<p>&nbsp;</p>
<pre class="rteindent1">
find &lt;path-to-mp4-downloads&gt; -name *.mp4 -exec rm {} \;</pre>
<p>&nbsp;</p>
<p>I did not find a discernible difference in changing the videoquality parameter from 6 to 10, although the file size did grow. So, I left the videoquality at 6. Alternatively, you can install the codec needed to play back H.264 video and AAC audio, which is what the TED Talks are encoded as.</p>
<p>So, I&#39;m walking around with a 16GB USB stick with all the TED talks. They play well on the XO-1. Pretty sweet!</p>
<p><img alt="" src="{{ site.baseurl }}/sites/default/files/u8/20121224_093559.jpg" style="width: 550px; height: 413px;" /></p>
