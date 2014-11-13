
	<title>CoachConnecXion - Find a Coach or Trainer for self improvement</title>
	<meta name="description" content="Find a Coach or Trainer to help you raise your game" />

</head>
<body>

	<!-- DISPLAY MESSAGE IF JAVA IS TURNED OFF -->
	<noscript>		
		<div id="notification">Please turn on javascript in your browser for the maximum experience!</div>
	</noscript>
	
	<!-- DISPLAY THIS MESSAGE IF USER'S BROWSER IS IE7 OR LOWER -->
	<div id="ie_warning"><img src="${pageContext.request.contextPath}/images/warning.png" alt="IE Warning" /><br /><strong>Your browser is out of date!</strong><br /><br />This website uses the latest web technologies so it requires an up-to-date, fast browser!<br />Try <a href="http://www.mozilla.org/en-US/firefox/new/?from=getfirefox">Firefox</a> or <a href="https://www.google.com/chrome">Chrome</a>!</div>
	
	<div id="toTop"><img src="${pageContext.request.contextPath}/images/back_to_top.png" alt="Back to top" title="Back to top" /></div>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>

	<%@ include file="/WEB-INF/views/common/header_setup.jsp" %>	
	
	<div id="topline"></div>		
	<div id="wrapper">			
		<%-- @ include file="/WEB-INF/views/common/header_navigation_menu.jsp" --%>	
			<%-- MENU --%>
			
			<!-- LOGO -->
			<div id="logo">
				<%-- <a href="index.html"><img src="/images/heading.jpg" alt="logo" /></a>  --%>
				<%-- <a href="index.html"><img src="/images/cq5_2.jpg" alt="logo" height="88" width="250"/></a>  --%>
				<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>

			<div id="menutopmost">
				<%-- <a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=au">About Us </a> | <a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/public/information?type=cu">Contact Us </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=pp">Privacy Policy&nbsp;&nbsp;&nbsp;&nbsp;</a> --%>
					<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=au">About Us </a> | 
					<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/public/information?type=cu">Contact Us </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=tu">Terms Of Use </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=pp">Privacy Policy </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=ps">Safety Tips&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>

			<div id="menubar">
				<%@ include file="/WEB-INF/views/common/header_no_side_body_menu.jsp" %>
			</div>
			
		<div class="separator"></div>
		
				<!--  <br><br><h1 style="color:red;">SITE IS UNDER CONSTRUCTION. COME BACK IN A FEW WEEKS TO FIND A COACH OR REGISTER AS A COACH</h1>  -->	
					
		<!-- ELASTIC SLIDER -->
		<section>		
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/Coach_1.png" alt="Business Coach"/>
						<div class="ei-title black_bg">
							<h2>DON'T HAVE THE EXPERIENCE</h2>
							<h3>GET A COACH WHO'S BEEN THERE AND DONE THAT</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/skilled.jpg" alt="Business Coach"/>
						<div class="ei-title black_bg">
							<h2>ARE YOUR SKILLS OUTDATED </h2>
							<h3>FIND A COACH WHO'S TECHNICALLY SAVY</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/mountain.jpg" alt="Corporate Coach"/>
						<div class="ei-title">
							<h2>LOOKING FOR A FINAL PULL</h2>
							<h3>OR PUSH TO GET YOU TO THE TOP</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/remote.jpg" alt="Coaching Any Time Any Plance"/>
						<div class="ei-title black_bg">
							<h2>GET COACHED ANY TIME ANY PLACE</h2>
							<h3>EVEN IN THE COMFORT OF YOUR OWN HOME</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/exercize.jpg" alt="Excersize Coach"/>
						<div class="ei-title">
							<h2>LOOKING TO LOSE THOSE 5 EXTRA POUNDS</h2>
							<h3>A PERSONAL COACH MAY BE YOUR ANSWER</h3>
						</div>						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/chef.jpg" alt="New Field Coach"/>
						<div class="ei-title black_bg">
							<h2>TRYING SOMETHING NEW</h2>
							<h3>A COACH IN THE FIELD IS THE QUICKEST ROUTE</h3>
						</div>						
					</li>									
				</ul>
								
				<ul class="ei-slider-thumbs">
					<li class="ei-slider-element">Current</li>
					<li><a href="#">Slide 1</a></li>
					<li><a href="#">Slide 2</a></li>
					<li><a href="#">Slide 3</a></li>
					<li><a href="#">Slide 4</a></li>
					<li><a href="#">Slide 5</a></li>
					<li><a href="#">Slide 6</a></li>
				</ul>												
			</div>		
	</section>
		
	</div><!-- #wrapper -->		
	
	<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
	
</body>
</html>