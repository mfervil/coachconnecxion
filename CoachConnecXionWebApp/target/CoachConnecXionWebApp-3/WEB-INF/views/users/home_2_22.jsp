<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="ua.com.bitlab.springsecuritydemo.services.security.SecurityUtils" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>CoachConnecXion Contact US</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta charset="utf-8" />
	<meta name="description" content=" CoachConnecXion" />
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

</head>
<body >

<%-- BEGIN BODY No Side test --%>
<%-- END BODY No Side test --%>

	<%@ include file="/WEB-INF/views/common/header_no_side_body.jsp" %>		
		

		<!-- ELASTIC SLIDER -->
		<section>		
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/Coach_1.png" alt="Business Coach"/>
						<div class="ei-title black_bg">
							<h2>DON'T HAVE THE EXPERIENCE</h2>
							<h3>GET A COACH WHO'S BEEN THERE AND DONE THAT</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/skilled.jpg" alt="Business Coach"/>
						<div class="ei-title black_bg">
							<h2>ARE YOUR SKILLS OUTDATED </h2>
							<h3>FIND A COACH WHO'S TECHNICALLY SAVY</h3>
						</div>
					</li>
                     <li>
						<img src="${pageContext.request.contextPath}/images/HomePage/mountain.jpg" alt="Corporate Coach"/>
						<div class="ei-title">
							<h2>LOOKING FOR A FINAL PULL</h2>
							<h3>OR PUSH TO GET YOU TO THE TOP</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/remote.jpg" alt="Coaching Any Time Any Plance"/>
						<div class="ei-title black_bg">
							<h2>GET COACHED ANY TIME ANY PLACE</h2>
							<h3>EVEN IN THE COMFORT OF YOUR OWN HOME</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/exercize.jpg" alt="Excersize Coach"/>
						<div class="ei-title">
							<h2>LOOKING TO LOSE THOSE 5 EXTRA POUNDS</h2>
							<h3>A PERSONAL COACH MAY BE YOUR ANSWER</h3>
						</div>						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/HomePage/chef.jpg" alt="New Field Coach"/>
						<div class="ei-title black_bg">
							<h2>TRYING SOMETHING NEW</h2>
							<h3>A COACH IN THE FIELD IS THE QUICKEST ROUTE</h3>
						</div>						
					</li>									
				</ul>
								
				<ul class="ei-slider-thumbs">
					<li class="ei-slider-element">Current</li>
					<li><a href="#">Slide 1</a></li>
					<li><a href="#">Slide 2</a></li>
					<li><a href="#">Slide 3</a></li>
					<li><a href="#">Slide 4</a></li>
					<li><a href="#">Slide 5</a></li>
					<li><a href="#">Slide 6</a></li>
				</ul>												
			</div>		
	</section>
<!-- END OF ELASTIC SLIDER -->
		
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	
