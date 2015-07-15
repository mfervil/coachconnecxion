<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Coach Error Page</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content="Error Page" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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

<style>
span.required {color:red;font-weight:bold}
</style>

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>

<b> <span style="font-size: 1.25em;">
<c:choose>
   <c:when test="${empty errorMessage}"><br><br>We're sorry, but the page you're looking for has either been moved or is no longer available. <br>Please use the top navigation to find the new page.</c:when> 
   <c:otherwise><c:out value="${errorMessage}"/></c:otherwise> 
</c:choose>
</span></b>
 <br />
 <br />
 <br />
 <br />
 <br />
 <br />
 <br />
 <br />
 <br />
 <br />

</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>