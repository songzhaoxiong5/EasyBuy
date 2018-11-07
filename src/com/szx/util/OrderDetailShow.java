package com.szx.util;

import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.service.impl.ProductServiceImpl;


public class OrderDetailShow {
	private EasyBuy_OrderDetail orderDetail;
	private String productName;
	private String img;
	private Float unitPrice;
	public OrderDetailShow(EasyBuy_OrderDetail orderDetail){
		loadOrderDetail(orderDetail);
	}
	private void loadOrderDetail(EasyBuy_OrderDetail orderDetail){
		this.orderDetail=orderDetail;
		ProductServiceImpl productService=new ProductServiceImpl();
		this.productName=productService.selectOne("id",orderDetail.getProductId()).getName();
		this.img=productService.selectOne("id",orderDetail.getProductId()).getImg();
		this.unitPrice=productService.selectOne("id",orderDetail.getProductId()).getPrice();
	}
	public EasyBuy_OrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(EasyBuy_OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	
}
