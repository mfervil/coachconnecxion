
	<%@ include file="/WEB-INF/views/common/header_setup.jsp" %>	
	
	<div id="topline"></div>		
	<div id="wrapper">			
		<%@ include file="/WEB-INF/views/common/header_navigation_menu.jsp" %>	

		<div class="separator"></div>
		
		
		<!-- ELASTIC SLIDER -->
		<section>		
			<div id="ei-slider" class="ei-slider">
				<ul class="ei-slider-large">
                     <li>
						<img src="${pageContext.request.contextPath}/images/slide-1.jpg" alt="image01"/>
						<div class="ei-title">
							<h2>MOBILE & TABLET FRIENDLY</h2>
							<h3>RESPONSIVE DESIGN</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/slide-2.jpg" alt="image02"/>
						<div class="ei-title">
							<h2>DELICIOUS PRESENTATION</h2>
							<h3>FOR YOUR BUSINESS</h3>
						</div>
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/slide-3.jpg" alt="image03"/>
						<div class="ei-title">
							<h2>SETTING UP YOUR SITE IS</h2>
							<h3>LIKE A WALK ON THE BEACH</h3>
						</div>						
					</li>
					<li>
						<img src="${pageContext.request.contextPath}/images/slide-4.jpg" alt="image04"/>
						<div class="ei-title black_bg">
							<h2>PROMOTE YOUR SERVICES</h2>
							<h3>WITH FANCY IMAGES</h3>
						</div>						
					</li>									
				</ul>
								
				<ul class="ei-slider-thumbs">
					<li class="ei-slider-element">Current</li>
					<li><a href="#">Slide 1</a></li>
					<li><a href="#">Slide 2</a></li>
					<li><a href="#">Slide 3</a></li>
					<li><a href="#">Slide 4</a></li>
                </ul>												
			</div>		
		</section>
		
	</div><!-- #wrapper -->		
	
	<div id="wrapper_bottom"></div><!-- BOTTOM SHADOW ON PAGE -->
	
	<%@ include file="/WEB-INF/views/common/footer_only.jsp" %>	
	
</body>
</html>