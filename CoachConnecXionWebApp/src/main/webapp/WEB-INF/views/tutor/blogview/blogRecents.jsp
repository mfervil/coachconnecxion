<a style="color: blue; text-decoration: underline;" href="${pageContext.request.contextPath}/tutor/blogview/recent-personal-coach-blogs"> &nbsp; ** &nbsp; ALL RECENT BLOGS &nbsp; ** &nbsp;</a>
<c:forEach items="${blogPostListing}" varStatus="status" var="blogPost">
	<p><a style="color: blue;" href="#${blogPost.blogid}">&nbsp;*&nbsp;${fn:substring(blogPost.blogtitle, 0, 30)}..</a></p>								
</c:forEach>							
