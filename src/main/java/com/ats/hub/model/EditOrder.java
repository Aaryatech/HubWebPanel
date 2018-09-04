package com.ats.hub.model;

public class EditOrder {

	private int orderDetailId;

	private int orderQty;

	private float itemTotal;

	private int orderHeaderId;

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

	@Override
	public String toString() {
		return "EditOrder [orderDetailId=" + orderDetailId + ", orderQty=" + orderQty + ", itemTotal=" + itemTotal
				+ ", orderHeaderId=" + orderHeaderId + "]";
	}

}
