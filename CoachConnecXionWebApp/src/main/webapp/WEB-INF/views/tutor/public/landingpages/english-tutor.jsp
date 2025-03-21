<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find English/Reading/Writing Tutors Near You | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion offers listings of leading english/Reading/Writing tutors in your area. We have a variety of tutors with different specialties to help you on your specific need." />
<meta name="keywords" content="english tutor, english tutoring, english tutors, find english tutor" />
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
		<h1>Search For English/Reading/Writing Tutors </h1></div>

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
							<title>Get Parenting Tips Daily from Family Coaches - CoachConnecXion</title>
							--%>
							
							<tr>
								<td>						
									<h3 style="text-align: left;"><B>Coaches: </B><a  rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/tutor/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
								</td>
							</tr>
							<tr><td><img src="${pageContext.request.contextPath}/images/landingpages/landing_coach_2.jpg" alt="Coaching Action Steps" height="200" width="600"/>
										<br>Diagram showing the different steps and actions involved in the coaching process
							</td></tr>
							
							<tr><td style="text-align: left;"> 
									<br>							
									A skilled English tutor can help you in a variety of areas, whether you need help with an English composition class, need to ace that dissertation or research paper, or you just want to develop more effective communication skills to help you get ahead in business and life. Whether you need an English tutor for yourself or your child to help with reading and writing skills, you can find a tutor near you by using CoachConnecXion.
									<br><br>
									Our English tutors work with elementary age students through college level and beyond. For students of all ages, an English tutor can help with homework, essay organization, and preparation for quizzes and tests. 
									<br><br>
									Your English tutor can also provide you with a specialized area of study to address your specific needs. And if you need help with time management while working on an important paper, your English tutor can help you learn those skills as well.
									<br><br>
									For professionals, an English tutor can help you learn to communicate more effectively in your written correspondence and other business tasks -- helping you present a more polished image and communicate more effectively.
									<br><br>
									Find the right English tutor for your needs today with CoachConnecXion! And if you are a qualified English tutor and would like to register with us for free, <a href="https://www.coachconnecxion.com/users/create"  style="color: blue;"> click here</a>.
									<br><br>
									<%-- 
									<br>		
									<h2 style="text-align: left;  text-decoration: underline;">What an English tutor does for you, the English student, struggling to complete that dissertation, or finish that research paper:</h2>
									<h3 style="text-align: left;">Individuals seeking to improve their grades in English class or those trying to better understand how to structure research or business papers should seek the help of a tutor to get them over that hurdle.  At CoachConnecXion.com, we have a variety of english tutors; some are focus on research papers, others focus more on grammar and sentence structure, some focus more on business related tasks, in either case we have tutors who can help you on your specific need. </h3> <br>
									--%>									
								</td>
							</tr>
							<tr><td>	
									<h3 style="text-decoration: underline;">Your English tutor will do the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Help you improve your reading and writing skills in the english language by identifying gaps in your knowledge and providing you instructions on how to fix them</li>
										<li style="text-align: left;">Provide a better understanding of the fundamentals that you may have missed in earlier classes</li>
										<li style="text-align: left;">Help you improve your grades in your english related classes by providing specialized lessons geared toward your area of challenge</li>
										<li style="text-align: left;">Provide homework help if needed to ensure you fully understand the concepts and how to apply them</li>
										<li style="text-align: left;">Help you get ready for quizzes, papers, presentations, and research related tasks</li>
										<li style="text-align: left;">Provide a system of accountability and help you be more responsible when it comes to completing long and complex papers</li>
										<li style="text-align: left;">Work with you on time management issues so you better pace your self and complete your homework within the provided time frame</li>
										<li style="text-align: left;">Help you build your confidence level so you can more effectively complete tasks on your own</li>
										<li style="text-align: left;">Decrease some of the supervision required of parents and help the student become more independent and self sufficient</li>
									</ul>
								</td>	
							</tr>

						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>