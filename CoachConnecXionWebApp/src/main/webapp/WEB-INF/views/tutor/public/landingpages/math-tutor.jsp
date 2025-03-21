<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find Math Tutors Near You | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion offers listings of math tutors in the area. We have a variety of math tutors, from elementary math to advanced calculus and differential equation." />
<meta name="keywords" content="math tutor, math tutoring, math tutors, find math tutor" />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

	
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

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>

	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a>

	<div
		style="text-align: center; width: 900px; font-size: large; font-weight: bold; color: blue">
		<h1>Search For Math Tutors </h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 200px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/tutor/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table style="border-spacing: 3px; border-collapse: separate;">
							<tr>
								<td>
								
									<%@ include file="/WEB-INF/views/tutor/public/landingpages/searchSelection.jsp" %>
									
									<%-- 
									<% session.setAttribute("categoryName", "Business Coach"); %>
									<% session.setAttribute("categoryId", "2"); %>
									--%>
									
									<%--
									<jsp: include page="/WEB-INF/views/tutor/public/landingpages/searchSelection.jsp" flush="true">
									    <jsp:param name="category" value="Business Coaches"/>
									</jsp: include>									
									 --%>
									
									
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<%--
								<title>self help motivation - CoachConnecXion</title>
							 --%>
							<tr>
								<td>
									<h3 style="text-align: left;"><B>Coaches: </B><a   rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/tutor/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
								</td>
							</tr>
							<tr><td><img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_3.png" alt="Stages of coaching" height="200" width="600"/> <br>
								The stages of the coaching process used by our professionals to get you to the next level 							
							</td></tr>
							
							<tr><td style="text-align: left;"> 
								<br>
								Math doesn’t come naturally to everyone, but learning math skills is necessary for success in school and in life. Get the help you need to succeed in math when you find a math tutor on CoachConnecXion!
								<br><br>
								We have math tutors that work with students of varying ages and levels, from elementary school through college level math. Whether your child needs help with long division and fractions, or you’re an adult struggling with a college math class that’s required for your degree, you’ll find a math tutor here who can help.
								<br><br>
								Some of the many things our math tutors can assist you with include: understanding math fundamentals; preparing for math quizzes, tests or standardized tests; or developing better time management skills. If you’re a parent, our math tutors can help make homework time easier by taking some of the pressure off you while making sure your child understands important concepts.
								<br><br>
								So use our website today to find a math tutor to help you or your child excel in math. And if you happen to be a math tutor who would like to find more clients, <a href="https://www.coachconnecxion.com/users/create"  style="color: blue;"> register with us</a> for free!
								<br><br>
								
									<%-- 
									<br>		
									<h2 style="text-align: left;  text-decoration: underline;">What a Math tutor does for you, the Math student, struggling with math concepts that seem completely foreign to you:</h2>
									<h3 style="text-align: left;">Individuals seeking to improve their grades in Math class or those trying to better understand math concepts in general should seek the help of a tutor to get them over that hurdle.  At CoachConnecXion.com, we have a variety of Math tutors, from elementary math to advanced calculus and differential equation </h3> <br>
									--%>									
								</td>
							</tr>
							<tr><td>	
									<h3 style="text-decoration: underline;">Your Math tutor will do the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Help you improve your skills in Math by identifying gaps in your knowledge and providing you instructions on how to fill those gaps</li>
										<li style="text-align: left;">Provide a better understanding of the fundamentals that you may have missed in earlier classes</li>
										<li style="text-align: left;">Help you improve your grades in your Math related classes by providing specialized lessons geared toward your area of challenge</li>
										<li style="text-align: left;">Provide homework help if needed to ensure you fully understand the concepts and how to apply them</li>
										<li style="text-align: left;">Help you get ready for quizzes, class tests, and standardized tests</li>
										<li style="text-align: left;">Provide a system of accountability and help you be more responsible when it comes to completing long and complex math assignments</li>
										<li style="text-align: left;">Work with you on time management issues so you better pace your self and complete your homework within the allotted</li>
										<li style="text-align: left;">Help you build your confidence level so you can more effectively complete tasks, and tackle more complex problems</li>
										<li style="text-align: left;">Decrease some of the supervision required of parents and help you become more independent and self sufficient</li>
									</ul>
								</td>	
							</tr>

						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	