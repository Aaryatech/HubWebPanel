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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.commons.Constants;
import com.ats.hub.commons.DateConvertor;
import com.ats.hub.model.Distributor;
import com.ats.hub.model.report.CategoryDistReport;
import com.ats.hub.model.report.DistReportByDate;
import com.ats.hub.model.report.ItemwiseDistReport;

import jdk.internal.joptsimple.util.DateConverter;

@Controller
public class ReportController {

	List<CategoryDistReport> hubUserList = new ArrayList<>();
	List<DistReportByDate> distRepByDateList = new ArrayList<>();
	List<ItemwiseDistReport> routeList = new ArrayList<>();

	List<Distributor> distList = new ArrayList<>();

	RestTemplate rest = new RestTemplate();

	@RequestMapping(value = "/showDistReport", method = RequestMethod.GET)
	public ModelAndView showOrderHistory(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/distwiseReport1");
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

	@RequestMapping(value = "/getDistByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<DistReportByDate> getDistByDate(HttpServletRequest request, HttpServletResponse response) {

		List<DistReportByDate> distList = new ArrayList<DistReportByDate>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String distIdList = request.getParameter("distIdList");
			System.out.println("distIdList" + distIdList);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			map.add("orderStatus", 3);
			map.add("distIdList", distIdList);
			distList = rest.postForObject(Constants.url + "getDistReportByDate", map, List.class);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return distList;
	}

	@RequestMapping(value = "/showItemwiseReport", method = RequestMethod.GET)
	public ModelAndView showItemwiseReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/itemwiseReport");
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

	@RequestMapping(value = "/getItemByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemwiseDistReport> getItemByDate(HttpServletRequest request, HttpServletResponse response) {

		List<ItemwiseDistReport> itemList = new ArrayList<ItemwiseDistReport>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String[] distIdList = request.getParameterValues("distIdList[]");
			System.out.println("distIdList" + distIdList);

			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < distIdList.length; i++) {
				sb = sb.append(distIdList[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			map.add("orderStatus", 3);
			map.add("distIdList", items);
			itemList = rest.postForObject(Constants.url + "getitemwiseDistReport", map, List.class);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return itemList;
	}

	@RequestMapping(value = "/showCatwiseReport", method = RequestMethod.GET)
	public ModelAndView showCatwiseReport(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("reports/catwiseReport");
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

	@RequestMapping(value = "/getCatByDate", method = RequestMethod.GET)
	@ResponseBody
	public List<CategoryDistReport> getCatByDate(HttpServletRequest request, HttpServletResponse response) {

		List<CategoryDistReport> catList = new ArrayList<CategoryDistReport>();
		try {

			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String[] distIdList = request.getParameterValues("distIdList[]");
			System.out.println("distIdList" + distIdList);

			StringBuilder sb = new StringBuilder();

			for (int i = 0; i < distIdList.length; i++) {
				sb = sb.append(distIdList[i] + ",");

			}
			String items = sb.toString();
			items = items.substring(0, items.length() - 1);

			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("fromDate", DateConvertor.convertToYMD(fromDate));
			map.add("toDate", DateConvertor.convertToYMD(toDate));

			map.add("orderStatus", 3);
			map.add("distIdList", items);
			catList = rest.postForObject(Constants.url + "getcategoryDistReport", map, List.class);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return catList;
	}

}
