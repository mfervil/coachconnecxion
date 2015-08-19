			<%-- MENU --%>
			<nav>
				<ul id="menu">   
					<li><a href="#">FIND A TUTOR</a>
						<ul>	
							<li style="text-decoration: underline;">ADVANCED SEARCHES</li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-general-personal-coaches" style="text-decoration: underline;">ALL COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-business-coaches">BUSINESS COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-career-coaches">CAREER COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-corporate-coaches">CORPORATE COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-family-coaches">FAMILY COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-finance-money-coaches">FINANCE / MONEY COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-fitness-coaches">FITNESS COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-nutrition-coaches">NUTRITION COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-life-coaches">LIFE COACHES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/landing-relationship-coaches">RELATIONSHIP COACHES</a></li>
						</ul>
					</li>

					<li><a href="#">STUDENTS</a>
						<ul>	
							<!-- <li><a href="${pageContext.request.contextPath}/tutor/public/coachSelection">FIND A COACH</a></li>  -->
							<li><a href="${pageContext.request.contextPath}/tutor/viewOrders">PURCHASES & MESSAGES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/viewOrders">COMMENTS & RATINGS</a></li>
							<!-- <li><a href="${pageContext.request.contextPath}/tutor/public/information?type=so">SEARCH OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/information?type=sf">FAQ</a></li>
							-->
						</ul>
					</li>
					<li><a href="#">TUTORS</a>
						<ul>	
							<%-- <li><a href="${pageContext.request.contextPath}/tutor/users/create?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">REGISTER AS A COACH</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/tutor/public/profile?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW / CREATE MY PROFILE</a></li>
							<%-- <li><a href="${pageContext.request.contextPath}/tutor/packageAdd?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">CREATE MY PACKAGE</a></li> --%>
							<li><a href="${pageContext.request.contextPath}/tutor/packages?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW / CREATE PACKAGES</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/viewRequests?cuin=<%= SecurityUtils.getCurrentUser() == null?0:SecurityUtils.getCurrentUser().getId()%>">VIEW REQUESTS</a></li>
							<!--  <li><a href="${pageContext.request.contextPath}/tutor/public/information?type=co">COACHING OVERVIEW</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/public/information?type=cf">FAQ</a></li>
							 -->
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/tutor/how-it-works">HOW IT WORKS</a></li>
					<%-- <li><a href="${pageContext.request.contextPath}/tutor/public/information?type=nw">NEWS</a></li> --%>
					
					<%-- 
					<li><a href="${pageContext.request.contextPath}/tutor/users/login">SIGN IN</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/tutor/users/create">REGISTER</a></li>
							<li><a href="${pageContext.request.contextPath}/tutor/users/login">SIGN IN</a></li>
						</ul>
					</li>
					--%>	
					<li><a href="#">BLOG/FORUM</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/tutor/blogview/recent-personal-coach-blogs">BLOG</a></li>
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
