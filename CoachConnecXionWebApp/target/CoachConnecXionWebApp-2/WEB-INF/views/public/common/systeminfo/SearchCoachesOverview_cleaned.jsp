<%@ include file="/WEB-INF/views/common/include.jsp" %>
<%@ include file="/WEB-INF/views/common/header_no_side.jsp" %>	

<title>Profile Overview</title>
 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<!-- CONTACT FORM -->
		<form:form method="post" commandName="userProfile" enctype="multipart/form-data">
	<table style="width: 900px;">
		<tr>
			<td style="width: 400px; padding: 5px;">
				<table>
					<tr>
						<td style="margin-top: 4px;"> <!-- style="margin-top -->
	
	<table style="border:1px solid;">	

<tr><td>	

<p style="text-align:left;">
The search option of the site helps you in finding a coach.  
You should narrow down your search criteria as much as possible, so you do not get too many results.  
On the other hand, if you want to see a lot of options, then leave your search more open, but that may make it 
more difficult to find a coach that is specific to your needs.
</p>
<br>
<p style="text-align:left;">To find a coach that meets your needs, follow the following steps:</p>
<br>

<ul style="list-style-type:decimal;">
<li style="text-align:left;">Click on the Search in the menu bar, and select the “Find a Coach” option.  This option will present you with the screen below:
<br> <br>
<img src="${pageContext.request.contextPath}/images/searchhelp/filter.png" title="Back to top" />
</li>
<li style="text-align:left;">Select what you want to search by.  For example, if you wanted to search for coaches who work in business development, then you would select business development in the Coaching category page and click on next, and you will get to the page below showing all the available coaches that meet your search criteria.
<br><br>
<img src="${pageContext.request.contextPath}/images/searchhelp/coachlisting.png" title="Back to top" />
</li>
<li style="text-align:left;">In the page above, you will look through the list of coaches and select the ones you like the most by clicking on the “See details and Video” link.  Upon clicking the link, the page below will be displayed:
<br><br>
<img src="${pageContext.request.contextPath}/images/searchhelp/coachlisting.png" title="Back to top" />
</li>
<li style="text-align:left;">To see more details about the selected coach, click the first 3 links (Overview, Education, Job History) on the top left of the page above.
</li><br>
<li style="text-align:left;">To see details of the packages this coach has to offer, click on the available packages link in the page above, and it should display the packages as below:
<br><br>
<img src="${pageContext.request.contextPath}/images/searchhelp/packagesdisplayed.png" title="Back to top" />
</li>
<li style="text-align:left;">To purchase a package, click on the “Buy This Package” button to proceed to the page where you can pay for the package as below:
<br><br>
<img src="${pageContext.request.contextPath}/images/searchhelp/PayForPackage.png" title="Back to top" />
</li><br>
<li style="text-align:left;">After entering your credit card information, you will receive a confirmation email, and your coach will contact you for next steps.
</li>

</ul>
 
</td></tr>

			</table>
						</td> <!-- End style="margin-top -->

					</tr>

				</table>			
			</td>
		</table>
			
		</form:form>
</section>
<%@ include file="/WEB-INF/views/common/footer_no_side.jsp" %>	

