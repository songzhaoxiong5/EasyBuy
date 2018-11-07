package com.szx.bean;

public class EasyBuy_User{
	private Integer id;
	private String realName;
	private String userName;
	private String mD5UserName;
	private String password;
	private String mD5Password;
	private Integer sex;
	private String identityCode;
	private String email;
	private String mobile;
	private String address;
	private Integer type;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMD5UserName() {
		return mD5UserName;
	}
	public void setMD5UserName(String mD5UserName) {
		this.mD5UserName = mD5UserName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMD5Password() {
		return mD5Password;
	}
	public void setMD5Password(String mD5Password) {
		this.mD5Password = mD5Password;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getIdentityCode() {
		return identityCode;
	}
	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "EasyBuy_User [id=" + id + ", realName=" + realName
				+ ", userName=" + userName + ", password=" + password
				+ ", sex=" + sex + ", identityCode=" + identityCode
				+ ", email=" + email + ", mobile=" + mobile + ", address="
				+ address + ", type=" + type + "]";
	}
	
	
}
