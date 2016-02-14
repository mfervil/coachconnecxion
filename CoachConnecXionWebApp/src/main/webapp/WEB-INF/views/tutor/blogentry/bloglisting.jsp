<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Blog Entry for Personal tutors and personal tutoring services</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Information and news for personal tutors to help in their practice as well as information for those seeking the help of talented" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_head.jsp" %>

<link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
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
	$(function()

			{

				$('#wysiwygskills').wysiwyg();

			});
		</script>
		<script type="text/javascript">
			$(function()

			{

				$('#wysiwygkeywords').wysiwyg();

			});
</script>

    <script>
    $(document).ready(function(){
            $('#form').validate();
    })
</script>

<style>
label {font-size:14px;}
</style>
	
</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/tutor/common/header_no_side_body.jsp" %>
	
	<table>
	<tr>
	<td style="text-align: left;"><a href="https://www.coachconnecxion.com">&gt;&gt;Home</a></td>
	<td style="text-align: right;">
		                     <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	<%-- 
	<span id="siteseal" style="text-align:right"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=ajQKa9YShJk85DvQ57knD36bbht7vtTcFqVvPUdH7u5AlWR8VQVRv"></script></span>
	--%>
	</td>
	</tr>
	</table>
			<br>
		<!-- CONTACT FORM -->
		<form:form method="post" commandName="blogPost" id="blogPostForm" enctype="multipart/form-data">
		<h3 style="color:red"> ${errorMessage} </h3>

	<h2 style="text-align: center;">Create/Update Your Personal Coach Blog Posting</h2>									
	<table style="width: 900px;"  class="blog-page-table">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
						
				<hr>
				<br>
				<table>

				<tr><td class="leftalign" nowrap><form:errors path="blogtitle"><br></form:errors><label>*Blog Title:</label> <form:input size="75" path="blogtitle" /> </td> 
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="leftalign" > <label>*Blog Post: Create the full blog including images </label> <font style="font-size: 14px; color: red;"> <form:errors path="blogposting" cssClass="error" /></font><br>
						<form:textarea  name="wysiwyg" class="required" cols="100"
						id="wysiwyg" rows="30" path="blogposting" value="&nbsp;"/> 
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="leftalign">
						<input type="submit" class="input-button" value="CANCEL" />
						<input type="submit" class="input-button" value="SUBMIT" />
					</td>
				</tr>
			</table>

						</td> <!-- End style="margin-top -->
					</tr>

				</table>			
			</td>
		</table>
		<input type="hidden" name="blogId" id="blogId" value="${blogId}"></input>
		</form:form>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
