package com.ats.hub.model;

public class GetNotificationRoute {
	private Notification notification;
	private int routeId;

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	@Override
	public String toString() {
		return "GetNotificationRoute [notification=" + notification + ", routeId=" + routeId + "]";
	}

}
