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

@Controller
public class DashBoardController {
	RestTemplate rest = new RestTemplate();

	List<Distributor> distList = new ArrayList<>();
	
	List<Distributor> distArrList = new ArrayList<>();

	@RequestMapping(value = "/searchDist/{dist}", method = RequestMethod.GET)
	public ModelAndView showAddCatMethod(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String dist) {

		ModelAndView model = null;
		try {
			model = new ModelAndView("searchDist");

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("distMobOrName", dist);

			Distributor[] getDist = rest.postForObject(Constants.url + "/getDistributorByMobNoOrName",map,
					Distributor[].class);
			
			distList = new ArrayList<Distributor>(Arrays.asList(getDist));

			if (distList.size() > 0)
				model.addObject("dist", distList.get(0));
			
			/*Distributor[] getDistArray = rest.getForObject(Constants.url + "/getAllDistByIsUsed", Distributor[].class);
			distArrList = new ArrayList<Distributor>(Arrays.asList(getDistArray));

			model.addObject("distList", distArrList);
			*/

			Locale locale = LocaleContextHolder.getLocale();

			int langSelected = 0;

			if (locale.toString().equalsIgnoreCase("mr")) {
				langSelected = 1;
			}
			model.addObject("langSelected", langSelected);
		} catch (Exception e) {

			System.err.println("exception In getDistributorByMobNoOrName at Dashboard Contr" + e.getMessage());

			e.printStackTrace();

		}

		return model;

	}
	
	
	@RequestMapping(value = "/showOrderHistoryForDistId/{distId}/{distEngName}/{distMarName}", method = RequestMethod.GET)
	public ModelAndView showOrderHistory(HttpServletRequest request, HttpServletResponse response,
			@PathVariable int distId,

			@PathVariable String distEngName, @PathVariable String distMarName) {

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
			model.addObject("distId", distId);
			model.addObject("distEngName", distEngName);
			model.addObject("distMarName", distMarName);

			model.addObject("langSelected", langSelected);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

}
