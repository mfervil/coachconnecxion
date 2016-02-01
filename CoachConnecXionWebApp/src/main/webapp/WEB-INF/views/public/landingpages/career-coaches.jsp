<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils, com.fervil.spring.careercoach.util.Constants" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Find a Career Coach | CoachConnecXion</title>
<meta name="description" content="CoachConnecXion will help you find the leading career coach in the industry. We have listings of coaches to help you make critical decisions about your career." />
<meta name="keywords" content="career coach, career coaching, career coaches, find career coach" />
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
		<h1>Search For <%= Constants.CAREER_COACHES_CATEGORY_NAME %> </h1>
	</div>
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
								<title>career coaching services - certified career coach - CoachConnecXion</title>
							--%>							
							<tr>
								<td>						
									<h3 style="text-align: left;"><B>Coaches: </B><a  rel="nofollow" style="color: #0254EB; font-size: 14px; " href="${pageContext.request.contextPath}/users/create">Click here to register</a> and get new clients.  Listing on this site is free. </h3><br>
								</td>
							</tr>	
							<tr><td><img src="${pageContext.request.contextPath}/images/hbr_consulting_therapy.png" alt="Consulting Coaching Therapy" height="200" width="600"/> <br>
								Chart from Harvard Business Review showing the relationship between consulting, therapy and the coaching process.							
							</td></tr>
							<tr><td style="text-align: left;">    
								<br>	
								Do you feel as though your career needs to be jump-started, but you don’t want to switch fields completely? It could be that you need help looking at your career and skill set through fresh eyes. A qualified Career Coach can help you craft the career of your dreams by identifying the skills you already have as well as those you might need to develop to move ahead. And CoachConnecXion is the perfect place to find the right career coach for you.
								<br><br>
								People turn to career coaches for help with many different issues. For example, you might want to start with an assessment of your work values, interests and skills so you can get a better idea of where you are and where you need to be. Your career coach can then help you develop a career path based on your knowledge, experience, skills and abilities -- and delineate the goals you need to meet to achieve that career path.
								<br><br>
								Many people go through their working lives just letting their careers take them where they will, without thinking about what they actually want out of life. A career coach can help you become more conscious in your career decisions so you can craft a more meaningful career with better work-life balance. 
								<br><br>
									<%-- 
									<br>
									<h2 style="text-align: left; text-decoration: underline;">What is career coaching?</h2>
									<h3 style="text-align: left;">Career coaching is the process of working with people to help them assess their talents and make critical decisions about career choice and direction. 
																At CoachConnecXion, you can find career coaching services where you can work with your ideal certified career coach. 
																</h3><br>
									--%>							
								</td>
							</tr>		
							<tr><td>		
									<h3 style="text-decoration: underline;">Here are some of the areas where a career coach can help you with the following:</h3>
									<ul style="list-style-type: square;">
									    <li style="text-align: left;">Develop specific career paths keeping in mind your experience, knowledge, abilities, and skills defined</li>
									    <li style="text-align: left;">Help you improve your self-confidence, become a more disciplined individual, and work with you to reduce your fear of success/failure</li>
									    <li style="text-align: left;">Create a career development plan to help you assess where you are and where you want to go</li>
									    <li style="text-align: left;">Helps you maximize your current role and advise you on how to move out of a stagnant situation</li>
									    <li style="text-align: left;">Work with you to explore internal opportunities by helping you with resume preparation, networking and follow-through</li>
									    <li style="text-align: left;">Identify and cultivate internal mentor and career advisor networks for personal career development</li>
									    <li style="text-align: left;">Provide unbiased, objective career counseling intervention/mediation/facilitation for people experiencing job stress, job loss or transition during corporate reorganizations, mergers or down-sizing</li>
									</ul>
								</td>	
							</tr>
						</table>		
					</td>
				</tr>
	</table>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	