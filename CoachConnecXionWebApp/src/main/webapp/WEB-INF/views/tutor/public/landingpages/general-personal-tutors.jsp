<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Personal Tutors-Hire a tutor to improve your grades - CoachConnecXion</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Our personal tutors will work with you so you can more clearly identify your weaknesses and help you create a plan to improve your grades and knowledge." />
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
		style="text-align: center; width: 100%x; font-size: large; font-weight: bold; color: blue">
		<h1>Search For Private Tutors </h1></div>
	<div style="height: 1px; background-color: #D0D0D0"></div>

	<table style="width: 100%;">

				<tr>
					<td style="width: 20%; vertical-align: top;background-color: #EAEAEA;padding: 5px;">
						<%@ include file="/WEB-INF/views/tutor/public/landingpages/left-nav-coaches.jsp" %>
					</td>
					<td style="width: 80%;">
						<table style="width: 100%; border-spacing: 3px; border-collapse: separate;"">
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
							
							<%-- 
							<title>Hire a Coach - Self Help Motivation - CoachConnecXion</title>
							--%>
							
							<tr><td>
									<h3 style="text-align: left;"><br><B>Coaches: </B><a  rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/tutor/users/create">Click here to register</a> and get new clients.  Listing on this site is free.  </h3>
							</td></tr>	
								<tr><td><br><img src="${pageContext.request.contextPath}/images/hbr_coach_info.png" alt="Reasons for coaching" height="500" width="450"/></td></tr>
							<tr><td>
									<h2 style="text-align: left; text-decoration: underline;">What a Personal Tutor does:</h2>
									<h3 style="text-align: left;">A personal tutor will work with you to help you improve your grades by identifying where you have the most challenges, and work with you to improve on those areas. 
																	If you're serious about improving your grades and your knowledge in an area, the quickest path is to hire a personal tutor through CoachConnecXion to work with you on study techniques 
																	and provide guidance and training to help you get to your goal.</h3><br>
							</td></tr>
							<tr>
								<td>						
									<h3 style="text-decoration: underline;">A Personal tutor may be helpful for the following reasons:</h3>
									<ul style="list-style-type: square;">
										<li style="text-align: left;">Helps you more clearly identify where you are and what you need to do to get to where you want to be</li>
										<li style="text-align: left;">Works with you to develop your potential and fine-tune your studying skills</li>
										<li style="text-align: left;">Helps you develop a long term strategy to get you the grade you want</li>
										<li style="text-align: left;">Works with you to understand your potential pitfalls and obstacles and helps you find a solution to get around those obstacles</li>
									</ul>
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>