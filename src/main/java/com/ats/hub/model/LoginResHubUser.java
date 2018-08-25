package com.ats.hub.model;

public class LoginResHubUser {
	private boolean error;
	private String msg;
	private HubUser hubUser;

	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HubUser getHubUser() {
		return hubUser;
	}

	public void setHubUser(HubUser hubUser) {
		this.hubUser = hubUser;
	}

	@Override
	public String toString() {
		return "LoginResHubUser [error=" + error + ", msg=" + msg + ", hubUser=" + hubUser + "]";
	}
}
