package com.ats.hub.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.commons.Constants;
import com.ats.hub.model.LoginResHubUser;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside Login Process");

		ModelAndView model = null;

		String mobNo = request.getParameter("username");

		String pass = request.getParameter("password");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		map.add("hsContactNo", mobNo);
		map.add("hsPwd", pass);

		LoginResHubUser logResHub = rest.postForObject(Constants.url + "/loginResponseHubUser", map,
				LoginResHubUser.class);
		if (logResHub.isError() == false) {

			model = new ModelAndView("home");

			HttpSession session = request.getSession();
			
			
			session.setAttribute("user", logResHub);
			System.err.println("logResHubUser " + logResHub.toString());

			return "redirect:/home";

		} else {
			model = new ModelAndView("login");
			model.addObject("loginErr", "Login Failed");
			
			System.err.println("logResMU" + logResHub.toString());

			return "redirect:/invalidLogin";

		}

		

	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("home");
		try {

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/invalidLogin", method = RequestMethod.GET)
	public ModelAndView invalidLogin(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView("login");
		try {

			model.addObject("errorMessage", "Invalid Login Details");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("User Logout");

		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/sessionTimeOut", method = RequestMethod.GET)
	public ModelAndView displayLoginAgain(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("index");

		logger.info("/sessionTimeOut request mapping.");

		model.addObject("loginResponseMessage", "Session timeout ! Please login again . . .");

		return model;

	}

}
