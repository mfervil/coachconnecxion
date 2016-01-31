<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 	<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
  
	<%@ include file="/WEB-INF/views/common/header_setup.jsp" %>	

<title>Personal & Professional Coaches | CoachConnecXion</title>
	<meta name="description" content="CoachConnecXion has listings on the top personal and professional coaches in their industries. A coach can help you reach your goals and avoid obstacles." />
	<meta name="keywords" content="coach, coaching, coaches" />

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
		<%-- @ include file="/WEB-INF/views/tutor/common/header_navigation_menu.jsp" --%>	
			<%-- MENU --%>
			
			<!-- LOGO -->
			<div id="logo">
				<a href="https://www.coachconnecxion.com/"><img src="${pageContext.request.contextPath}/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>

			<div id="menutopmost">
				<%-- <a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=au">About Us </a> | <a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/public/information?type=cu">Contact Us </a> | <a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/public/information?type=pp">Privacy Policy&nbsp;&nbsp;&nbsp;&nbsp;</a> --%>
				<a style="font-size:14px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">[GO TO TUTORING SITE] &nbsp;&nbsp;&nbsp;&nbsp; </a> | 
					<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
<!-- 				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/coach/public">Coaching </a> | 
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">Tutoring </a> | 
 -->
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/tutor/about-us">About Us </a> | 
					<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/contact-us">Contact Us </a> | 
					<a  rel="nofollow" style="font-size:12px;color:#0404B4; font-weight: bold; background-color: #B0C4DE; border: 1px solid navy;" href="${pageContext.request.contextPath}/users/login">Login/Sign Up</a>
					
<c:if test="${!empty sessionScope.nummessages and sessionScope.nummessages > 0}">
	<c:if test="${sessionScope.usertype == 1}">
	 			<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/tutor/viewRequests?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>"> | Mail
				(${sessionScope.nummessages}) </a>
	</c:if>
	<c:if test="${sessionScope.usertype == 2}">
				<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/tutor/viewOrders"> | Mail
				(${sessionScope.nummessages}) </a>
	</c:if>

</c:if>
					<%-- 
					| 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/tutor/terms-of-use">Terms Of Use </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/tutor/privacy-policy">Privacy Policy </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/tutor/safety-tips">Safety Tips&nbsp;&nbsp;&nbsp;&nbsp;</a>
					--%>
			</div>

			<div id="menubar">
				<%@ include file="/WEB-INF/views/common/header_no_side_body_menu.jsp" %>
			</div>

		<br><br>	
		<p style="text-align: right;"> <%-- Added width and height to icons --%>
			<a href="https://www.facebook.com/pages/Coachconnecxion/381001272060479"><img src="${pageContext.request.contextPath}/images/social/facebook.png" alt="facebook" height="15" width="15" /></a>
			<a href="https://twitter.com/CoachConnecX"><img src="${pageContext.request.contextPath}/images/social/twitter.png" alt="twitter" height="15" width="15" /></a>
			<a href="https://plus.google.com/u/6/101269948124610306307"><img src="${pageContext.request.contextPath}/images/social/googleplus.png" alt="googleplus" height="15" width="15" /></a>
			<a href="https://www.linkedin.com/company/coachconnecxion"><img src="${pageContext.request.contextPath}/images/social/linkedin.png" alt="linkedin" height="15" width="15" /></a>
		</p>
		
		<br>	
			
		<div class="separator"></div>
		
		<!-- ELASTIC SLIDER -->
		<section>		
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/Coach_1.png" alt="Business Coach"/>
						<div class="ei-title black_bg">
							<h2>DON'T HAVE THE EXPERIENCE</h2>
							<h3>GET A TUTOR WHO'S BEEN THERE AND DONE THAT</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/skilled.jpg" alt="Business Coach"/>
						<div class="ei-title ">
							<h2>ARE YOUR SKILLS OUTDATED </h2>
							<h3>FIND A TUTOR WHO'S TECHNICALLY SAVVY</h3>
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
							<h2>GET TUTORED ANY TIME ANY PLACE</h2>
							<h3>EVEN IN THE COMFORT OF YOUR OWN HOME</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/exercize.jpg" alt="Excersize Coach"/>
						<div class="ei-title">
							<h2>LOOKING TO LOSE THOSE 5 EXTRA POUNDS</h2>
							<h3>A PERSONAL TUTOR MAY BE YOUR ANSWER</h3>
						</div>						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/chef.jpg" alt="New Field Coach"/>
						<div class="ei-title ">
							<h2>TRYING SOMETHING NEW</h2>
							<h3>A TUTOR IN THE FIELD IS THE QUICKEST ROUTE</h3>
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
			<H1 style="font-size: 200%; color: gray">Home of the top professional and personal coaches in the industry<br><br></H1>
			<p style="font-size: 200%; color: gray">Our #1 goal is to help you find that great guide to take you to the next level<br><br>
			<p style="font-size: 300%; color: gray">******<br><br>
			<p style="font-size: 16px; color: gray" >If you are a certified coach who enjoys helping others sign-up with us, our customers are always looking for great coaches <br> <br>
			<p style="font-size: 16px; color: gray" >If you are looking for a professional coach or tutor, you've come to the right place.  We have all types of coaches, including business coaches, life coaches, sports coaches, and many more...
													Our tutors can help with any subject, including math, english, and science; and work with students from elementary to college level <br> <br>
		</td></tr></table>
		
	</div><!-- #wrapper -->		
	
	<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
<!-- 	
</body>
</html>
 -->