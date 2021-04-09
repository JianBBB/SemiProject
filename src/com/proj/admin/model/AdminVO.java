package com.proj.admin.model;

public class AdminVO {
	private int adminNo;
	private String adId;
	private String adPwd;
	private String adFlag;
	private String brandNo;
	
	public AdminVO() {
		super();
	}
	

	public int getAdminNo() {
		return adminNo;
	}



	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}



	public String getAdId() {
		return adId;
	}



	public void setAdId(String adId) {
		this.adId = adId;
	}



	public String getAdPwd() {
		return adPwd;
	}



	public void setAdPwd(String adPwd) {
		this.adPwd = adPwd;
	}



	public String getAdFlag() {
		return adFlag;
	}



	public void setAdFlag(String adFlag) {
		this.adFlag = adFlag;
	}



	public String getBrandNo() {
		return brandNo;
	}



	public void setBrandNo(String brandNo) {
		this.brandNo = brandNo;
	}



	@Override
	public String toString() {
		return "AdminVO [adminNo=" + adminNo + ", adId=" + adId + ", adPwd=" + adPwd + ", adFlag=" + adFlag
				+ ", brandNo=" + brandNo + "]";
	}
	
}
