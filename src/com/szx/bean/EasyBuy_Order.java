package com.szx.bean;

import java.util.Date;

public class EasyBuy_Order {
	private Integer id;
	private Integer userId;
	private String userName;
	private String userAddress;
	private Date createTime;
	private Float cost;
	private Integer status;
	private Integer type;
	private String serialNumber;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Float getCost() {
		return cost;
	}
	public void setCost(Float cost) {
		this.cost = cost;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}	
}

//
//id            int(11)       (NULL)           NO      PRI     (NULL)   auto_increment  select,insert,update,references  编号        
//userId        varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  用户ID      
//loginName     varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  用户名     
//userAddress   varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  用户地址  
//createTime    datetime      (NULL)           NO              (NULL)                   select,insert,update,references  创建时间  
//cost          float         (NULL)           NO              (NULL)                   select,insert,update,references  金额        
//status        int(11)       (NULL)           NO              (NULL)                   select,insert,update,references  状态        
//type          int(1)        (NULL)           NO              (NULL)                   select,insert,update,references  类型        
//serialNumber  varchar(255)  utf8_general_ci  NO              (NULL)                   select,insert,update,references  订单号  