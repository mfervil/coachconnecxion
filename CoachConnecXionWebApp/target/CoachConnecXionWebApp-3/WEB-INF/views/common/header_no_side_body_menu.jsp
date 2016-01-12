			<%-- MENU --%>
			<nav>
				<ul id="menu">   
					<li><a href="#">FIND A COACH</a>
						<ul>	
							<li style="text-decoration: underline;">ADVANCED SEARCHES</li>
							<li><a href="${pageContext.request.contextPath}/public/landing-general-personal-coaches" style="text-decoration: underline;">ALL COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-add-adhd-coaches">ADD & ADHD COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-business-coaches">BUSINESS COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-career-coaches">CAREER UPGRADE COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-college-preperation-testing-coaches">COLLEGE PREP. TESTING COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-diet-nutrition-weigh-loss-coaches">DIET / NUTRITION / WEIGHT LOSS COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-entrepreneurship-coaches">ENTREPRENEURSHIP COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-executive-corporate-management-coaches">EXECUTIVE / MANAGEMENT COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-family-coaches">FAMILY COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-finance-money-coaches" >FINANCE / MONEY COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-health-fitness-exercise-coaches">HEALTH / FITNESS / EXERCISE COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-leadership-coaches">LEADERSHIP COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-life-coaches">LIFE COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-motivational-performance-coaches">PERFORMANCE / MOTIVATIONAL COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-relationship-couples-coaches">RELATIONSHIP / COUPLES COACHES</a></li> 
							<li><a href="${pageContext.request.contextPath}/public/landing-sales-coaches">SALES COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-team-and-group-coaches">TEAM BUILDING AND GROUP COACHES</a></li>

<%-- 
							<li><a href="${pageContext.request.contextPath}/public/landing-general-personal-coaches" style="text-decoration: underline;">ALL COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-business-coaches">BUSINESS COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-career-coaches">CAREER COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-corporate-coaches">CORPORATE COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-family-coaches">FAMILY COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-finance-money-coaches">FINANCE / MONEY COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-fitness-coaches">FITNESS COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-nutrition-coaches">NUTRITION COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-life-coaches">LIFE COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/public/landing-relationship-coaches">RELATIONSHIP COACHES</a></li>
--%>							
						</ul>
					</li>

					<li><a href="#">CLIENTS</a>
						<ul>	
							<!-- <li><a href="${pageContext.request.contextPath}/public/coachSelection">FIND A COACH</a></li>  -->
							<li><a href="${pageContext.request.contextPath}/coach/contact/mass-email-to-coaches">REQUEST COACHING PROPOSALS</a></li>
							<li><a href="${pageContext.request.contextPath}/viewOrders">PURCHASES & MESSAGES</a></li>
							<li><a href="${pageContext.request.contextPath}/viewOrders">COMMENTS & RATINGS</a></li>
							<!-- <li><a href="${pageContext.request.contextPath}/public/information?type=so">SEARCH OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/public/information?type=sf">FAQ</a></li>
							-->
						</ul>
					</li>
					<li><a href="#">COACHES</a>
						<ul>	
							<%-- <li><a href="${pageContext.request.contextPath}/users/create?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">REGISTER AS A COACH</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/public/profile?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW / CREATE MY PROFILE</a></li>
							<%-- <li><a href="${pageContext.request.contextPath}/packageAdd?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">CREATE MY PACKAGE</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/packages?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW / CREATE PACKAGES</a></li>
							<li><a href="${pageContext.request.contextPath}/viewRequests?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW REQUESTS</a></li>
							<!--  <li><a href="${pageContext.request.contextPath}/public/information?type=co">COACHING OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/public/information?type=cf">FAQ</a></li>
							 -->
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/how-it-works">HOW IT WORKS</a></li>
					<%-- <li><a href="${pageContext.request.contextPath}/public/information?type=nw">NEWS</a></li> --%>
					
					<%-- 
					<li><a href="${pageContext.request.contextPath}/users/login">SIGN IN</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/users/create">REGISTER</a></li>
							<li><a href="${pageContext.request.contextPath}/users/login">SIGN IN</a></li>
						</ul>
					</li>
					--%>	
					<li><a href="#">BLOG/FORUM</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/blogview/recent-personal-coach-blogs">BLOG</a></li>
							<li><a href="${pageContext.request.contextPath}/forums/list.page">DISCUSSION FORUM</a></li>
						</ul>
					</li>


				</ul>
				<!-- 
				<select id="responsive-menu">
					<option value="" selected="selected">Please choose page</option>
					<option value="index.html">Homepage</option>
						<option value="index-boxed.html">- Boxed version</option>
						<option value="index.html">- Unboxed version</option>
						<option value="post.html">- A post</option>
					<option value="blog-small.html">Blogs</option>
						<option value="blog-small.html">- Small thumbs</option>
						<option value="blog-large.html">- Large thumbs</option>
					<option value="portfolio.html">Portfolio</option>
					<option value="gallery.html">Gallery</option>
					<option value="stylings-text.html">Stylings</option>
						<option value="stylings-text.html">- Typography</option>
						<option value="stylings-table.html">- Table &amp; Columns</option>
						<option value="stylings-tabs.html">- Tabs, Toggles, Carousel</option>
						<option value="stylings-form.html">- Contact form &amp; Buttons</option>					
				</select>
				 -->
			</nav>
