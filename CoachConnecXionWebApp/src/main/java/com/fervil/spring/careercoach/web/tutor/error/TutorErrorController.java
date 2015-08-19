package com.fervil.spring.careercoach.web.tutor.error;

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
public class TutorErrorController {
    private static final Logger log = LoggerFactory.getLogger(TutorErrorController.class);
	
@RequestMapping(value = "/tutor/error404", method = RequestMethod.GET)
public ModelAndView getHowItWorks(HttpServletRequest request, HttpServletResponse response, Model model) {

	Map<String, Object> myModel = new HashMap<String, Object>();
	try{	

		String now = (new java.util.Date()).toString();
        myModel.put("now", now);
		String navPage = "tutor/public/common/error/error404";

		//String navPage = "public/common/systeminfo/aboutus";
        
        return new ModelAndView(navPage, "model", myModel);

	} catch (Exception e) {
        String msg = "The request failed. Error " + e;
        log.error(msg, e);
		model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
        return new ModelAndView("tutor/public/common/error/errorpage", "model", myModel);
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
