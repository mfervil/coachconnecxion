<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 	<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
  
	<%@ include file="/WEB-INF/views/common/header_setup.jsp" %>	

	<title>Professional coaches-Personal Trainers-Hire a Coach-CoachConnecXion</title>
	<meta name="description" content="CoachConnecXion is one of the leading Websites for Trainers and Coaches based in Illinois, USA. We Provide a listing of available certified professional coaches and trainers based on your search criteria." />
	<meta name="msvalidate.01" content="18F49A45D87958CD1603B589E05269DE" /> <%-- This is used by bing --%>
	<meta name="robots" content="NOODP,NOYDIR" />
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-60438004-1', 'auto');
  ga('send', 'pageview');

</script>
	

</head>

<body>

	<div id="topline"></div>		
	<div id="wrapper">			
		<%-- @ include file="/WEB-INF/views/common/header_navigation_menu.jsp" --%>	
			<%-- MENU --%>
			
			<!-- LOGO -->
			<div id="logo">
				<%-- <a href="index.html"><img src="/images/heading.jpg" alt="logo" /></a>  --%>
				<%-- <a href="index.html"><img src="/images/cq5_2.jpg" alt="logo" height="88" width="250"/></a>  --%>
				<a href="https://www.coachconnecxion.com/"><img src="${pageContext.request.contextPath}/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>

			<div id="menutopmost">
				<%-- <a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=au">About Us </a> | <a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/public/information?type=cu">Contact Us </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=pp">Privacy Policy&nbsp;&nbsp;&nbsp;&nbsp;</a> --%>
					<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/about-us">About Us </a> | 
					<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/contact-us">Contact Us </a> | 
					<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/users/login">Sign in-Register</a>
					
<c:if test="${!empty sessionScope.nummessages and sessionScope.nummessages > 0}">
	<c:if test="${sessionScope.usertype == 1}">
	 			<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/viewRequests?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>"> | NEW MESSAGES
				(${sessionScope.nummessages}) </a>
	</c:if>
	<c:if test="${sessionScope.usertype == 2}">
				<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/viewOrders"> | NEW MESSAGES
				(${sessionScope.nummessages}) </a>
	</c:if>

</c:if>
					
					<%-- 
					| 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/terms-of-use">Terms Of Use </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/privacy-policy">Privacy Policy </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/safety-tips">Safety Tips&nbsp;&nbsp;&nbsp;&nbsp;</a>
					--%>
			</div>

			<div id="menubar">
				<%@ include file="/WEB-INF/views/common/header_no_side_body_menu.jsp" %>
			</div>

		<br><br>	
		<p align="right">
			<a href="https://www.facebook.com/pages/Coachconnecxion/381001272060479"><img src="${pageContext.request.contextPath}/images/social/facebook.png" alt="logo" /></a>
			&nbsp;&nbsp;<a href="https://twitter.com/CoachConnecX"><img src="${pageContext.request.contextPath}/images/social/twitter.png" alt="logo" /></a>
			&nbsp;&nbsp;<a href="https://plus.google.com/u/6/101269948124610306307"><img src="${pageContext.request.contextPath}/images/social/googleplus.png" alt="logo" /></a>
			&nbsp;&nbsp;<a href="https://www.linkedin.com/company/coachconnecxion"><img src="${pageContext.request.contextPath}/images/social/linkedin.png" alt="logo" /></a>
		</p>
			
		<div class="separator"></div>
		
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
						<div class="ei-title ">
							<h2>ARE YOUR SKILLS OUTDATED </h2>
							<h3>FIND A COACH WHO'S TECHNICALLY SAVVY</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/mountain.jpg" alt="Corporate Coach"/>
						<div class="ei-title black_bg">
							<h2>LOOKING FOR A FINAL PULL</h2>
							<h3>OR PUSH TO GET YOU TO THE TOP</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/remote.jpg" alt="Coaching Any Time Any Plance"/>
						<div class="ei-title ">
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
						<div class="ei-title ">
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
			
		<table><tr><td >
			<p style="font-size: 300%; color: #086A87">Welcome to CoachConnecXion<br><br>
			<p style="font-size: 200%; color: gray">Home of the top professional coaches in the field<br><br>
			<p style="font-size: 200%; color: gray">Our #1 goal is to help you find that great personal coach to take you to the next level<br><br>
			<p style="font-size: 300%; color: gray">******<br><br>
			<p style="font-size: 16px; color: gray" >If you are a certified coach who enjoys helping others sign-up with us, our customers are always looking for great coaches <br> <br>
			<p style="font-size: 16px; color: gray" >If you are looking for a professional coach, you've come to the right place.  We have all types of coaches, including business coaches, life coaches, sports, and many more <br> <br>
		</td></tr></table>
		
	</div><!-- #wrapper -->		
	
	<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
	
</body>
</html>