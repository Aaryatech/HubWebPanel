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
import com.ats.hub.model.GetNotification;
import com.ats.hub.model.GetNotificationRoute;
import com.ats.hub.model.HubUser;
import com.ats.hub.model.LoginResHubUser;
import com.ats.hub.model.Notification;
import com.ats.hub.model.Route;

@Controller
public class MasterController {

	RestTemplate rest = new RestTemplate();
	List<HubUser> hubUserList = new ArrayList<>();
	List<Distributor> distList = new ArrayList<>();
	List<Route> routeList = new ArrayList<>();
	List<Notification> notiList = new ArrayList<>();

	@RequestMapping(value = "/showErrMsg", method = RequestMethod.GET)
	public ModelAndView showErrMsgMethod(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = null;
		try {

			Locale locale = LocaleContextHolder.getLocale();

			// System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			model = new ModelAndView("common/errorMsg");
			model.addObject("langSelected", langSelected);

		} catch (Exception e) {

			System.err.println("Exception in showing Error Message Page " + e.getMessage());
			e.printStackTrace();
		}

		return model;

	}

	@RequestMapping(value = "/showHubUser", method = RequestMethod.GET)
	public ModelAndView showHubUser(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/hub");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertHubUser", method = RequestMethod.POST)
	public String insertHubUser(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addEmployee");
		String returnString = null;
		try {

			HttpSession session = request.getSession();
			LoginResHubUser login = (LoginResHubUser) session.getAttribute("user");

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
			hubUser.setHubId(login.getHubUser().getHubId());

			hubUser.setHsPwd(pwd);

			System.out.println("hubUser" + hubUser);

			ErrorMessage hubUserInserRes = rest.postForObject(Constants.url + "/saveHubUserExisting", hubUser,
					ErrorMessage.class);

			if (hubUserInserRes.getMessage().equalsIgnoreCase("Mobile No Already Exist")
					|| hubUserInserRes.isError() == true) {

				returnString = "showErrMsg";

			} else if (hubUserInserRes.isError() == false) {

				returnString = "showHubUserList";
			}

			System.out.println("hubUserInserRes " + hubUserInserRes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/" + returnString;
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
			HttpSession session = request.getSession();
			LoginResHubUser login = (LoginResHubUser) session.getAttribute("user");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("hsId", login.getHubUser().getHsId());

			HubUser res = rest.postForObject(Constants.url + "/getHubUserByHsId", map, HubUser.class);
			model.addObject("editHs", res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editHubUserByHsId/{hsId}", method = RequestMethod.GET)
	public ModelAndView editHubUserByHsId(@PathVariable int hsId, HttpServletRequest request,
			HttpServletResponse response) {

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

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			model.addObject("langSelected", langSelected);

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
		String returnString = null;
		try {

			HttpSession session = request.getSession();
			LoginResHubUser login = (LoginResHubUser) session.getAttribute("user");
			login.getHubUser().getHubId();

			System.out.println("HubUserId" + login.getHubUser().getHubId());

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

			System.out.println("routeId" + routeId);

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

			dist.setHubId(login.getHubUser().getHubId());
			dist.setToken("");

			System.out.println("dist" + dist);

			ErrorMessage distInsertRes = rest.postForObject(Constants.url + "/saveDistributorExisting", dist,
					ErrorMessage.class);

			if (distInsertRes.getMessage().equalsIgnoreCase("Mobile No Already Exist")
					|| distInsertRes.isError() == true) {

				returnString = "showErrMsg";

			} else if (distInsertRes.isError() == false) {

				returnString = "showDistList";
			}

			System.out.println("res " + distInsertRes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/" + returnString;
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

	@RequestMapping(value = "/sendNotification", method = RequestMethod.GET)
	public ModelAndView sendNotification(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("masters/sendNotification");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			Distributor[] getDist = rest.getForObject(Constants.url + "/getAllDistByIsUsed", Distributor[].class);
			distList = new ArrayList<Distributor>(Arrays.asList(getDist));

			model.addObject("distList", distList);
			model.addObject("langSelected", langSelected);

			Route[] getRoute = rest.getForObject(Constants.url + "/getAllRouteByIsUsed", Route[].class);
			routeList = new ArrayList<Route>(Arrays.asList(getRoute));
			model.addObject("routeList", routeList);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/insertNotification", method = RequestMethod.POST)
	public String insertNotification(HttpServletRequest request, HttpServletResponse response) {

		// ModelAndView model = new ModelAndView("masters/addEmployee");
		try {
			HttpSession session = request.getSession();
			LoginResHubUser login = (LoginResHubUser) session.getAttribute("user");

			String notfText = null;
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String currDate = sdf.format(now.getTime());

			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String datetime = sdf1.format(now.getTime());

			try {

				System.err.println("notifi text marathi " + request.getParameter("notf_mr"));
				System.err.println("notifi text english " + request.getParameter("notf_eng"));

				String langSelected = request.getParameter("lang");
				System.err.println("lang selected " + langSelected);

				if (langSelected.equals("0")) {

					notfText = request.getParameter("notf_eng");
				} else {
					notfText = request.getParameter("notf_mr");

				}

			} catch (Exception e) {
				notfText = request.getParameter("notf_eng");
				System.err.println("from catch eng " + notfText);
			}

			String routeId = request.getParameter("routeId");

			String[] distIdList = request.getParameterValues("distIdList");
			ArrayList<String> newList = new ArrayList<>();
			if (distIdList != null) {
				newList = new ArrayList<>(Arrays.asList(distIdList));
			}

			List<Integer> selectedDistIds = new ArrayList<>(newList.size());
			for (String i : newList) {
				selectedDistIds.add(Integer.valueOf(i));

			}

			Notification notifi = new Notification();
			notifi.setIsRead(0);
			notifi.setNotifiDate(currDate);
			notifi.setNotifiDatetime(datetime);
			notifi.setNotifiFrom(login.getHubUser().getHsId());
			notifi.setNotifiText(notfText);
			notifi.setNotifiType(2);
			notifi.setNotifiTo(0);
			notifi.setNotifiId(0);
			if (routeId != null && distIdList == null) {
				GetNotificationRoute notiRoute = new GetNotificationRoute();
				notiRoute.setNotification(notifi);
				notiRoute.setRouteId(Integer.parseInt(routeId));
				GetNotificationRoute res = rest.postForObject(Constants.url + "/saveNotificationByRouteId", notiRoute,
						GetNotificationRoute.class);

			} else {

				GetNotification noti = new GetNotification();
				noti.setNotification(notifi);

				noti.setDistIdList(selectedDistIds);

				GetNotification res = rest.postForObject(Constants.url + "/saveNotiByDistIdList", noti,
						GetNotification.class);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showHubNotification";
	}

}
