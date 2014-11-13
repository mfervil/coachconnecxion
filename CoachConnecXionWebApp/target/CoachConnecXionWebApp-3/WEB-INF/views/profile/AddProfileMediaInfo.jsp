<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Add Coach/Trainer Profile Media</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Coaches and Trainers can help pictures and videos to promote their services" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

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
<script>
function validation(){
	//var value1=document.getElementById('fileName').value;
	var value2=document.getElementById('file').value;
	var i=0;
	if(value2==""){
		document.getElementById('errorMessage2').innerHTML="Please Select the file";
		i=1;
	}else{
		document.getElementById('errorMessage2').innerHTML="";
	}
	if(i==0){
		return true;
	}else{
		return false;
	}
}
</script>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

	<br></br>
	<c:url var="profileMediaUrl" value="/addProfileMedia" />
	<form:form method="POST" action="${profileMediaUrl}"
		modelAttribute="profileMediaAttribute" enctype="multipart/form-data">
		<input type="hidden" name="profileId" id="profileId" value="${profileId}"></input>
		
		<table style="width: 100%;">
			<tr>
				<td style="text-align: left; width: 200px;"><label for="file">Upload
						Your Picture:</label></td>
				<td style="text-align: left;"><input type="file" name="file"
					id="file" ></input></td>
				<td style="text-align: left; color: red; width: 300px;"><b id="errorMessage2" style="border:none; background:none;font-weight:bold;color: red;font-weight: normal;"></b></td>
			</tr>
			<tr>
				<td style="text-align: left; width: 200px;"><label
					for="fileName">Video URL:</label></td>
				<td style="text-align: left;"><form:input path="fileName" id="fileName" maxlength="100"/></td>
				<td style="text-align: left; color: red; width: 300px;"><b id="errorMessage1"  style="border:none; background:none;font-weight:bold;color: red;font-weight: normal;"></b></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: left;"><input type="submit" value="Save" onclick="return validation();"
					style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;" /></td>
			</tr>
		</table>

	</form:form>
	<table style="margin-top: -31px; margin-left: 0px;">
		<tr>
			<td><c:url var="profileUrl" value="/profile" /> <form:form
					commandName="/profile" method="GET" action="${profileUrl}">
					<input type="submit"
						style="text-decoration: none; font-size: 14px; text-align: right; background-color: lightblue; background-position: right;"
						value="Back">
				</form:form></td>
		</tr>
	</table>



	<form:form>
		<h1 style="font-size: 14px; text-align: center;">${profileMediaMessage}</h1>
		<c:if test="${!empty profileMedias}">
			<table style="width:500px;">
				<tr>
					<th>Video URL</th>
					<th>&nbsp;</th>
				</tr>
				<c:forEach items="${addProfileMedias}" var="document">
					<c:url var="deleteUrl" value="/remove?id=${document.id}" />
					<tr>
						<td width="450px">
						<div style="width:430px;word-wrap: break-word;">${document.fileName}</div></td>
						<td width="40px"> <a href="${deleteUrl}"
							onclick="return confirm('Are you sure you want to delete this document?')"><img
								src="${pageContext.request.contextPath}/images/delete_icon.gif" border="0"
								title="Delete this document" /></a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</form:form>
	<br></br>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
