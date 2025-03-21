package com.fervil.spring.careercoach.util.tags;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Decoding  extends TagSupport {
/*
	public static String urlEncode(String value, String charset) throws UnsupportedEncodingException {
	    return URLEncoder.encode(value, charset);
	}	
*/	
	// Testing
 
//public class SubstrTagHandler {
    private String urlinput;
    private String charset;
    private int start;
    private int end;
     
    @Override
    public int doStartTag() throws JspException {
         
        try {
            //Get the writer object for output.
            JspWriter out = pageContext.getOut();
 
            //Perform substr operation on string.
            //out.println(input.substring(start, end));
 
        	urlinput = URLEncoder.encode(urlinput, charset);
        	
            out.println(urlinput);
        	
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
    
    public String getUrlvalue() {

    	return urlinput;
    }
    public void setUrlvalue(String urlinput) {
        this.urlinput = urlinput;
    }
    
    public String getCharset() {
        return charset;
    }
    public void setCharset(String charset) {
        this.charset = charset;
    }
}
	

