<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
 	<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
  
	<%@ include file="/WEB-INF/views/common/header_setup.jsp" %>	

<title>Find a Coach or Tutor Online | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion connects coaches and tutors with those who need them. We help you find the top professional and personal coaches and tutors in the industry." />
<meta name="keywords" content="find a tutor, find tutor, find tutors, find a coach, find coach, find coaches" />
	
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

<style type="text/css">


.list-row {
    background:#f4f4f4;
    border:2px solid blue;
    width: 50%;
    margin: auto;
    text-align: center;
    vertical-align: middle;
    top: 50%;
    padding: 20px 0px;
    }
</style>	

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
					<%-- 
					<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
					<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/about-us">About Us </a> | 
					<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/contact-us">Contact Us </a> | 
					--%>
					<a  rel="nofollow" style="font-size:16px;color:#0404B4; font-weight: bold; background-color: #B0C4DE; border: 1px solid navy;" href="${pageContext.request.contextPath}/users/login">Login/Sign Up</a>
					&nbsp; <a style="font-size:14px;color:#0404B4; background-color: #B0C4DE; border: 1px solid navy;"  href="${pageContext.request.contextPath}/contact-us">Contact Us </a> 

<c:if test="${!empty sessionScope.nummessages and sessionScope.nummessages > 0}">
	<c:if test="${sessionScope.usertype == 1}">
	 			<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/viewRequests?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>"> | Mail
				(${sessionScope.nummessages}) </a>
	</c:if>
	<c:if test="${sessionScope.usertype == 2}">
				<a style="font-size:12px;color:#FF0000; font-weight: bold;" href="${pageContext.request.contextPath}/viewOrders"> | Mail
				(${sessionScope.nummessages}) </a>
	</c:if>

</c:if>

			</div>

			<%-- 
			<div id="menubar">
				<%@ include file="/WEB-INF/views/common/header_no_side_body_menu.jsp" %>
			</div>
			--%>

		<br><br>	
		<p style="text-align: right;"> <%-- Added width and height to icons --%>
			<a href="https://www.facebook.com/pages/Coachconnecxion/381001272060479"><img src="${pageContext.request.contextPath}/images/social/facebook.png" alt="facebook" height="20" width="20" /></a>
			<a href="https://twitter.com/CoachConnecX"><img src="${pageContext.request.contextPath}/images/social/twitter.png" alt="twitter" height="20" width="20" /></a>
			<a href="https://plus.google.com/u/6/101269948124610306307"><img src="${pageContext.request.contextPath}/images/social/googleplus.png" alt="googleplus" height="20" width="20" /></a>
			<a href="https://www.linkedin.com/company/coachconnecxion"><img src="${pageContext.request.contextPath}/images/social/linkedin.png" alt="linkedin" height="20" width="20" /></a>
		</p>
		
		<br>	
		
		<div class="separator" ></div>
		
		<br>
		<div style="padding: 20px;"></div>

		<div style="font-size: 300%; color: #086A87; text-align: center">Welcome to CoachConnecXion</div>
		
		<br><br>
		
		<div  class="list-row"><a style="font-size: 20px" href="${pageContext.request.contextPath}/coach/public">COACHING SERVICES</a></div>
		<div  class="list-row"><a style="font-size: 20px" href="${pageContext.request.contextPath}/tutor/public">TUTORING SERVICES</a></div>
		<%-- <div  class="list-row"><a style="font-size: 20px" href="${pageContext.request.contextPath}/training/public">TRAINING SERVICES</a></div> --%>

		<br>
		<div style="padding: 20px;">
			<H1 style="font-size: 150%; color: gray">We have some of the top professional and personal coaches and tutors in the industry.  
			Our #1 goal is to help you find that great guide to take you to the next level.<br><br></h1>
			<p style="font-size: 300%; color: gray; text-align: center;">******<br><br>
			<p>
			When you want to succeed in a particular area of life, a common word of advice you&#39;ll hear is that you should find a competent coach or tutor. But actually finding an experienced coach you can trust is another matter. Where do you begin your search for the best coach or tutor? CoachConnecXion can help!
			</p>
			<br>
			<p>
			We&#39;ve made it our mission to match qualified coaches and qualified tutors with the customers who need their expertise. CoachConnecXion works with many different types of coaches, so try our site if you need a:
			</p>
			<ul style="list-style-type: disc; list-style-position: inside;">
				<li> Business coach</li> 
				<li> Life coach</li>
				<li> Sports coach</li>
				<li> Family coach</li>
				<li> Relationship coach</li>
				<li> Finance or money management coach</li>
				<li> Nutrition coach</li>
				<li> Career or corporate coach</li>
				<li> Or any other type of coach</li>
			</ul>
			<br>
			<p>In addition, we can also help you find a tutor to help you or your child with a variety of subjects. Our tutors work with a wide range of ages, from elementary school students through college students, so come to us when you need the following types of tutors:
			</p>						
			<ul style="list-style-type: disc; list-style-position: inside;">
				<li> Math tutor</li>
				<li> Science tutor</li>
				<li> English tutor</li>
				<li> Language tutor</li> 
				<li> Or any other type of tutor</li> 
			</ul>
			<br>
			<p>We can even help pair you with a music tutor who can help you or your child learn to play an instrument.</p>			
			<br>
			<p>The CoachConnecXion team comes from different areas of expertise, from information technology to management, and that&#39;s why we understand the value of different kinds of knowledge and skills. We&#39;ve made it our business to match qualified, experienced coaches and tutors with the people who can benefit from their knowledge and experience. Give us a try today and find the coach or tutor you&#39;ve been looking for!</p>
			
			<%--
			<p style="font-size: 16px; color: gray" >If you are a certified coach who enjoys helping others sign-up with us, our customers are always looking for great coaches <br> <br>
			<p style="font-size: 16px; color: gray" >If you are looking for a professional coach or tutor, you&#39;ve come to the right place.  We have all types of coaches, including business coaches, life coaches, sports coaches, and many more...
													Our tutors can help with any subject, including math, english, and science; and work with students from elementary to college level <br> <br>
			 --%>													
		</div>
		
	</div><!-- #wrapper -->		
	
	<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
<!-- 	
</body>
</html>
 -->