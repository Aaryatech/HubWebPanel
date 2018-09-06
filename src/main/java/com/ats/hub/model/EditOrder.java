package com.ats.hub.model;

public class EditOrder {

	private int orderDetailId;

	private int orderQty;

	private float itemTotal;

	private int orderHeaderId;
	
	private int hubQty;
	private int msQty;

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public float getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}

	public int getOrderHeaderId() {
		return orderHeaderId;
	}

	public void setOrderHeaderId(int orderHeaderId) {
		this.orderHeaderId = orderHeaderId;
	}

	public int getHubQty() {
		return hubQty;
	}

	public void setHubQty(int hubQty) {
		this.hubQty = hubQty;
	}

	public int getMsQty() {
		return msQty;
	}

	public void setMsQty(int msQty) {
		this.msQty = msQty;
	}

	@Override
	public String toString() {
		return "EditOrder [orderDetailId=" + orderDetailId + ", orderQty=" + orderQty + ", itemTotal=" + itemTotal
				+ ", orderHeaderId=" + orderHeaderId + ", hubQty=" + hubQty + ", msQty=" + msQty + "]";
	}

}
