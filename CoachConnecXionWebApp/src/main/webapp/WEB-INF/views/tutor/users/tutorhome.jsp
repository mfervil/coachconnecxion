<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 	<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
  
	<%@ include file="/WEB-INF/views/tutor/common/header_setup.jsp" %>	

<title>Search for a Tutor | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion will connect you with knowledgeable tutors in your area of study. Search through our list of tutors near you." />
<meta name="keywords" content="tutor, tutoring, tutors, tutor search" />
	<meta name="description" content="CoachConnecXion.com matches individuals with life, personal, professional and career coaches.  Our aim is to help witth individual growth" />
	<meta name="robots" content="NOODP,NOYDIR" />
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-60438004-1', 'auto');
  ga('send', 'pageview');

</script>
	
<style type="text/css">
    .Table
    {
        display: table;
    }
    .Title
    {
        display: table-caption;
        text-align: center;
        font-weight: bold;
        font-size: larger;
    }
    .Heading
    {
        display: table-row;
        font-weight: bold;
        text-align: center;
    }
    .Row
    {
        display: table-row;
    }
    .Cell
    {
        display: table-cell;
        border: solid;
        border-width: thin;
        padding-left: 5px;
        padding-right: 5px;
        text-align: center;
    }
</style>

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
				<a style="font-size:14px;color:#0404B4"  href="${pageContext.request.contextPath}/coach/public">[GO TO COACHING SITE] &nbsp;&nbsp;&nbsp;&nbsp; </a> | 
					<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
				<!-- <a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">Tutoring </a> |  --> 
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
				<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body_menu.jsp" %>
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
		
			<div class="Table" style="width: 100%">		
				<div class="Row">
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-math-tutor">MATH TUTORS</a>
					</div>
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-science-tutor">SCIENCE TUTORS</a> 
					</div>
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-english-tutor">ENGLISH TUTORS</a> 
					</div>
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-language-tutor">LANGUAGE TUTORS</a> 
					</div>
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-sat-act-gmat-lsat-tutor">TESTING (ACT/SAT/GMAT/ETC...) TUTORS</a>
					</div>
					<div class="Cell">
					<a style="color:#0404B4" href="${pageContext.request.contextPath}/tutor/public/landing-general-personal-tutors">FIND MORE TUTORS...</a> 
					</div>
				</div>
			</div>
			<div class="Table" style="width: 100%">		
				<div class="Row">
					<div class="Cell" style="white-space: nowrap; text-align: left; font-size: 14px;">
					Students are looking for great tutors all the time: <a style="font-size:14px;color:#0404B4; font-weight: bold; background-color: #B0C4DE; border: 1px solid navy; "  href="${pageContext.request.contextPath}/users/create">Tutors Get Listed for Free</a> 
					</div>
				</div>	
			</div>			
		
		
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
                     <li>
						<img src="${pageContext.request.contextPath}/images/tutor/homepage/graduation_4.png" alt="Tutors for Graduation"/>
						<%-- <div class="ei-title black_bg"> --%>
						<div class="ei-title ">
							<h2>IS YOUR DREAM OF GRADUATION SLIPPING AWAY</h2>
							<h3>THE RIGHT TUTOR CAN GET YOU BACK ON TRACK</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/skilled.jpg" alt="Business Coach"/>
						<div class="ei-title ">
							<h2>ARE YOUR SKILLS OUTDATED </h2>
							<h3>FIND A TUTOR WHO&#39;S TECHNICALLY SAVVY</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/tutor/homepage/distressed_2.png" alt="Tutors for Struggling Students"/>
						<div class="ei-title ">
							<h2>IS YOUR CHILD STESSED AND STRUGLING WITH SCHOOL</h2>
							<h3>A TUTOR MAY BE THE PERFECT SOLUTION</h3>
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
						<img src="${pageContext.request.contextPath}/images/tutor/homepage/musictutor_2.png" alt="Music Tutors"/>
						<div class="ei-title">
							<h2>STRUGGLING AND UNABLE TO FIND THE RIGHT TONE</h2>
							<h3>A MUSIC TUTOR CAN HELP YOU HIT THE NOTE</h3>
						</div>						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/tutor/homepage/seniortutoring_2.png" alt="Tutoring for Seniors"/>
						<div class="ei-title ">
							<h2>TUTORING CAN HELP ANYONE</h2>
							<h3>NO MATTER YOUR AGE OR STAGE IN LIFE</h3>
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
			<p style="font-size: 300%; color: #086A87">Welcome to CoachConnecXion Tutoring Service<br><br>
			<H1 style="font-size: 200%; color: gray">Home of the top grade school, high school and college tutors in the industry<br><br></H1>
			<p style="font-size: 200%; color: gray">Our #1 goal is to help you find that great tutor to take you to the next level<br><br>
			<p style="font-size: 300%; color: gray">******<br><br>
			<p style="font-size: 16px; color: gray" >If you are a tutor who enjoys helping others sign-up with us, our students are always looking for great tutors <br> <br>
			<p style="font-size: 16px; color: gray" >If you are looking for a great tutor, you&#39;ve come to the right place.  We have tutors in all subjects for all grade levels <br> <br>
		</td></tr></table>
		
	</div><!-- #wrapper -->		
	
	<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
<!-- 	
</body>
</html>
 -->