package com.ats.hub.model.dashreport;

import java.util.List;

public class DatewiseCatQty {

	
	private String date;
	private List<Integer> orderQty;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<Integer> getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(List<Integer> orderQty) {
		this.orderQty = orderQty;
	}
	
	@Override
	public String toString() {
		return "DatewiseCatQty [date=" + date + ", orderQty=" + orderQty + "]";
	}
	
		
	
}
