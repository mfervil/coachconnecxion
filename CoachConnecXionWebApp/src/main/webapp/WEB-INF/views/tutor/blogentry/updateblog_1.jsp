<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Personal Coach/Trainer Blog</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Allows our Coaches and Trainers to provide details of the services they offer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>


<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script src="js/jquery.js"></script>

 
<script type="text/javascript">

</script>


<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/blogpostDetails.js"></script>

<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
 
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg').wysiwyg();

	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#wysiwyg1').wysiwyg();

	});
</script>

<script type="text/javascript">
$(function() {
   $('#submitButton').click(function(e) {
       // e.preventDefault();
        $("#createblogpostForm").submit();
    });

   $('#cancelButton').click(function(e) {
        //e.preventDefault();
        $("#cancelForm").submit();
    });
});
</script>

<style type="text/css">
table tr {
	border: none
}

table tbody {
	border: none;
}

lable {
	font-size: 14px;
}

</style>
<style type='text/css'>
div#myDialog {
	text-align: center;
	position: absolute;
	top: 55%;
	left: 50%;
	width: 350px;
	margin: -101px 0 0 -251px;
	border: 1px solid rgb(128, 128, 128);
	background-color: #EAEAEA;
	border-radius: 10px;
	padding: 10px;
}
</style>
<script>
	function createBlogLoad() {
		var value1 = document.getElementById("success").value;
		if (value1 != "") {
			document.getElementById("submit1").disabled = true;
			
			if (document.all || document.getElementById) {
				for (i = 0; i < createblogpostForm.length; i++) {
				var formElement = createblogpostForm.elements[i];
					if (true) {
						formElement.disabled = true;
					}
				}
			}
			
			
		} else {
			document.getElementById("submit1").disabled = false;
		}
	}
</script>
	
</head>
<body onload="createblogpostLoad();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	<a href="https://www.coachconnecxion.com">&gt;&gt;Home</a><br><br>

	<div style="text-align: left; margin-left: 10px;">
		<input type="hidden" name="success" id="success"
			value="${successMessage}"></input> <input type="hidden"
			name="success1" id="success1" value="3"></input>
			
		<c:if test="${sessionScope.newusercreated == '1'}">
			<p><b> ENTER blogpostS FOR CUSTOMERS TO PURCHASE</b></p>
		</c:if>
		
		<c:choose>
			<c:when test="${not empty successMessage}">
				<div id='myDialog'>
					<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
					<br><br> <a href="blogpostAdd"
						style="font-size: 14px; text-decoration: underline; color: blue;">CREATE ANOTHER blogpost</a>
						
					<c:if test="${sessionScope.newusercreated != '1'}">
							<br><br><a href="blogposts" style="font-size: 14px; text-decoration: underline; color: blue;">VIEW YOUR blogpostS</a>
					</c:if>
					
					<c:if test="${sessionScope.newusercreated == '1'}">
						<br><br> <a href="educationAdd?profileId=${userProfileId}"
							style="font-size: 14px; text-decoration: underline; color: blue;">NEXT >> </a>  
					</c:if>
					
					<div style="height: 15px;"></div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<br></br>


	<c:url var="saveUrl" value="/blogpostAdd" />
		<table style="border: none; width: 900px; text-align: center"  class="blog-page-table">
			<form:form modelAttribute="blogpostAttribute" method="POST" id="createblogpostForm" action="${saveUrl}">
			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="blogpostName">Blog Title:</form:label></td>
				<td style="text-align: left; margin-left: -2px; width: 460px;">
			
				<form:input
						path="blogpostName" size="30" maxlength="50" cssStyle="width: 197px;"/><font style="font-size: 14px; color: red;margin-left: 2px;">${errorMessage1}</font></td>
			</tr>

			<tr><td>&nbsp;</td></tr>
			
			<tr>
				<td style="text-align: left; width: 150px;"><form:label
						path="overView">Post Blog: </form:label>
						<font style="font-size: 14px; color: red;margin-left: -35px;">${errorMessage5}</font>
				</td>
			</tr>
			<tr style="text-align: left;">
				<td style="text-align: left;">
					<div style="height: 5px;"></div> <form:textarea name="wysiwyg"
						id="wysiwyg" rows="5" cols="48" path="overView" value="&nbsp;"></form:textarea>
				</td>
			</tr>


			</form:form>

			<c:if test="${sessionScope.newusercreated == '1'}">
			
				<tr >
					<td></td>
					<td style="text-align: left; width: 150px;"><input
						type="submit" value="NEXT >>" name="submit1" id="submitButton"
						style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
					</td>
				</tr>
			</c:if>

			<c:if test="${sessionScope.newusercreated != '1'}">
			
				<tr >
					<td></td>
					<td style="text-align: left; width: 150px;"><input
						type="submit" value="Submit" name="submit1" id="submitButton"
						style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
						&nbsp;&nbsp;
							<input type="submit" value="Cancel" id="cancelButton"
								style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
					</td>
				</tr>
			</c:if>

			
		</table>
	<c:url var="cancelUrl" value="/blogposts" />
	<form:form method="get" action="${cancelUrl}" commandName="/blogposts" id="cancelForm">
	</form:form>
	
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
