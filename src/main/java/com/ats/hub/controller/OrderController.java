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
import com.ats.hub.model.EditOrder;
import com.ats.hub.model.ErrorMessage;
import com.ats.hub.model.GetOrder;
import com.ats.hub.model.GetOrderHub;
import com.ats.hub.model.HubUser;
import com.ats.hub.model.Order;
import com.ats.hub.model.OrderDetail;

@Controller
public class OrderController {

	RestTemplate rest = new RestTemplate();
	List<Distributor> distList = new ArrayList<>();
	List<GetOrder> orderList = new ArrayList<>();
	List<GetOrderHub> orderHubList = new ArrayList<>();
	GetOrderHub res = new GetOrderHub();

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
			Date now = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}

			GetOrderHub[] getOrder = rest.getForObject(Constants.url + "/getOrderByTypeAndStatus", GetOrderHub[].class);
			orderHubList = new ArrayList<GetOrderHub>(Arrays.asList(getOrder));
			model.addObject("orderList", orderHubList);
			model.addObject("orderDate", sdf.format(now));

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

			Date now = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

			Locale locale = LocaleContextHolder.getLocale();

			System.err.println("current language is - " + locale.toString());

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			map.add("orderHeaderId", orderHeaderId);

			System.out.println("orderDate" + sdf.format(now));

			res = rest.postForObject(Constants.url + "/getOrderByOrderHeaderId", map, GetOrderHub.class);

			model.addObject("orderHeader", res);
			model.addObject("orderDetail", res.getGetOrderDetailList());
			model.addObject("orderDate", sdf.format(now));

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/editOrder", method = RequestMethod.POST)
	public String insertHubUser(HttpServletRequest request, HttpServletResponse response) {

		try {

			List<EditOrder> editOrderDetailList = new ArrayList<EditOrder>();
			for (int i = 0; i < res.getGetOrderDetailList().size(); i++) {
				int hubQty = Integer.parseInt(
						request.getParameter("hubQty" + res.getGetOrderDetailList().get(i).getOrderDetailId()));

				float itemTotal = Float.parseFloat(
						request.getParameter("itemTotal" + res.getGetOrderDetailList().get(i).getOrderDetailId()));
				System.out.println("hubQty" + hubQty);
				System.out.println("itemTotal" + itemTotal);

				if (hubQty != res.getGetOrderDetailList().get(i).getOrderQty()) {
					EditOrder editOrder = new EditOrder();

					editOrder.setHubQty(hubQty);
					editOrder.setOrderQty(res.getGetOrderDetailList().get(i).getOrderQty());
					editOrder.setMsQty(hubQty);
					editOrder.setItemTotal(itemTotal);
					editOrder.setOrderDetailId(res.getGetOrderDetailList().get(i).getOrderDetailId());
					editOrder.setOrderHeaderId(res.getOrderHeaderId());
					editOrderDetailList.add(editOrder);

				}

			}
			ErrorMessage res = rest.postForObject(Constants.url + "/updateOrderByHubQty", editOrderDetailList,
					ErrorMessage.class);
			System.out.println("res" + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/showTodaysOrder";
	}

}
