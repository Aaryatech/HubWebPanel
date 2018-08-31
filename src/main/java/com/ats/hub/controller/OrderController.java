package com.ats.hub.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
import com.ats.hub.model.GetOrder;
import com.ats.hub.model.HubUser;

@Controller
public class OrderController {

	RestTemplate rest = new RestTemplate();
	List<Distributor> distList = new ArrayList<>();
	List<GetOrder> orderList = new ArrayList<>();

	@RequestMapping(value = "/showOrderHistory", method = RequestMethod.GET)
	public ModelAndView showOrderHistory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("order/orderHistory");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			Distributor[] getHubUser = rest.getForObject(Constants.url + "/getAllDistByIsUsed", Distributor[].class);
			distList = new ArrayList<Distributor>(Arrays.asList(getHubUser));
			model.addObject("distList", distList);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/showTodaysOrder", method = RequestMethod.GET)
	public ModelAndView showTodaysOrder(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("order/todaysOrder");
		try {

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			GetOrder[] getOrder = rest.getForObject(Constants.url + "/getOrderByTypeAndStatus", GetOrder[].class);
			orderList = new ArrayList<GetOrder>(Arrays.asList(getOrder));
			model.addObject("orderList", orderList);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/showTodayOrder/{orderHeaderId}", method = RequestMethod.GET)
	public ModelAndView showTodayOrder(@PathVariable int orderHeaderId, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("order/todayOrder");
		try {

			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("orderHeaderId", orderHeaderId);

			GetOrder res = rest.postForObject(Constants.url + "/getOrderByOrderHeaderId", map, GetOrder.class);

			model.addObject("orderHeader", res);
			model.addObject("orderDetail", res.getGetOrderDetailList());

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
