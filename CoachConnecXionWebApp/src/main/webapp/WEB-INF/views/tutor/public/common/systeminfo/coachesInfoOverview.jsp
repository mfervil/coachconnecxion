<%@ include file="/WEB-INF/views/tutor/common/include.jsp" %>
<%@ include file="/WEB-INF/views/tutor/common/header_no_side.jsp" %>	
<style>
li {font-size:16px;}
</style>

<style>
p {font-size:16px;}
</style>

<title>System Overview for Coaches and Trainers</title>
<meta name="description" content="Brief description on how coaches should use the system to set themselves up" />
 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!-- CONTACT FORM -->
		<form:form method="post" commandName="userProfile" enctype="multipart/form-data">
	<table style="width: 900px;">
		<tr>
			<td style="width: 730px; padding: 5px;">
				<table>
<tr><td>	

<p style="text-align:left;">
This section of the system allows coaches to setup their profile so they can be easily connected to prospective clients.  The system first helps the coaches setup their profile on the system, and then allows them to enter their available coaching packages.
</p>
<br>
<p style="text-align:left;">To setup your profile and start selling packages on CoachConnecXion.com, please follow the steps below:</p>
<br>

<ul style="list-style-type:decimal;">
<li style="text-align:left;">Click on the Coaches link in the top navigation, and then select the “Register as a Coach” option which should take you to the page below to enter your profile information.  Once you submit, your profile will have been created.  Please keep in mind that you must register first before being allowed to create a profile:
<br> <br>
<img src="${pageContext.request.contextPath}/images/coachHelp/coachprofile.png" title="Back to top" /> <br><br>
</li>
<li style="text-align:left;">After creating a profile, you can then proceed to create packages for clients to purchase.  You can access the create package page by either linking to it from the create profile confirmation page or by clicking on the Coaches link on the top menu and then selecting the “Create Packages” option.  Selecting this option will take you to the page below:
<br><br>
<img src="${pageContext.request.contextPath}/images/coachHelp/createPackages1.png" title="Back to top" /> <br><br>
</li>
<li style="text-align:left;">After creating packages, you can view the package summary page by either clicking on the link to view summary page on the create packages page, or by clicking the “Package Summary” option from the Coaches menu on the top navigation.  Upon selecting the “Package Summary” option, you will see the “Package Summary” page below:
<br><br>
<img src="${pageContext.request.contextPath}/images/coachHelp/packageSummary.png" title="Back to top" /> <br><br>
</li>
<li style="text-align:left;">The package summary page gives you the option to Add, Edit or Delete pages.
</li>
</ul>
 
</td></tr>
				</table>			
			</td>
		</table>
			
		</form:form>
</section>
<%@ include file="/WEB-INF/views/tutor/common/footer_no_side.jsp" %>	
