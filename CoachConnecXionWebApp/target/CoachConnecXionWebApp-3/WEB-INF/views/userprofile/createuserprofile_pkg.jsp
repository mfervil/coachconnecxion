<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Selecting your coach</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>


<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
<script src="js/jquery.js"></script>

 
<script type="text/javascript">
function getSubCategories(){
    $.getJSON(
         "AddUser.htm", 
         {credit: $('#categoryIndex').val()},
         function(data) {
        	 var options = '';
              var len = data.length;
              options='<option value="' + "-1" + '">' + "Select from list" + '</option>';
              for(var i=0; i<len; i++){
            	  options  += '<option value="' + data[i].id + '">' + data[i].subCategoryName + '</option>';
               }
              $('#subcategoryIndex').html(options);
         }
      );
}

  $(document).ready(function() {
     $('#categoryIndex').change(function()
      {   getSubCategories();
      });
  });
</script>


<script type="text/javascript" src="jquery/jquery-1.3.2.js"></script>
<script type="text/javascript" src="js/packageDetails.js"></script>

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
        $("#createPackageForm").submit();
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
	function createPackageLoad() {
		var value1 = document.getElementById("success").value;
		if (value1 != "") {
			document.getElementById("submit1").disabled = true;
			
			if (document.all || document.getElementById) {
				for (i = 0; i < createPackageForm.length; i++) {
				var formElement = createPackageForm.elements[i];
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
<body onload="createPackageLoad();">

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<div style="text-align: left; margin-left: 10px;">
		<input type="hidden" name="success" id="success"
			value="${successMessage}"></input> <input type="hidden"
			name="success1" id="success1" value="3"></input>
		<c:choose>
			<c:when test="${not empty successMessage}">
				<div id='myDialog'>
					<h1 style="font-size: 14px; color: green;">${successMessage}</h1>
					<br> Click&nbsp;&nbsp;<a href="packageAdd"
						style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
					create another package <br>OR <br> Click&nbsp;&nbsp;<a
						href="packages"
						style="font-size: 14px; text-decoration: underline; color: blue;">here</a>&nbsp;&nbsp;To
					continue summary page
					<div style="height: 15px;"></div>
				</div>
			</c:when>
		</c:choose>
	</div>
	<br></br>


	<c:url var="saveUrl" value="/packageAdd" />
		<table style="border: none; width: 900px; text-align: center">
		<form:form method="post" commandName="userProfile" enctype="multipart/form-data">

			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="overView">Overview </form:label></td>
				<td style="text-align: left;">
					<div style="height: 5px;"></div> <form:textarea name="wysiwyg"
						id="wysiwyg" rows="5" cols="48" path="overview" value="&nbsp;"></form:textarea>
				</td>
				<td style="text-align: left;"><font style="font-size: 14px; color: red;margin-left: -35px;">${errorMessage5}</font></td>
			</tr>

			<tr style="text-align: left;">
				<td style="text-align: left; width: 150px;"><form:label
						path="packageDetails">Package Details </form:label></td>
				<td style="text-align: left;">
					<div style="height: 10px;"></div> <form:textarea name="wysiwyg1"
						id="wysiwyg1" rows="5" cols="48" path="serviceDescription"
						value=""></form:textarea>
				</td>
				<td style="text-align: left;"><font style="font-size: 14px; color: red;margin-left: -35px;">${errorMessage6}</font></td>
			</tr>

			</form:form>
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

		</table>
	<c:url var="cancelUrl" value="/packages" />
	<form:form method="get" action="${cancelUrl}" commandName="/packages" id="cancelForm">
	</form:form>
	
<%-- 	
	<table
		style="margin-top: -31px; margin-left: 4px; border-bottom: medium none;">
		<tr>
			<td style="text-align: left"><c:url var="cancelUrl" value="/packages" /> <form:form
					method="get" action="${cancelUrl}" commandName="/packages">

					<input type="submit" value="Cancel"
						style="text-decoration: none; font-size: 14px; text-align: left; background-color: lightblue;" />
				</form:form></td>
		</tr>
		<tr>
			<td style="height: 10px;"></td>
		</tr>
	</table>
	<br></br>
--%>	
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
