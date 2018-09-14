package com.ats.hub.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ats.hub.commons.Constants;
import com.ats.hub.model.Distributor;
import com.ats.hub.model.report.CategoryDistReport;
import com.ats.hub.model.report.DistReportByDate;
import com.ats.hub.model.report.ItemwiseDistReport;

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
	
	
	//consume this on search
	/*@RequestMapping(value = { "/getDistReportByDate" }, method = RequestMethod.POST)
	public @ResponseBody List<DistReportByDate> getDistReportByDate(@RequestParam("fromDate") String fromDate,
			@RequestParam("toDate") String toDate, @RequestParam("distIdList") List<Integer> distIdList,
			@RequestParam("orderStatus") int orderStatus) {
	
*/
}
