<!DOCTYPE html>
<html lang="en">
<head>
	<title> CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- CSS 	
	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
	<link href="/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
	-->
	<!--[if lt IE 9]>
	<link href="/css/style.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href="/css/style.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 941px)" />
	<link href="/css/style-tablet-responsive.css" rel="stylesheet" media="only screen and (min-width: 516px) and (max-width: 940px)" />		<!-- SWITCH TO SMALLER, RESPONSIVE LIQUID LAYOUT -->
	<link href="/css/style-responsive.css" rel="stylesheet" media="only screen and (max-width: 515px)" />		<!-- SWITCH TO SMALLEST, RESPONSIVE LIQUID LAYOUT -->
	<link href="/css/colorizer.css" rel="stylesheet" type="text/css" />
	<link href="/css/jplayer-gray.css" rel="stylesheet" type="text/css" />		<!-- HTML5 AUDIO PLAYER -->
	
	
	<!-- UPDATE BROWSER WARNING IF IE 7 OR LOWER -->
	<!--[if lt IE 8]>
	<link href="/css/stop_ie.css" rel="stylesheet" type="text/css" />		
	<![endif]-->
	
	<!-- JAVASCRIPTS -->
	
	<!-- ENABLE HTML5 FOR IE -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/js/html5shiv.js"></script>	
	<![endif]-->
	
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>	
	<script type="text/javascript" src="/js/jquery-ui-1.8.17.custom.min.js"></script>
	<script type="text/javascript" src="/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="/js/jquery.elastic.js"></script>
	<script type="text/javascript" src="/js/jquery.twitter.js"></script>		
	<script type="text/javascript" src="/js/contact_form.js"></script>	
	<script type="text/javascript" src="/js/jquery.jplayer.min.js"></script>		<!-- HTML5 AUDIO PLAYER -->
	<script type="text/javascript" src="/js/startup.js"></script>
		
		
	<!-- HTML5 AUDIO PLAYER (JPLAYER.ORG) -->
	<script type="text/javascript">	
	$(document).ready(function(){

		$("#jquery_jplayer_1").jPlayer({
			ready: function () {
				$(this).jPlayer("setMedia", {
					m4a: "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
					oga: "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
				});
			},
			swfPath: "swf",
			supplied: "m4a, oga"
		});
	});
	</script>
	
  <style>
    .error { color: red; }
  </style>  	
	
</head>
<body>

	<!-- DISPLAY MESSAGE IF JAVA IS TURNED OFF -->
	<noscript>		
		<div id="notification">Please turn on javascript in your browser for the maximum experience!</div>
	</noscript>
	
	<!-- DISPLAY THIS MESSAGE IF USER'S BROWSER IS IE7 OR LOWER -->
	<div id="ie_warning"><img src="${pageContext.request.contextPath}/images/warning.png" alt="IE Warning" /><br /><strong>Your browser is out of date!</strong><br /><br />This website uses the latest web technologies so it requires an up-to-date, fast browser!<br />Try <a href="http://www.mozilla.org/en-US/firefox/new/?from=getfirefox">Firefox</a> or <a href="https://www.google.com/chrome">Chrome</a>!</div>
	
	<div id="toTop"><img src="${pageContext.request.contextPath}/images/back_to_top.png" alt="Back to top" title="Back to top" /></div>

	<!-- BACKGROUND IMAGE -->
	<div id="background_repeat">
	<div id="background">
	
	<div id="boxed-page-shadow"></div>
	<div id="wrapper-boxed-page-top"></div>
	<div id="wrapper-boxed-page">			
		<header>
			<!-- LOGO -->
			<div id="logo">
				<a href="index.html"><img src="${pageContext.request.contextPath}/images/logo-red.png" alt="logo" /></a>
			</div>
		
			<!-- MENU -->
			<nav>
				<ul id="menu">
					<li><a href="index-boxed.html">HOMEPAGE</a>
						<ul>	
							<li><a href="index-boxed.html">BOXED VERSION</a></li>
							<li><a href="index.html">UNBOXED VERSION</a></li>
							<li><a href="#">3RD LEVEL MENU <img src="${pageContext.request.contextPath}/images/list-1.png" alt="arrow" /></a>
								<ul>
									<li><a href="#">SAMPLE MENU ONE</a></li>
									<li><a href="#">SAMPLE MENU TWO</a></li>
									<li><a href="#">SAMPLE MENU THREE</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="current"><a href="#">BLOGS</a>
						<ul>	
							<li><a href="blog-boxed-small.html">SMALL THUMBS</a></li>
							<li><a href="blog-boxed-large.html">LARGE THUMBS</a></li>
							<li><a href="post-boxed.html">A POST</a></li>
						</ul>
					</li>
					<li><a href="portfolio-boxed.html">PORTFOLIO</a></li>
					<li><a href="gallery-boxed.html">GALLERY</a></li>
					<li><a href="stylings-boxed-text.html">STYLINGS</a>
						<ul>	
							<li><a href="stylings-boxed-text.html">TYPOGRAPHY</a></li>
							<li><a href="stylings-boxed-table.html">TABLE &amp; COLUMNS</a></li>
							<li><a href="stylings-boxed-tabs.html">TABS, TOGGLES, CAROUSEL</a></li>
							<li><a href="stylings-boxed-form.html">CONTACT FORM &amp; BUTTONS</a></li>
						</ul>
					</li>
				</ul>
				<!-- 
				<select id="responsive-menu">
					<option value="" selected="selected">Please choose page</option>
					<option value="index-boxed.html">Homepage</option>
						<option value="index-boxed.html">- Boxed version</option>
						<option value="index.html">- Unboxed version</option>
						<option value="post-boxed.html">- A post</option>
					<option value="blog-boxed-small.html">Blogs</option>
						<option value="blog-boxed-small.html">- Small thumbs</option>
						<option value="blog-boxed-large.html">- Large thumbs</option>
					<option value="portfolio-boxed.html">Portfolio</option>
					<option value="gallery-boxed.html">Gallery</option>
					<option value="stylings-boxed-text.html">Stylings</option>
						<option value="stylings-boxed-text.html">- Typography</option>
						<option value="stylings-boxed-table.html">- Table &amp; Columns</option>
						<option value="stylings-boxed-tabs.html">- Tabs, Toggles, Carousel</option>
						<option value="stylings-boxed-form.html">- Contact form &amp; Buttons</option>
				</select>
				 -->
			</nav>
			
			
		</header>
		
		<div class="separator"></div>
				
		<!-- HEADING -->
		<section class="page_heading a">
			<header class="heading">
				<h1>RECENT POSTS</h1>
				<!--  <h3>FROM THE BLOG</h3>  -->												
			</header>						
			<div class="heading_line"><span class="overlay"></span></div>
		</section>
 		
						
		<!-- BLOG POSTS -->
		<section id="content">
		