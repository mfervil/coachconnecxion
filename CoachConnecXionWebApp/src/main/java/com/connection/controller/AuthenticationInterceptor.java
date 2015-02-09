package com.connection.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.connection.model.Customer;


@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter
{
 @Override
 public boolean preHandle(HttpServletRequest request,
   HttpServletResponse response, Object handler) throws Exception
 {
 String uri = request.getRequestURI();
  /*System.out.println("URI ------------  "+uri);*/
  if(!uri.endsWith("/sdnext/wrlogin.html") && !uri.endsWith("wrloginPage.html") 
		  && !uri.endsWith("wrlogout.html") && !uri.endsWith("wraddCustomer.html") 
		  &&!uri.endsWith("wrsaveCustomer.html") &&!uri.endsWith("/wrforgotPasswordPage.html")
		  &&!uri.endsWith("/wrforgotPassword.html"))
  {
   Customer userData = (Customer) request.getSession().getAttribute("Customer");
   if(userData == null)
   {
    response.sendRedirect("workroom/wrloginPage.html");
    return false;
   }   
  } 
  return true;
 }
}