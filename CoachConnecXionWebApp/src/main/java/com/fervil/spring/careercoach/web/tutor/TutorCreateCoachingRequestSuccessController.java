package com.fervil.spring.careercoach.web.tutor;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fervil.spring.careercoach.util.Constants;

@Controller
@RequestMapping("/tutor/createuserprofilesuccess/coachingRequestId/{coachingRequestId}")
public class TutorCreateCoachingRequestSuccessController {
    private static final Logger log = LoggerFactory.getLogger(TutorCreateCoachingRequestSuccessController.class);
	
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView createBillPaySuccess(@PathVariable("coachingRequestId") String coachingRequestId, Model model) {
        Map<String, Object> myModel = new HashMap<String, Object>();

	    try{	
	    	myModel.put("coachingRequestId", coachingRequestId);
	    	return new ModelAndView("tutor/createCoachingRequestSuccess", "model", myModel);
	    	
		} catch (Exception e) {
	        String msg = "The request failed. Error " + e;
	        log.error(msg, e);
	        model.addAttribute(Constants.ERROR_MSG_KEY, Constants.ERROR_MSG);
	        return new ModelAndView("tutor/public/common/error/errorpage");
			
		}	
    }
}
