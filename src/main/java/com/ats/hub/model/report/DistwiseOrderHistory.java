package com.ats.hub.model.report;

public class DistwiseOrderHistory {
	
	private int distId;

	private String distEngName;
	private String distMarName;
	private float order1;
	private float order2;
	private float order3;
	
	public int getDistId() {
		return distId;
	}
	public void setDistId(int distId) {
		this.distId = distId;
	}
	public String getDistEngName() {
		return distEngName;
	}
	public void setDistEngName(String distEngName) {
		this.distEngName = distEngName;
	}
	public String getDistMarName() {
		return distMarName;
	}
	public void setDistMarName(String distMarName) {
		this.distMarName = distMarName;
	}
	public float getOrder1() {
		return order1;
	}
	public void setOrder1(float order1) {
		this.order1 = order1;
	}
	public float getOrder2() {
		return order2;
	}
	public void setOrder2(float order2) {
		this.order2 = order2;
	}
	public float getOrder3() {
		return order3;
	}
	public void setOrder3(float order3) {
		this.order3 = order3;
	}
	
	@Override
	public String toString() {
		return "DistwiseOrderHistory [distId=" + distId + ", distEngName=" + distEngName + ", distMarName="
				+ distMarName + ", order1=" + order1 + ", order2=" + order2 + ", order3=" + order3 + "]";
	}
	
	

}
