<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find Science Tutors Near You | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion offers listings of the leading science tutors in your area. We have tutors for anatomy to physics to chemistry and everything in between." />
<meta name="keywords" content="science tutor, science tutors, science tutoring, find science tutor" />
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
		<h1>Search For Science Tutors </h1></div>
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
									Science: the very mention of this subject can be daunting to some people. But if you or your child need help learning important science concepts and passing a science course -- from elementary school level to college level -- CoachConnecXion can help you find the right science expert for your needs.
									<br><br>
									Our science tutors can help you fill in the gaps of science knowledge, explaining concepts that may have been missed in previous science courses. They provide homework help as well as science test prep services and can even help with preparing for research projects. Best of all, our science tutors can help you or your child develop time management skills that will help you show improvement not only in your science studies, but in many other areas of life.
									<br><br>
									If you&#39;re a parent whose child needs science tutoring, our tutors can help free up your time -- you&#39;ll be able to supervise your child less during homework time, while your child gets the science concepts and skills he or she needs. So use CoachConnecXion today to find a science tutor near you. And if you are a qualified science tutor who would like to have more students, <a href="https://www.coachconnecxion.com/users/create"  style="color: blue;"> register with us</a> -- it’s free!
									<br><br>
									<%-- 
									<br>		
									<h2 style="text-align: left;  text-decoration: underline;">What a science tutor does for you, the student struggling with science concepts that seem completely out of your reach:</h2>
									<h3 style="text-align: left;">Individuals seeking to improve their grades in science class or those trying to better understand science concepts in general should seek the help of a tutor to get them over that hurdle.  At CoachConnecXion.com, we have a variety of science tutors, from anatomy to physics to chemistry and everything in between</h3> <br>
									--%>
								</td>
							</tr>
							<tr><td>	
									<h3 style="text-decoration: underline;">Your science tutor will do the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Help you improve your skills in science by identifying gaps in your knowledge and providing you instructions to help you better understand the subject</li>
										<li style="text-align: left;">Provide a better understanding of the fundamentals that you may have missed in earlier classes</li>
										<li style="text-align: left;">Help you improve your grades in your science related classes by providing specialized lessons geared toward your weak area</li>
										<li style="text-align: left;">Provide homework help to ensure you fully understand the the fundamentals of science and how to apply the concepts</li>
										<li style="text-align: left;">Help you get ready for quizzes, tests, and research projects</li>
										<li style="text-align: left;">Provide a system of accountability and help you be more responsible when it comes to completing complex science assignments</li>
										<li style="text-align: left;">Work with you on time management issues so you better pace yourself and complete your homework assignments on time</li>
										<li style="text-align: left;">Help you build your confidence level so you can more effectively complete tasks, and tackle complex problems</li>
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