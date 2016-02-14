<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>${blogPost.coachingcategoryName} Coaches ${blogPost.blogtitle}</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="${blogPost.metadescription}" />
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
     
	<table style="width: 900px;" class="blog-page-table">
		<tr>
				<td style="width: 730px; padding: 5px;">
				
					<!-- BLOG FORM -->
					<form:form method="post" commandName="blogPost" id="blogPostForm" enctype="multipart/form-data">
						<h3 style="color:red"> ${errorMessage} </h3>
					
						<table>
								<tr>
									<td style="margin-top: 4px; vertical-align: text-top;"> <!-- style="margin-top -->
										<br>
										<table>
											<tr>
												<td style=" vertical-align: top; padding: 5px; text-align: left; background-color: #CCCCFF; white-space: nowrap;" >
												Posted by: ${blogPost.creatorfirstname} ${blogPost.creatorlastname}<br>${monthname} ${blogPost.publishday}, ${blogPost.publishyear}</td>
												<td style="text-align: left; width: 100%"><h1 style="color: #9966FF">&nbsp;&nbsp;${blogPost.blogtitle}</h1></td>
											</tr>
										</table>
										<p style="text-align: left; "><a style="color: blue" href="#commentsection">Add / View Comments</a></p>
										<table>
											<tr><td>&nbsp;</td></tr>
											<tr>
												<td style="text-align: left; vertical-align: text-top;" > ${blogPost.blogposting} </td>
											</tr>
											<tr><td style="text-align: left"><a href="${pageContext.request.contextPath}/update-blog/blogId/${blogId}">.</a></td></tr>
										</table>
									</td> <!-- End style="margin-top -->
									
									<%-- Right navigation --%>
									<td style="vertical-align: text-top; white-space: nowrap; text-align: left; ">
										<a style="color: blue;" href="${pageContext.request.contextPath}/blogview/recent-personal-coach-blogs"> &nbsp; ** &nbsp; MOST RECENT BLOGS &nbsp; ** &nbsp;</a>
										<br><br>
										<%@ include file="/WEB-INF/views/blogview/blogArchives.jsp" %>
										<%--
										&nbsp; ** &nbsp; ARCHIVES &nbsp; ** <br>
										<c:forEach items="${blogmonths}" varStatus="status" var="blogmonths">
											<c:set var="dateParts" value="${fn:split(blogmonths, '*')}" />
											<a style="color: blue;" href="${pageContext.request.contextPath}/blogview/professional-coaches/month/${dateParts[1]}/year/${dateParts[2]}">&nbsp; * &nbsp; ${dateParts[0]}</a>
											<br>
										</c:forEach>
										 --%>							
									</td>
								</tr>
						</table>	
					</form:form>

					<!-- BLOG FORM -->
					<c:url var="blogUrl" value="/blogview/blog-comment-update/blogref/${blogComment.blogid}" />
					<form:form modelAttribute="blogComment" method="POST" id="addComment" action="${blogUrl}">	
										
										
						<form:hidden path="blogid" />
					
					<%-- <form:form method="post" commandName="blogCommentPost" id="blogCommentPostForm" enctype="multipart/form-data"> --%>

							<a name="commentsection"></a>

							<table>
							<tr>
								<td class="leftalign" > <label>*LEAVE A COMMENT </label> <font style="font-size: 14px; color: red;"> <form:errors path="comment" cssClass="error" /></font><br>
									<form:textarea  name="comment" class="required" cols="75"
									id="wysiwyg" rows="5" path="comment" value="&nbsp;"/> 
								</td>
							</tr>
							<tr><td class="leftalign" nowrap><form:errors path="email"><br></form:errors><label>*Email (EMAIL IS NEVER MADE PUBLIC) </label> <font style="font-size: 14px; color: red;"> <form:errors path="email" cssClass="error" /></font> <br>
								<form:input size="50" path="email" /> </td> 
							</tr>
							<tr><td class="leftalign" nowrap><form:errors path="name"><br></form:errors><label>*Name </label> <font style="font-size: 14px; color: red;"> <form:errors path="name" cssClass="error" /></font> <br>
								<form:input size="50" path="name" /> </td> 
							</tr>
							<tr><td class="leftalign" nowrap><form:errors path="website"><br></form:errors><label>Website: </label> <br>
								<form:input size="50" path="website" /> </td> 
							</tr>
						</table>
						<table>
							<tr>
								<td class="leftalign">
									<%-- <input type="submit" class="input-button" value="CANCEL" />  --%>
									<input type="submit" class="input-button" value="SAVE COMMENT" />
								</td>
							</tr>
						</table>
						
						<br><p style="font-size: 24px; text-align: left"> Comments on: ${blogTitle} </p>
						<p style="color: green; font-size: 20px; text-align: left">${reviewCommnet}</p> 
						<c:forEach items="${blogComments}" varStatus="status" var="blogComments">
							<br><p style="color: blue; font-size: 16px; text-align: left">${blogComments.name}: &nbsp;
							<fmt:formatDate pattern="MMM-dd-yyyy" value="${blogComments.createddate}" />&nbsp;at&nbsp; 
							<fmt:formatDate pattern="hh:mm a" value="${blogComments.createddate}" />
							</p>
						
							<p style="text-align: left">${blogComments.comment}</p><br>
							<hr>
						</c:forEach>							
						
					</form:form>
							
				</td>
			</tr>	
		</table>
		<input type="hidden" name="blogId" id="blogId" value="${blogId}"></input>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>