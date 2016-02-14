<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Personal coach and professional coach blogs by month</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="News and information for personal coaches and professional coaches as well as those seeking the help and guidance of a personal coaching service" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%-- BEGIN Header No Side test --%>
<%-- END Header No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_head.jsp" %>

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

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>
	
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
     
	<table style="width: 900px;"  class="blog-page-table">
		<tr>
				<td style="width: 730px; padding: 5px;">
					<table>
						<tr>
							<td style="margin-top: 4px;"> <!-- style="margin-top -->
					<br>
					<table>
					<tr>
						<td style=" vertical-align: top; padding: 5px; text-align: left; background-color: #CCCCFF; white-space: nowrap;" >Posted by: ${blogPost.creatorfirstname} ${blogPost.creatorlastname}<br>${monthname} 5, 2015</td>
						<td style="text-align: left; width: 100%"><h1 style="color: #9966FF">&nbsp;&nbsp;${blogPost.blogtitle} -- ${blogPost.publishyear}/${blogPost.publishmonth}/${blogPost.publishday}</h1></td>
					</tr>
					</table>
					<table>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td class="leftalign" > ${blogPost.blogposting} </td>
					</tr>
					<tr><td style="text-align: left"><a href="${pageContext.request.contextPath}/update-blog/blogId/${blogId}">__</a></td></tr>
				</table>
	
							</td> <!-- End style="margin-top -->
						</tr>
	
					</table>			
				</td>
			</tr>	
		</table>
		<input type="hidden" name="blogId" id="blogId" value="${blogId}"></input>
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>