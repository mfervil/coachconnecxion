<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Edit Coaching/Training Packages</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Allows our Coaches and Trainers to provide details of the services they offer" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>
 
<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="jquery/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="js/packageDetails.js"></script>

<script type="text/javascript">
$(function() {
   $('#submitButton').click(function(e) {
       // e.preventDefault();
        $("#createPackageForm").submit();
    });

   $('#cancelButton').click(function(e) {
        //e.preventDefault();
        $("#cancelForm").submit();
    });
});
</script>

<script type="text/javascript">
	function getStates() {
		$.getJSON("AddUser.htm", {
			credit : $('#categoryIndex').val()
		}, function(data) {
			var options = '';
			var len = data.length;
			options = '<option value="' + "-1" + '">' + "Select from list"
					+ '</option>';
			for ( var i = 0; i < len; i++) {
				options += '<option value="' + data[i].id + '">'
						+ data[i].subCategoryName + '</option>';
			}
			$('#subcategoryIndex').html(options);
		});
	}

	$(document).ready(function() {
		$('#categoryIndex').change(function() {
			getStates();
		});
	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#overView').wysiwyg();

	});
</script>
<script type="text/javascript">
	$(function()

	{

		$('#packageDetails').wysiwyg();

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
function disableObjects() {
	var value1 = document.getElementById("success").value;	
	if (value1 != "") {
		document.getElementById("submit1").disabled = true;		
		document.getElementById("packageDetails").disabled = true;	
		document.getElementById("overView").disabled = true;	
		if (document.all || document.getElementById) {
			for (i = 0; i < createPackageForm1.length; i++) {
			var formElement = createPackageForm1.elements[i];
			
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
<body onload="disableObjects();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<div style="text-align: left; margin-left: 10px;">

		<input type="hidden" name="success" id="success"
			value="${successMessage}"></input>

		<c:choose>
			<c:when test="${not empty successMessage}">
				<div id='myDialog'>
					<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
					<br> Click&nbsp;&nbsp;<a
						href="packageEdit?id=${packageAttribute.id}"
						style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
					update employer again <br>OR <br> Click&nbsp;&nbsp;<a
						href="packages"
						style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
					continue summary page
					<div style="height: 15px;"></div>
				</div>
			</c:when>
		</c:choose>

	</div>
	<br></br>

	<c:url var="saveUrl" value="/packageEdit?id=${packageAttribute.id}" />
		<table style="border: none; width: 900px; text-align: center">
		  <form:form modelAttribute="packageAttribute" method="POST" id="createPackageForm" action="${saveUrl}">
			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="packageName">Package Title:</form:label></td>
				<td style="text-align: left; margin-left: -2px; width: 460px;"><form:input
						path="packageName" size="30" cssStyle="width: 197px;"/><font style="font-size: 14px; color: red;margin-left: 2px;">${errorMessage1}</font></td>
			
			</tr>

<%-- 
			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="categoryIndex">Category </form:label></td>
				<td style="text-align: left;"><form:select path="categoryIndex"
						style="width:202px;" id="categoryIndex">
						<form:option value="-1">Select from list</form:option>
						<form:options items="${categoryId}" />
					</form:select><font style="font-size: 14px; color: red;margin-left: 2px;">${errorMessage2}</font></td>
				
			</tr>

			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="subcategoryIndex">Subcategory </form:label></td>
				<td style="text-align: left;"><form:select
						path="subcategoryIndex" id="subcategoryIndex" style="width:202px;">
						<form:option value="-1" label="Select from list"></form:option>
						<form:options items="${subcategoryId}" itemValue="id"
							itemLabel="subCategoryName"></form:options>
					</form:select><font style="font-size: 14px; color: red;margin-left: 2px;">${errorMessage3}</font></td>
				
			</tr>
--%>
			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="priceValue">Price</form:label></td>
				<td style="text-align: left; margin-left: -2px;"><form:input
						path="priceValue" size="30" cssStyle="width: 197px;"/><font style="font-size: 14px; color: red;margin-left: 2px;">${errorMessage4}</font></td>
				
			</tr>

			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="overView">Overview </form:label></td>
				<td style="text-align: left;"><form:textarea name="overView"
						id="overView" rows="5" cols="48" path="overView"></form:textarea></td>
				<td style="text-align: left;"><font style="font-size: 14px; color: red;margin-left: -35px;">${errorMessage5}</font></td>

			</tr>
			<tr>
				<td style="height: 5px;"></td>
			</tr>

			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="packageDetails">Package Details </form:label></td>
				<td style="text-align: left;"><form:textarea name="packageDetails"
						id="packageDetails" rows="5" cols="48" path="packageDetails"></form:textarea></td>
				<td style="text-align: left;"><font style="font-size: 14px; color: red;margin-left: -35px;">${errorMessage6}</font></td>
			</tr>
		  </form:form>

			<tr>
				<td></td>
				<td style="text-align: left"><input type="submit"
					value="Submit" name="submit1" id="submitButton"
					style="text-decoration: none; font-size: 14px; background-color: lightblue; " />
					&nbsp;&nbsp;
						<input type="submit" value="Cancel" id="cancelButton"
							style="text-decoration: none; font-size: 14px; background-color: lightblue;" />
				</td>
			</tr>
		</table>
		
		<c:url var="cancelUrl" value="/packages" />
		<form:form method="get" action="${cancelUrl}" commandName="/packages" id="cancelForm">
		</form:form>
		
	<br></br>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
