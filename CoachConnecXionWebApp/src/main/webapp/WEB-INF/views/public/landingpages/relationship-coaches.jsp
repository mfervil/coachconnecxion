<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils, com.fervil.spring.careercoach.util.Constants" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find a Relationship Coach | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion will help you find the perfect relationship coach. A relationship coach will help you identify your ideal relationships in every area of life." />
<meta name="keywords" content="relationship coach, relationship coaching, relationship coaches, find relationship coach" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

	
<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}
</style><STYLE>
body,input {
	margin: 0px;
	padding: 0px;
}

/*
a {
	color: #0254EB
}

a:visited {
	color: #0254EB
}
*/

#header h2 {
	color: white;
	background-color: #00A1E6;
	margin: 0px;
	padding: 5px;
}

.comment {
	width: 100%;
	background-color: #f0f0f0;
}

a.morelink {
	text-decoration: none;
	outline: none;
}

.morecontent span {
	display: none;
}
</style>
	
<script type="text/javascript" src="js/calendar.js">
</script>
<link href="css/calendar.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>
	$(document).ready(function() {
		$('input#tmpOpen').click(function($e) {
			$('div#myDialog').show(5000);
		});

		$('input#tmpClose').click(function($e) {
			$('div#myDialog').hide(5000);
		});
	});
</script>
<style type='text/css'>
div#myDialog {
text-align:center;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 350px;
	
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius:10px;
	padding:10px;
}
</style>
<script>
	function checkForSuccess() {		
		var value1 = document.getElementById("success").value;	
		if(value1 !=""){
			document.getElementById("submit1").disabled=true;
			if (document.all || document.getElementById) {
				for (i = 0; i < addEducation.length; i++) {
				var formElement = addEducation.elements[i];
				
					if (true) {
						formElement.disabled = true;
					}
				}
			}
		}else{		
			document.getElementById("submit1").disabled=false;
		}
	}	
</script>
	
</head>
<body onload="checkForSuccess();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">
		<h1>Search For <%= Constants.RELATIONSHIP_COACHES_CATEGORY_NAME %> </h1></div>

	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table style="border-spacing: 3px; border-collapse: separate;">
							<tr>
								<td>
								
									<%@ include file="/WEB-INF/views/public/landingpages/searchSelection.jsp" %>
									
									<%-- 
									<% session.setAttribute("categoryName", "Business Coach"); %>
									<% session.setAttribute("categoryId", "2"); %>
									--%>
									
									<%--
									<jsp: include page="/WEB-INF/views/public/landingpages/searchSelection.jsp" flush="true">
									    <jsp:param name="category" value="Business Coaches"/>
									</jsp: include>									
									 --%>
									
									
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<%--
								<title>couples marriage therapy and online relationship advice coaches</title>
							 --%>
							<tr>
								<td>						
									<h3 style="text-align: left;"><B>Coaches: </B><a   rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
								</td>
							</tr>
							<tr>
							
							<td>
								<img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_3.png" alt="Stages of coaching" height="200" width="600"/><br>
								The stages of the coaching process used by our professionals to get you to the next level 							
							</td>
							
							
							</tr>
							<tr>
								<td style="text-align: left;">

								<br>
								Whether you are currently in a relationship or not, a relationship coach can help you identify what your ideal relationship looks like -- and that includes more than just romantic relationships. The relationship experts and couples coaches you can meet through CoachConnecXion can help you learn how to set boundaries in all your relationships and build your own relationship skills so you have your best chance for happiness.
								<br><br>
								With our relationship coaches, you and your significant other can get the marriage therapy or advice you need to improve your relationship. An experienced, qualified relationship coach like the ones you’ll meet on CoachConnecXion can help you examine your assumptions, identify behavior patterns that are harmful to your relationships, learn how to express yourself in a more effective way, and help you set healthy boundaries for your one-on-one as well as group relationships (for example, with your peers at work).
								<br><br>
								The best relationships are those that are founded on mutual respect, clear boundaries and hard work. Let a couples coach or relationship from CoachConnecXion guide you in improving all your interpersonal relationships. And if you are a relationship or couples coach and would like to register with CoachConnecXion, <a href="https://www.coachconnecxion.com/users/create"  style="color: blue;">click here to register</a> and join our team!
								<br><br>

								</td>
							
								<%--	
								<td>
								<br>	
									<h2 style="text-align: left; text-decoration: underline;">What an Online Relationship Coach Does For You:</h2>
									<h3 style="text-align: left;">A relationship coach will help you identify your ideal relationships in every area of life, bring these ideal relationships into your life, set boundaries 
																	where your current relationships do not meet your criteria and build skills to enhance current and future relationships. 
																	The coaches at CoachConnecXion can offer both couples marriage therapy or online relationship advice to help you through your issues. 
								</td>
								</h3><br>
								--%>										
							</tr>
							<tr><td>		
									<h3 style="text-decoration: underline;">Your Relationship Coach will do the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">help you question your assumptions</li>
										<li style="text-align: left;">Work with you to address your patterns and blocks</li>
										<li style="text-align: left;">Encourage you to cultivate clearer, healthier parameters for both one-on-one and group relationships</li>
										<li style="text-align: left;">Discover new mechanisms for listening and expressing yourself</li>
										<li style="text-align: left;">Help you become consciously aware of how you "show up" and, ultimately, work toward greater fulfillment and personal transformation</li>
									</ul>
									<br>Referenced from: www.worldcoachinstitute.com, www.ipeccoaching.com
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	