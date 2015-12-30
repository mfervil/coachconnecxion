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
				<a style="font-size:14px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">[GO TO TUTORING SITE] &nbsp;&nbsp;&nbsp;&nbsp; </a> | 
				<a  style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/">Home </a> | 
<!--  			<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/coach/public">Coaching </a> | 
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/tutor/public">Tutoring </a> | 
-->
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/about-us">About Us </a> | 
				<a style="font-size:12px;color:#0404B4"  href="${pageContext.request.contextPath}/contact-us">Contact Us </a> | 
				<a  rel="nofollow" style="font-size:12px;color:#0404B4; font-weight: bold; background-color: #B0C4DE; border: 1px solid navy;"  href="${pageContext.request.contextPath}/users/login">Login | Sign Up</a>
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

<%-- 			<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/terms-of-use">Terms Of Use </a> | 
				<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/privacy-policy">Privacy Policy </a> | 
				<a style="font-size:12px;color:#0404B4" href="${pageContext.request.contextPath}/safety-tips">Safety Tips&nbsp;&nbsp;&nbsp;&nbsp;</a>
--%>				
			</div>
			
			<%-- MENU --%>
			<div id="menubar">
				<%@ include file="/WEB-INF/views/common/header_no_side_body_menu.jsp" %>
			</div>
			
			<%-- MENU 
			<nav>
				<ul id="menu">
					<li><a href="#">SEARCH</a>
						<ul>	
							<li><a href="${pageContext.request.contextPath}/userprofileList">FIND A COACH</a></li>
							<li><a href="${pageContext.request.contextPath}/information?type=so">SEARCH OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/information?type=sf">FAQ</a></li>
						</ul>
					</li>
					<li><a href="blog-small.html">COACHES</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/users/create?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">REGISTER AS A COACH</a></li>
							<li><a href="${pageContext.request.contextPath}/public/profile?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW/CREATE MY PROFILE</a></li>
							<li><a href="${pageContext.request.contextPath}/packageAdd?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">CREATE MY PACKAGE</a></li>
							<li><a href="${pageContext.request.contextPath}/packages?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW MY PACKAGES</a></li>
							<li><a href="${pageContext.request.contextPath}/post.html?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW REQUESTS</a></li>
							<li><a href="${pageContext.request.contextPath}/information?type=co">COACHING OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/information?type=cf">FAQ</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/information?type=hw">HOW IT WORKS</a></li>
					<li><a href="${pageContext.request.contextPath}/information?type=bl">BLOG</a></li>
					<li><a href="${pageContext.request.contextPath}/information?type=au">ABOUT US</a></li>
					<li><a href="${pageContext.request.contextPath}/users/login">SIGN IN-REGISTER</a></li>
				</ul>
				
				<select id="responsive-menu">
					<option value="" selected="selected">Please choose page</option>
					<option value="index.html">Homepage</option>
						<option value="index-boxed.html">- Boxed version</option>
						<option value="index.html">- Unboxed version</option>
						<option value="post.html">- A post</option>
					<option value="blog-small.html">Blogs</option>
						<option value="blog-small.html">- Small thumbs</option>
						<option value="blog-large.html">- Large thumbs</option>
					<option value="portfolio.html">Portfolio</option>
					<option value="gallery.html">Gallery</option>
					<option value="stylings-text.html">Stylings</option>
						<option value="stylings-text.html">- Typography</option>
						<option value="stylings-table.html">- Table &amp; Columns</option>
						<option value="stylings-tabs.html">- Tabs, Toggles, Carousel</option>
						<option value="stylings-form.html">- Contact form &amp; Buttons</option>					
				</select>
			</nav>
			--%>
			
		</header>
 		
		<div class="separator"></div>
 				
		<!-- HEADING -->
<!--		
		<section class="page_heading a">
 		
			<header class="heading">
				<h1>RECENT POSTS</h1>
				 <h3>FROM THE BLOG</h3>  												
			</header>
									
			<div class="heading_line"><span class="overlay"></span></div>
			
		</section>
 --> 		
						
		<!-- BLOG POSTS -->
		<section id="content" style="width:100%;">
		

		
		