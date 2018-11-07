package com.szx.bean;

public class EasyBuy_OrderDetail {
	private Integer id;
	private Integer orderId;
	private Integer productId;
	private Integer quantity;
	private Float cost;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getCost() {
		return cost;
	}
	public void setCost(Float cost) {
		this.cost = cost;
	}
	
	
	
}

//Field      Type         Collation  Null    Key     Default  Extra           Privileges                       Comment   
//---------  -----------  ---------  ------  ------  -------  --------------  -------------------------------  ----------
//id         int(10)      (NULL)     NO      PRI     (NULL)   auto_increment  select,insert,update,references  编号    
//orderID    int(10)      (NULL)     NO              (NULL)                   select,insert,update,references  订单ID  
//productId  int(10)      (NULL)     NO              (NULL)                   select,insert,update,references  商品ID  
//quantity   int(11)      (NULL)     NO              (NULL)                   select,insert,update,references  数量    
//cost       float(10,3)  (NULL)     NO              (NULL)                   select,insert,update,references  金额    