package com.ats.hub;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.model.HubUser;




@Controller
public class WelcomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView landingPage(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("login");
		try {

		
			HttpSession session = request.getSession();
			HubUser userObj = null;
			try {

				userObj = (HubUser) session.getAttribute("user");
				
				if (userObj != null) {

					model = new ModelAndView("home");
					
				} 



			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();


			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	

	
	
	@RequestMapping(value = "/getLogin", method = RequestMethod.GET)
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("templates/sampleForm");
		try {

			String str = request.getParameter("txtMarathi");
			
			System.err.println("text in marathi with utf-8 encoding " +str);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	
	@RequestMapping(value = "/marathi", method = RequestMethod.GET)
	public ModelAndView grid(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("templates/datepicker");
		try {

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/translate", method = RequestMethod.GET)
	public ModelAndView translate(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("home");

		String str = request.getParameter("txtMarathi");

		System.err.println(" String with unicode  " + str);
		
	
		return model;

	}
}
