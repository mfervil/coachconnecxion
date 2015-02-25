package com.fervil.jforum;


import net.jforum.entities.UserSession;
import net.jforum.sso.SSO;

	public class CareercoachSSO implements SSO {   

		public String authenticateUser(net.jforum.context.RequestContext request) {

				String user = request.getRemoteUser();
				return user;
			}

			public boolean isSessionValid(UserSession userSession, net.jforum.context.RequestContext request) {
				
				if(request.getRemoteUser() != null)
				{
					return true;
				}else{
					return false;
				}
			}
}
