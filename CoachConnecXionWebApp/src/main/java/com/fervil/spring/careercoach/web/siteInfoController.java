package com.fervil.spring.careercoach.web;

import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.fervil.spring.careercoach.util.Constants;

@Controller		  
public class siteInfoController {
    private static final Logger log = LoggerFactory.getLogger(siteInfoController.class);
	
/*    
	@RequestMapping(value = "/public/information", method = RequestMethod.GET)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	
	        String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
	        String navPage = "public/common/error/errorpage";
	        
	    	if (request.getParameter("type") != null) {
	    		if (((String)request.getParameter("type")).equalsIgnoreCase("so") ){
	    			navPage = "public/common/systeminfo/SearchCoachesOverview";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("sf") ){
	    			navPage = "public/common/systeminfo/FAQ_FindACoach";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("co") ){
	    			navPage = "public/common/systeminfo/coachesInfoOverview";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("cf") ){
	    			navPage = "public/common/systeminfo/FAQ_Coaches";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("hw") ){
	    			navPage = "public/common/systeminfo/howitworks";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("au") ){
	    			navPage = "public/common/systeminfo/aboutus";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("cu") ){
	    			navPage = "public/common/systeminfo/contactus";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("pp") ){
	    			navPage = "public/common/legal/privacypolicy";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("tu") ){
	    			navPage = "public/common/legal/termsofuse";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("ps") ){
	    			navPage = "public/common/legal/personalsafety";
	    		} else if (((String)request.getParameter("type")).equalsIgnoreCase("nw") ){
	    			String newsLinks = GetLinks("http://query.nytimes.com/search/sitesearch/#/personal+coach/");
	    			model.addAttribute("news", newsLinks);
	    			navPage = "public/common/systeminfo/coachnews";
	    		} 
	    	}
	        return new ModelAndView(navPage, "model", myModel);
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
    }
*/
    
@RequestMapping(value = "/how-it-works", method = RequestMethod.GET)
public ModelAndView getHowItWorks(HttpServletRequest request, HttpServletResponse response, Model model) {
        //throws ServletException, IOException {

	Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		String now = (new java.util.Date()).toString();
        myModel.put("now", now);
		String navPage = "public/common/systeminfo/howitworks";
        
        return new ModelAndView(navPage, "model", myModel);

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return new ModelAndView("public/common/error/errorpage", "model", myModel);
	}	
}	


	@RequestMapping(value = "/about-us", method = RequestMethod.GET)
    public ModelAndView getAboutUs(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	

    		String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
			String navPage = "public/common/systeminfo/aboutus";
	        
	        return new ModelAndView(navPage, "model", myModel);

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}	
	
	@RequestMapping(value = "/contact-us", method = RequestMethod.GET)
    public ModelAndView getContactUs(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	

    		String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
			String navPage = "public/common/systeminfo/contactus";
	        
	        return new ModelAndView(navPage, "model", myModel);

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}	
	
	@RequestMapping(value = "/terms-of-use", method = RequestMethod.GET)
    public ModelAndView getTermsOfUse(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	

    		String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
			String navPage = "public/common/legal/termsofuse";
	        
	        return new ModelAndView(navPage, "model", myModel);

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}	
	
	
	
	@RequestMapping(value = "/privacy-policy", method = RequestMethod.GET)
    public ModelAndView getPrivacyPolicy(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	

    		String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
			String navPage = "public/common/legal/privacypolicy";
	        
	        return new ModelAndView(navPage, "model", myModel);

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}	
	
	@RequestMapping(value = "/safety-tips", method = RequestMethod.GET)
    public ModelAndView getSafetyTips(HttpServletRequest request, HttpServletResponse response, Model model) {
            //throws ServletException, IOException {

    	Map<String, Object> myModel = new HashMap<String, Object>();
    	try{	

    		String now = (new java.util.Date()).toString();
	        myModel.put("now", now);
			String navPage = "public/common/legal/personalsafety";
	        
	        return new ModelAndView(navPage, "model", myModel);

		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
			model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("public/common/error/errorpage", "model", myModel);
		}	
	}	
	
	public String GetLinks(String URLstring) throws Exception {
		/*Written by Marc Arthur
		*  Returns links (HTML)
		*  Can be parsed directly into jsp page.*/
		//try{
		String Links="";
		String Code="";
		URL url = new URL(URLstring); 
		URLConnection connection = url.openConnection(); 
		connection.connect(); 
		Scanner in = new Scanner(connection.getInputStream()); 
		while(in.hasNextLine())Code+=in.nextLine();
		Code=Code.replace(">", "<");	
		String[] tags=Code.split("<");	
		int count=0;
		for(String i:tags){
			count++;
			String[] b = i.split("\"|'");
			for(String j:b){
				
				//if( !(j.contains("'"))&&(!j.contains("\"")) && j.contains("http:") && (j.endsWith(".com")||j.endsWith(".net")||j.endsWith(".co.uk")||j.endsWith(".org") ||j.endsWith(".html")  ||j.contains(".html?") ||j.contains(".com/20")) ){
				if( (j.endsWith(".com")||j.endsWith(".net")||j.endsWith(".co.uk")||j.endsWith(".org") ||j.endsWith(".html")  ||j.contains(".html?") ||j.contains(".com/20")) ){
				//the variable 'j' is the actual link URL.
				//tags[count] is the links name
				Links+="<a href=\""+j+"\">"+tags[count]+"</a><br><br>";
				}
			}
		}	
		return Links;
		//}catch(Exception e){
		//	throw Exception e;
		//}
	}
	
}
