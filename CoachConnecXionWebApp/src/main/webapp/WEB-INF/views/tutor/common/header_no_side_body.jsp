<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
	<!-- DISPLAY MESSAGE IF JAVA IS TURNED OFF -->
	<noscript>		
		<div id="notification">Please turn on javascript in your browser for the maximum experience!</div>
	</noscript>
	
	<!-- DISPLAY THIS MESSAGE IF USER'S BROWSER IS IE7 OR LOWER -->
	<div id="ie_warning"><img src="${pageContext.request.contextPath}/images/warning.png" alt="IE Warning" /><br /><strong>Your browser is out of date!</strong><br /><br />This website uses the latest web technologies so it requires an up-to-date, fast browser!<br />Try <a href="http://www.mozilla.org/en-US/firefox/new/?from=getfirefox">Firefox</a> or <a href="https://www.google.com/chrome">Chrome</a>!</div>
	
	<div id="toTop"><img src="${pageContext.request.contextPath}/images/back_to_top.png" alt="Back to top" title="Back to top" /></div>

	<!-- BACKGROUND IMAGE -->
	<div id="background_repeat">
	<!-- <div id="banner" height="50" >  -->
	<div id="background">
	
	<div id="boxed-page-shadow"></div>
	<div id="wrapper-boxed-page-top"></div> 
	<div id="wrapper-boxed-page">			
		<header>
			<!-- LOGO -->
			<div id="logo">
				<%-- <a href="index.html"><img src="${pageContext.request.contextPath}/images/heading.jpg" alt="logo" /></a>  --%>
				<%-- <a href="index.html"><img src="${pageContext.request.contextPath}/images/cq5_2.jpg" alt="logo" height="88" width="250"/></a>
				<a href="index.html"><img src="${pageContext.request.contextPath}/images/coachconexion_lo_ff1.png" alt="logo" height="99" width="344"/></a>  --%>
				<a href="https://www.coachconnecxion.com/"><img src="${pageContext.request.contextPath}/images/logo/coachconnecxion_4_23.jpg" alt="logo" height="99" width="344"/></a>
			</div>

			<%-- MENU --%>
			<div id="menutopmost">
				<a style="font-size:14px;color:#0404B4"  href="${pageContext.request.contextPath}/coach/public">[GO TO COACHING SITE] &nbsp;&nbsp;&nbsp;&nbsp; </a> | 
				<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
<!--  				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/coach/public">Coaching </a> | 
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">Tutoring </a> | 
-->
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/about-us">About Us </a> | 
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/contact-us">Contact Us </a> | 
				<a  rel="nofollow" style="font-size:12px;color:#0404B4; font-weight: bold; background-color: #B0C4DE; border: 1px solid navy;"  href="${pageContext.request.contextPath}/users/login">Login/Sign Up</a>

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

			</div>
			
			<%-- MENU --%>
			<div id="menubar">
				<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body_menu.jsp" %>
			</div>
			
		</header>
 		
		<div class="separator"></div>
 				
		<!-- HEADING -->
						
		<!-- BLOG POSTS -->
		<section id="content" style="width:100%;">
		

		
		