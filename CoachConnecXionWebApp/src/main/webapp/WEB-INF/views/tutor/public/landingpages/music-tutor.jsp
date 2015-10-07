<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Life Coaches - Self Help Motivation - CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="The role of Our life coaches is to provide the drive and guidance you need to improve your self.  Our our life coaches may be able to help you with your relationship, your career, and your overall emotional health." />
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
		<h1>Search For Music Tutors</h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 900px;">

				<tr>
					<td style="width: 200px; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/tutor/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td>
						<table>
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
							
							<tr><td> <br>		
									<h2 style="text-align: left;  text-decoration: underline;">What an music tutor does for you, the struggling artist:</h2>
									<h3 style="text-align: left;">Individuals seeking to improve their knowledge or skill in music, or students trying to improve their grades or get a head start in music class should engage the help of a music tutor.  A music tutor with experience, knowledge and expertise in the field can offer specific advice and guidance to the struggling musician.  At CoachConnecXion.com, we have a variety of music tutors to help you with your deficiencies and ultimately meet your overall goals. </h3> <br>
								</td>
							</tr>
							<tr><td>	
									<h3 style="text-decoration: underline;">Your music tutor will do the following:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Help you improve your skills in music by helping you fill-in the gaps in your knowledge area</li>
										<li style="text-align: left;">Provide a better understanding of the fundamentals that you may not have</li>
										<li style="text-align: left;">Help you improve yourself by providing specialized lessons geared toward your area of challenge</li>
										<li style="text-align: left;">Provide homework help if applicable to ensure you fully understand the the musical concepts</li>
										<li style="text-align: left;">Help you get ready for recitals with the proper techniques</li>
										<li style="text-align: left;">Provide a system of accountability and help you be more responsible when it comes to practicing and preparing for recitals</li>
										<li style="text-align: left;">Help you build your confidence level so you can learn better and perform to your optimal capabilities</li>
									</ul>
								</td>	
							</tr>

						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	