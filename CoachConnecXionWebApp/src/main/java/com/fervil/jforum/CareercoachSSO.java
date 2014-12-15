package com.fervil.jforum;


import net.jforum.entities.UserSession;
import net.jforum.sso.SSO;

	public class CareercoachSSO implements SSO {

		public String authenticateUser(net.jforum.context.RequestContext request) {

				System.out.println("authenticateUser: Before getting the useer: " );
				String user = request.getRemoteUser();
				System.out.println("authenticateUser: After getting the user: " + user);
				return user;
			}

			public boolean isSessionValid(UserSession userSession, net.jforum.context.RequestContext request) {
				
				if(request.getRemoteUser() != null)
				{
					System.out.println("isSessionValid: After getting the user: " + request.getRemoteUser());

					return true;
				}else{
					return false;
				}

			}
}
