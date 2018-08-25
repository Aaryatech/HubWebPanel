package com.ats.hub.controller;

import java.util.ArrayList;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.commons.Constants;
import com.ats.hub.model.Distributor;
import com.ats.hub.model.ErrorMessage;
import com.ats.hub.model.HubUser;
import com.ats.hub.model.Notification;
import com.ats.hub.model.Route;

@Controller
public class MasterController {

	RestTemplate rest = new RestTemplate();
	List<HubUser> hubUserList = new ArrayList<>();
	List<Distributor> distList = new ArrayList<>();
	List<Route> routeList = new ArrayList<>();
	List<Notification> notiList = new ArrayList<>();

	@RequestMapping(value = "/showHubUser", method = RequestMethod.GET)
	public ModelAndView showHubUser(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/hub");
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertHubUser", method = RequestMethod.POST)
	public String insertHubUser(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addEmployee");
		try {

			String hsId = request.getParameter("hsId");

			String nameEng = request.getParameter("txtEnglish");
			String nameMar = request.getParameter("txtMarathi");
			String contactNo = request.getParameter("contactNo");
			String pwd = request.getParameter("password");
			int userType = Integer.parseInt(request.getParameter("userType"));

			HubUser hubUser = new HubUser();

			if (hsId == "" || hsId == null)
				hubUser.setHsId(0);
			else
				hubUser.setHsId(Integer.parseInt(hsId));
			hubUser.setHsContactNo(contactNo);
			hubUser.setHsEngName(nameEng);
			hubUser.setHsMarName(nameMar);
			hubUser.setIsBlock(0);
			hubUser.setIsUsed(1);
			hubUser.setIsAdmin(userType);
			hubUser.setHubId(1);

			hubUser.setHsPwd(pwd);

			System.out.println("hubUser" + hubUser);

			HubUser res = rest.postForObject(Constants.url + "/saveHubUser", hubUser, HubUser.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showHubUserList";
	}

	@RequestMapping(value = "/showHubUserList", method = RequestMethod.GET)
	public ModelAndView showHubUserList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/hubUserList");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			int userType = 1;
			String user = "0";

			if (userType == 0) {
				user = "0";
			} else {
				user = "0,1";
			}

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("userType", user);

			HubUser[] getHubUser = rest.postForObject(Constants.url + "/getHubUserByUserType", map, HubUser[].class);
			hubUserList = new ArrayList<HubUser>(Arrays.asList(getHubUser));

			model.addObject("hubUserList", hubUserList);
			model.addObject("langSelected", langSelected);

			System.out.println("HubUserList" + hubUserList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editHubUser/{hsId}", method = RequestMethod.GET)
	public ModelAndView editHubUser(@PathVariable int hsId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/editHub");
		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("hsId", hsId);

			HubUser res = rest.postForObject(Constants.url + "/getHubUserByHsId", map, HubUser.class);
			model.addObject("editHs", res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteHubUser/{hsId}", method = RequestMethod.GET)
	public String deleteHubUser(@PathVariable int hsId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("hsId", hsId);

			ErrorMessage res = rest.postForObject(Constants.url + "/deleteHubUser", map, ErrorMessage.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showHubUserList";
	}

	// --------------Distributor--------------------------

	@RequestMapping(value = "/showDistributor", method = RequestMethod.GET)
	public ModelAndView showDistributor(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/addDist");
		try {

			Route[] getRoute = rest.getForObject(Constants.url + "/getAllRouteByIsUsed", Route[].class);
			routeList = new ArrayList<Route>(Arrays.asList(getRoute));
			model.addObject("routeList", routeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertDistributor", method = RequestMethod.POST)
	public String insertDistributor(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addEmployee");
		try {

			String distId = request.getParameter("distId");

			String distEngName = request.getParameter("txtEnglish");
			String distMarName = request.getParameter("txtMarathi");
			String distAddEng = request.getParameter("addEnglish");
			String distAddMar = request.getParameter("addMarathi");
			String contactNo = request.getParameter("contactNo");
			String pwd = request.getParameter("password");

			String routeSeqNo = request.getParameter("routeSeqNo");
			String distCratesPending = request.getParameter("distCratesPending");
			String distAmtPending = request.getParameter("distAmtPending");
			String distCratesLimit = request.getParameter("distCratesLimit");
			String distAmtLimit = request.getParameter("distAmtLimit");
			String distLocation = request.getParameter("distLocation");
			String routeId = request.getParameter("routeId");

			Distributor dist = new Distributor();

			if (distId == "" || distId == null)
				dist.setDistId(0);
			else
				dist.setDistId(Integer.parseInt(distId));
			dist.setDistContactNo(contactNo);
			dist.setDistEngName(distEngName);
			dist.setDistMarName(distMarName);
			dist.setDistAddEng(distAddEng);
			dist.setDistAddMar(distAddMar);
			dist.setDistPwd(pwd);
			dist.setRouteDistSeqNo(routeSeqNo);
			dist.setDistCratesPending(Integer.parseInt(distCratesPending));
			dist.setDistAmtPending(Float.parseFloat(distAmtPending));
			dist.setDistCratesLimit(Integer.parseInt(distCratesLimit));
			dist.setDistAmtLimit(Float.parseFloat(distAmtLimit));
			dist.setDistLocation(distLocation);
			dist.setRouteId(Integer.parseInt(routeId));
			dist.setIsBlock(0);
			dist.setIsUsed(1);

			dist.setHubId(1);
			dist.setToken("");

			System.out.println("dist" + dist);

			Distributor res = rest.postForObject(Constants.url + "/saveDist", dist, Distributor.class);

			System.out.println("res " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showDistList";
	}

	@RequestMapping(value = "/showDistList", method = RequestMethod.GET)
	public ModelAndView showDistList(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/distList");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			int userType = 1;
			String user = "0";

			if (userType == 0) {
				user = "0";
			} else {
				user = "0,1";
			}

			Distributor[] getDist = rest.getForObject(Constants.url + "/getAllDistByIsUsed", Distributor[].class);
			distList = new ArrayList<Distributor>(Arrays.asList(getDist));

			model.addObject("distList", distList);
			model.addObject("langSelected", langSelected);

			System.out.println("distList" + distList.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editDist/{distId}", method = RequestMethod.GET)
	public ModelAndView editDist(@PathVariable int distId, HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/editDist");
		try {

			Route[] getRoute = rest.getForObject(Constants.url + "/getAllRouteByIsUsed", Route[].class);
			routeList = new ArrayList<Route>(Arrays.asList(getRoute));
			model.addObject("routeList", routeList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("distId", distId);

			Distributor res = rest.postForObject(Constants.url + "/getDistributorByDistId", map, Distributor.class);
			model.addObject("editDist", res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/deleteDist/{distId}", method = RequestMethod.GET)
	public String deleteDist(@PathVariable int distId, HttpServletRequest request, HttpServletResponse response) {

		try {

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("distId", distId);

			ErrorMessage res = rest.postForObject(Constants.url + "/deleteDistributor", map, ErrorMessage.class);
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showDistList";
	}

	@RequestMapping(value = "/showHubNotification", method = RequestMethod.GET)
	public ModelAndView showHubNotification(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/hubNotification");
		try {
			int notifiTo = 1;
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("notifiTo", notifiTo);
			Notification[] getRoute = rest.postForObject(Constants.url + "/getNotiForHubByHubId", map,
					Notification[].class);
			notiList = new ArrayList<Notification>(Arrays.asList(getRoute));
			model.addObject("notiList", notiList);
			System.out.println("NotiList" + notiList.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
