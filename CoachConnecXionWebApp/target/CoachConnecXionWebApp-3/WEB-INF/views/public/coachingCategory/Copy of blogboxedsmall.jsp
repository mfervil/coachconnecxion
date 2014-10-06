<!DOCTYPE html>
<html lang="en">
<head>
	<title> CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!-- CSS -->	
	<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
	<link href="fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />
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
	<link href="css/stop_ie.css" rel="stylesheet" type="text/css" />		
	<![endif]-->
	
	<!-- JAVASCRIPTS -->
	
	<!-- ENABLE HTML5 FOR IE -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>	
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
	
</head>
<body>

	<!-- DISPLAY MESSAGE IF JAVA IS TURNED OFF -->
	<noscript>		
		<div id="notification">Please turn on javascript in your browser for the maximum experience!</div>
	</noscript>
	

	<!-- DISPLAY THIS MESSAGE IF USER'S BROWSER IS IE7 OR LOWER -->
	<div id="ie_warning"><img src="/${pageContext.request.contextPath}/images/warning.png" alt="IE Warning" /><br /><strong>Your browser is out of date!</strong><br /><br />This website uses the latest web technologies so it requires an up-to-date, fast browser!<br />Try <a href="http://www.mozilla.org/en-US/firefox/new/?from=getfirefox">Firefox</a> or <a href="https://www.google.com/chrome">Chrome</a>!</div>
	
	<div id="toTop"><img src="/${pageContext.request.contextPath}/images/back_to_top.png" alt="Back to top" title="Back to top" /></div>
	
	
		
	
	

	<!-- BACKGROUND IMAGE -->
	<div id="background_repeat">
	<div id="background">
	
	
	<div id="boxed-page-shadow"></div>
	<div id="wrapper-boxed-page-top"></div>
	<div id="wrapper-boxed-page">			
		<header>
			<!-- LOGO -->
			<div id="logo">
				<a href="index.html"><img src="/${pageContext.request.contextPath}/images/logo-red.png" alt="logo" /></a>
			</div>
		
		
			
			<!-- MENU -->
			<nav>
				<ul id="menu">
					<li><a href="index-boxed.html">HOMEPAGE</a>
						<ul>	
							<li><a href="index-boxed.html">BOXED VERSION</a></li>
							<li><a href="index.html">UNBOXED VERSION</a></li>
							<li><a href="#">3RD LEVEL MENU <img src="/${pageContext.request.contextPath}/images/list-1.png" alt="arrow" /></a>
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
			</nav>
			
			
		</header>
		
		<div class="separator"></div>
		
				
		<!-- HEADING -->
		<section class="page_heading a">
			<header class="heading">
				<h1>RECENT POSTS</h1>
				<h3>FROM THE BLOG</h3>												
			</header>						
			<div class="heading_line"><span class="overlay"></span></div>
		</section>
		
						
		<!-- BLOG POSTS -->
		<section id="content">
			<ul class="posts-small">			
				<li>
					<article>
						<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/post-1.jpg" alt="post thumbnail" class="image" /></a>
						
						<header>
							<div class="post_format"><img src="/${pageContext.request.contextPath}/images/post_format-post.png" alt="post format" /></div>
							
							<a href="post-boxed.html"><h1>A SIMPLE POST WITH FEATURED IMAGE</h1></a>
							<p class="info">17 June, 2012 &nbsp;&nbsp;/&nbsp;&nbsp; in Web Design &nbsp;&nbsp;/&nbsp;&nbsp;  7 comments</p>							
							<p class="info-responsive">17 June, 2012</p>
							
							<div class="heading_line"><span class="overlay"></span></div>
						</header>
												
						<p>Phasellus vulputate iaculis ante ac consectetur. Donec lobortis elit vel neque pharetra quis dapibus nisi vestibulum. Nam mi diam, scelerisque nec sagittis ut, gravida ac metus. Nam nisi magna, vulputate quis.
						<a href="post-boxed.html" class="colorizer">Read more...</a></p>
					</article>
				</li>
				<li class="hr2"></li>
				
				<li>
					<article>
						<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/post-2.jpg" alt="post thumbnail" class="image" /></a>
						
						<header>
							<div class="post_format"><img src="/${pageContext.request.contextPath}/images/post_format-video.png" alt="post format" /></div>
							
							<a href="post-boxed.html"><h1>VIDEO POST FORMAT WITH FEATURED IMAGE</h1></a>
							<p class="info">13 June, 2012 &nbsp;&nbsp;/&nbsp;&nbsp; in Web Design &nbsp;&nbsp;/&nbsp;&nbsp;  0 comments</p>
							<p class="info-responsive">13 June, 2012</p>
							
							<div class="heading_line"><span class="overlay"></span></div>
						</header>
												
						<p>Phasellus vulputate iaculis ante ac consectetur. Donec lobortis elit vel neque pharetra quis dapibus nisi vestibulum. Nam mi diam, scelerisque nec sagittis ut, gravida ac metus. Nam nisi magna, vulputate quis.
						<a href="post-boxed.html" class="colorizer">Read more...</a></p>
					</article>
				</li>
				<li class="hr2"></li>
				
				<li>
					<article>
						<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/post-3.jpg" alt="post thumbnail" class="image" /></a>
						
						<header>
							<div class="post_format"><img src="/${pageContext.request.contextPath}/images/post_format-audio.png" alt="post format" /></div>
							
							<a href="post-boxed.html"><h1>AUDIO POST FORMAT WITH FEATURED IMAGE</h1></a>
							<p class="info">9 June, 2012 &nbsp;&nbsp;/&nbsp;&nbsp; in Web Design &nbsp;&nbsp;/&nbsp;&nbsp;  3 comments</p>
							<p class="info-responsive">9 June, 2012</p>
							
							<div class="heading_line"><span class="overlay"></span></div>
						</header>
									

						<!-- HTML5 AUDIO PLAYER -->
						<div id="jquery_jplayer_1" class="jp-jplayer"></div>		
						<div class="jp-audio-container">
							<div class="jp-audio">
								<div class="jp-type-single">
									<div id="jp_interface_1" class="jp-interface">
										<ul class="jp-controls">
											<li><a href="#" class="jp-play" tabindex="1">play</a></li>
											<li><a href="#" class="jp-pause" tabindex="1">pause</a></li>
											<li><a href="#" class="jp-mute" tabindex="1">mute</a></li>
											<li><a href="#" class="jp-unmute" tabindex="1">unmute</a></li>
										</ul>
										<div class="jp-progress-container">
											<div class="jp-progress">
												<div class="jp-seek-bar">
													<div class="jp-play-bar"></div>
												</div>
											</div>
										</div>
										<div class="jp-volume-bar-container">
											<div class="jp-volume-bar">
												<div class="jp-volume-bar-value"></div>
											</div>
										</div>
									</div>
								</div>
							</div>			
						</div>									
									
						<p>Music in a HTML5 player for your morning coffee. Enjoy!</p>
					</article>
				</li>
				<li class="hr2"></li>
				
				<li>
					<article>
						<header>
							<div class="post_format"><img src="/${pageContext.request.contextPath}/images/post_format-quote.png" alt="post format" /></div>
							
							<a href="post-boxed.html"><h1>THIS IS A QUOTE POST FORMAT WITHOUT IMAGE</h1></a>
							<p class="info">23 May, 2012 &nbsp;&nbsp;/&nbsp;&nbsp; in Web Design &nbsp;&nbsp;/&nbsp;&nbsp;  7 comments</p>
							<p class="info-responsive">23 May, 2012</p>
							
							<div class="heading_line"><span class="overlay"></span></div>
						</header>
												
						<blockquote>Phasellus vulputate iaculis ante ac consectetur. Donec lobortis elit vel neque pharetra quis dapibus nisi vestibulum. Nam mi diam, scelerisque nec sagittis ut, gravida ac metus. Nam nisi magna, vulputate quis.</blockquote>
						
					</article>
				</li>
				<li class="hr2"></li>
			</ul>
			
			
			<!-- PAGINATION -->
			<nav>
				<ul class="pagination">
					<li class="current"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li>&nbsp;&nbsp;/&nbsp;&nbsp;</li>
					<li><a href="#">Previous Page</a></li>
				</ul>
			</nav>
		</section>
		
		
		<!-- SIDEBAR -->
		<section id="sidebar">
			
			<!-- SUB NAVIGATION -->
			<section>
				<header>  				
					<h1>SUB NAVIGATION</h1>				
					<div class="heading_line"><span class="overlay"></span></div>
				</header>  
				
				<ul class="list">
					<li><a href="#">Lorem and Ipsum</a></li>
					<li><a href="#">Dolor sit amet</a></li>
					<li><a href="#">Consectetur adipiscing elit</a></li>
					<li><a href="#">Mauris tristique pellentesque</a></li>
					<li><a href="#">Lorem et faucibus</a></li>
				</ul>
			</section>
			
			
			<!-- SEARCH FORM -->
			<section class="search">				
				<form action="#" method="post">
				<input type="text" class="input-text" name="form-search" value="SEARCH" onfocus="if(this.value=='SEARCH'){this.value=''};" onblur="if(this.value==''){this.value='SEARCH'}" />
				<input type="image" src="/${pageContext.request.contextPath}/images/button-search.png" alt="search button" class="input-button" />
				</form>			
			</section>
			
			
			<!-- TABBED CONTENT -->
			<section class="tabs">
				<ul>
					<li><a href="#tabs-1">POPULAR</a></li>
					<li><a href="#tabs-2">TAGS</a></li>
					<li><a href="#tabs-3">TAB THREE</a></li>
				</ul>
							
				<div id="tabs-1">
					<ul class="rp_posts">
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn4.jpg" alt="" /></a>
								<p><a href="">Fusce imperdiet lacus ut enim</a><br />
								<span>April 24, 2012.</span></p>				
							</article>
						</li>
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn5.jpg" alt="" /></a>
								<p><a href="">Donec in arcu ipsum fusce imperdiet</a><br />
								<span>April 17, 2012.</span></p>									
							</article>
						</li>
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn6.jpg" alt="" /></a>
								<p><a href="">Nullam sapien nibh, malesuada</a><br />
								<span>April 14, 2012.</span></p>									
							</article>
						</li>
					</ul>
				</div>
				<div id="tabs-2">
					<ul class="tags">
						<li><a href="#">Web design</a></li>
						<li><a href="#">Music</a></li>
						<li><a href="#">Video</a></li>
						<li><a href="#">Illustration</a></li>
						<li><a href="#">Thoughts</a></li>
						<li><a href="#">News</a></li>
						<li><a href="#">Print</a></li>
						<li><a href="#">Photoshop</a></li>
						<li><a href="#">Flash</a></li>
					</ul>
				</div>
				<div id="tabs-3">
					<p>Phasellus vulputate iaculis ante ac consectetur. Donec lobortis elit vel neque pharetra quis dapibus nisi vestibulum.<br /><br /> Nam mi diam, scelerisque nec sagittis ut, gravida ac metus. Nam nisi magna, vulputate quis.</p>
				</div>
				
			</section>
			
		</section>
		
		<div class="separator"></div>
		
		
		<!-- FOOTER -->
		<footer id="boxed">
			<div class="column-one_fourth">
				<section>			
					<h1>POPULAR POSTS</h1>				
					<div class="heading_line"><span class="overlay"></span></div>
					
								
					<ul class="rp_posts">
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn4.jpg" alt="" /></a>
								<p><a href="">Fusce imperdiet lacus ut enim</a><br />
								<span>April 24, 2012.</span></p>				
							</article>
						</li>
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn5.jpg" alt="" /></a>
								<p><a href="">Donec in arcu ipsum fusce imperdiet</a><br />
								<span>April 17, 2012.</span></p>									
							</article>
						</li>
						<li>
							<article>
								<a href="post-boxed.html"><img src="/${pageContext.request.contextPath}/images/rp-tn6.jpg" alt="" /></a>
								<p><a href="">Nullam sapien nibh, malesuada</a><br />
								<span>April 14, 2012.</span></p>									
							</article>
						</li>
					</ul>					
				</section>	
			</div> 
			
			<div class="column-one_fourth">
				<section>		
					<h1>TWITTER FEED</h1>				
					<div class="heading_line"><span class="overlay"></span></div>
									
					<div id="twitter"></div>
				</section>
			</div> 
			
			<div class="column-one_fourth">
				<section>
					<h1>ARCHIVES</h1>				
					<div class="heading_line"><span class="overlay"></span></div>
										
					<ul class="list">							
						<li><a href="#">June, 2012.</a></li>
						<li><a href="#">May, 2012.</a></li>
						<li><a href="#">April, 2012.</a></li>
						<li><a href="#">March, 2012.</a></li>
						<li><a href="#">February, 2012.</a></li>
						<li><a href="#">January, 2012.</a></li>
					</ul>
					
				</section>
			</div> 
			
			<div class="column-one_fourth last">
				<section>
					<h1>CONTACT FORM</h1>				
					<div class="heading_line"><span class="overlay"></span></div>
					
					
					<form action="#" method="post" id="contact_form">
						<ul class="contact_form">
							<li><input type="text" id="cf1" class="input-text" name="form-name" />	<label>Name</label></li>
							<li><input type="text" id="cf2" class="input-text" name="form-email" />	<label>Email</label></li>
							<li><textarea id="cf3" name="form-message"></textarea></li>
							<li><input type="text" id="cf4" class="input-text2" maxlength="4" name="form-captcha" /> <img src="captcha.php" id="captcha" alt="" />	<label>Captcha</label></li>
							<li><input type="submit" class="input-button" value="SEND" /></li>
						</ul>
					</form>
				</section>
			</div> 
		</footer>
		
		
		<div class="clear"></div>		
	</div><!-- #boxed-page-bg -->			
	<div id="wrapper-boxed-page-bottom"></div>
	
	
	
	<!-- FOOTER LINE -->
	<section id="footer-line">
		<div id="left">
			<p><span class="colorizer"> CoachConnecXion</span> HTML5 TEMPLATE BY <a href="http://www.themeprince.com">THEMEPRINCE</a> &COPY; 2012  - ALL RIGHTS RESERVED!</p>
		</div>
		
		<div id="right">					
			<ul class="social_icons">
				<li><a href="#"><img src="/${pageContext.request.contextPath}/images/icon-rss.png" alt="RSS feed" /></a></li>
				<li><a href="#"><img src="/${pageContext.request.contextPath}/images/icon-mail.png" alt="eMail" /></a></li>
				<li><a href="#"><img src="/${pageContext.request.contextPath}/images/icon-facebook.png" alt="Facebook" /></a></li>
				<li><a href="#"><img src="/${pageContext.request.contextPath}/images/icon-twitter.png" alt="Twitter" /></a></li>
			</ul>
			
			<p>FOLLOW US ON </p>
		</div>
	</section>
	
	
	</div><!-- #background -->		
	</div><!-- #background_repeat -->	
	
</body>
</html>