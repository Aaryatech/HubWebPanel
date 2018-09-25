package com.ats.hub.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.commons.Constants;
import com.ats.hub.model.GetOrderHub;
import com.ats.hub.model.HubUser;
import com.ats.hub.model.LoginResHubUser;
import com.ats.hub.model.dashreport.DashboardData;
import com.ats.hub.model.report.CategoryDistReport;

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

			session.setAttribute("user", logResHub.getHubUser());
			session.setAttribute("hubId", logResHub.getHubUser().getHubId());
			
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
			
			
			HttpSession session = request.getSession();

			int hubId =	(Integer) session.getAttribute("hubId");
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(now.getTime());

			map.add("curDate", date);

			map.add("orderType", 0);
			map.add("hubId", hubId); // to be set by geeting hub id from session

			DashboardData dashBoard = rest.postForObject(Constants.url + "/getHubDashBoard", map,
					DashboardData.class);

			System.err.println("HubDashboardData " + dashBoard.toString());
			model.addObject("dashBoard", dashBoard);
			model.addObject("noOrderDistCount", dashBoard.getNoOrderDistList().size());

			List<CategoryDistReport> catwiseHubOrdQtyList = new ArrayList<CategoryDistReport>();

			map.add("curDate", date);
			map.add("hubId", hubId);

			/*
			 * CategoryDistReport[] catwiseHubOrdQty = rest.postForObject(Constants.url +
			 * "/getHubReportCatwise", map, CategoryDistReport[].class);
			 * catwiseHubOrdQtyList = new
			 * ArrayList<CategoryDistReport>(Arrays.asList(catwiseHubOrdQty));
			 * 
			 * 
			 * System.err.println("catwiseHubOrdQty " +catwiseHubOrdQtyList.toString());
			 * 
			 * model.addObject("catwiseHubOrdQty",catwiseHubOrdQtyList);
			 */
			
			
			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			
			model.addObject("langSelected", langSelected);


		} catch (Exception e) {

			System.err.println("Exce ing etHubDashBoard  " + e.getMessage());
			e.printStackTrace();

		}

		return model;
	}

	// getCatOrdQty

	@RequestMapping(value = "/getCatOrdQty", method = RequestMethod.GET)
	@ResponseBody public List<CategoryDistReport> getcatData(HttpServletRequest request, HttpServletResponse response) {
		
		List<CategoryDistReport> catwiseHubOrdQtyList = new ArrayList<CategoryDistReport>();

		System.err.println("In Ajax call /getCatOrdQty ");
		try {
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		
		HttpSession session = request.getSession();

		int hubId =	(Integer) session.getAttribute("hubId");
		
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(now.getTime());

		map.add("curDate", date);

		map.add("hubId", hubId); // to be set by geeting hub id from session

		CategoryDistReport[] catwiseHubOrdQty = rest.postForObject(Constants.url + "/getHubReportCatwise", map,
				CategoryDistReport[].class);
		catwiseHubOrdQtyList = new ArrayList<CategoryDistReport>(Arrays.asList(catwiseHubOrdQty));

		System.err.println("catwiseHubOrdQty   in Ajax" + catwiseHubOrdQtyList.toString());
		}catch (Exception e) {
			
			System.err.println("catwiseHubOrdQty   in Ajax" + e.getMessage());
			e.printStackTrace();
			
		}
		return catwiseHubOrdQtyList;

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
