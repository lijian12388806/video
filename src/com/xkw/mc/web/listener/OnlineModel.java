package com.xkw.mc.web.listener;

import java.io.Serializable;

/**
 * 在线用户信息封装类 
 * @author Administrator
 */
public class OnlineModel implements Serializable {

	private static final long serialVersionUID = 3301426383744731294L;
	
	private String sessionId;
	private String ipAddress;
	private String loadTime;
	private String location;
	
	public OnlineModel() {
		super();
	}

	
	public OnlineModel(String sessionId, String ipAddress, String loadTime,
			String location) {
		super();
		this.sessionId = sessionId;
		this.ipAddress = ipAddress;
		this.loadTime = loadTime;
		this.location = location;
	}


	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getLoadTime() {
		return loadTime;
	}

	public void setLoadTime(String loadTime) {
		this.loadTime = loadTime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((sessionId == null) ? 0 : sessionId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OnlineModel other = (OnlineModel) obj;
		if (sessionId == null) {
			if (other.sessionId != null)
				return false;
		} else if (!sessionId.equals(other.sessionId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OnlineModel [sessionId="
				+ sessionId + ", ipAddress=" + ipAddress + ", loadTime=" + loadTime + "]";
	}

}
