<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils, com.fervil.spring.careercoach.util.Constants" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Personal Nutritional Coaching | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion connects you with leading professional nutrition coaches.  Better known as dieticians or nutritionists, they are experts in food and nutrition." />
<meta name="keywords" content="nutrition coach, nutrition coaching, nutritional coaching, nutrition coaches" />
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
		<h1>Search For Nutrition Coach </h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 150px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table>  
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
							<%-- 
								<title>nutrition health dieting - CoachConnecXion</title>
							--%>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td>						
									<h3 style="text-align: left;"><B>Coaches: </B><a   rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
								</td>
							</tr>
							<tr><td><img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_3.png" alt="Stages of coaching" height="200" width="600"/><br>
								The stages of the coaching process used by our professionals to get you to the next level
							</td></tr>
							<tr><td><br>	
									<h2 style="text-align: left; text-decoration: underline;">What an Online Nutrition Coach Does For You:</h2>
									<h3 style="text-align: left;">Nutrition coaches better known as dietitians or nutritionists are experts in food and nutrition. 
																	The CoachConnecXion professionals will advise you on nutrition health dieting issues and provide guidance 
																	on what to eat in order to lead a healthy lifestyle or achieve a specific health-related goal. 
																	 </h3><br>
								</td>
							</tr>
							<tr><td>		
									<h3 style="text-decoration: underline;">Nutrition coaches typically help with the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Assess your health needs and diet</li>
										<li style="text-align: left;">Counsel you on nutrition issues and healthy eating habits</li>
										<li style="text-align: left;">Help you develop meal plans, taking both cost and your preferences into account</li>
										<li style="text-align: left;">Evaluate the effects of meal plans and change the plans as needed</li>
										<li style="text-align: left;">Discuss your diet and nutrition, and the relationship between good eating habits and preventing or managing specific diseases</li>
										<li style="text-align: left;">Help you update your nutrition goals and document your progress</li>
									</ul>
									<br>Referenced from: www.bls.gov
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	