							<c:choose>
									<c:when test="${averageRate1>4.75}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>			
									<c:when  test="${averageRate1>4.25 && averageRate1<=4.75}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" style="border: none;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>
									<c:when test="${averageRate1>3.75 && averageRate1<=4.25}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>			
									<c:when test="${averageRate1>3.25 && averageRate1<=3.75}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>
									<c:when  test="${averageRate1>2.75 && averageRate1<=3.25}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when> 
									<c:when  test="${averageRate1>2.25 && averageRate1<=2.75}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
										</c:when> 
									<c:when test="${averageRate1>1.75 && averageRate1<=2.25}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/starrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
										</c:when> 

									<c:when  test="${averageRate1>1.25 && averageRate1<=1.75}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when> 
										
									<c:when test="${averageRate1>0.75 && averageRate1<=1.25}"> 
											<img src="${pageContext.request.contextPath}/images/starrating.png" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>
										
									<c:when test="${averageRate1>0.25 && averageRate1<=0.75}"> 
											<img src="${pageContext.request.contextPath}/images/halfstartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:when>
									<c:otherwise > 
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
											<img src="${pageContext.request.contextPath}/images/nostartrating.png"
												style="border: none; margin-left: -5px;" />
									</c:otherwise>
									
								</c:choose>
									