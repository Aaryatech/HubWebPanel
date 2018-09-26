package com.ats.hub.model.report;

import java.util.List;

import com.ats.hub.model.Category;

public class CatwiseTrend {
	

	private List<Category> catList ;
	private List<DatewithOrderQty>orderList;
	public List<Category> getCatList() {
		return catList;
	} 
	public void setCatList(List<Category> catList) {
		this.catList = catList; 
	}
	public List<DatewithOrderQty> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<DatewithOrderQty> orderList) {
		this.orderList = orderList;
	}
	
	@Override
	public String toString() {
		return "CatwiseTrend [catList=" + catList + ", orderList=" + orderList + "]";
	}
	
	
	
}
