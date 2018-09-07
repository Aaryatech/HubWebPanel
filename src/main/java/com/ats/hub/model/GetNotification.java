package com.ats.hub.model;

import java.util.List;

public class GetNotification {

	private Notification notification;
	private List<Integer> distIdList;

	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public List<Integer> getDistIdList() {
		return distIdList;
	}

	public void setDistIdList(List<Integer> distIdList) {
		this.distIdList = distIdList;
	}

	@Override
	public String toString() {
		return "GetNotification [notification=" + notification + ", distIdList=" + distIdList + "]";
	}

}
