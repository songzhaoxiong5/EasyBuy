package com.szx.util;

import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Order;
import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.service.impl.OrderDetailServiceImpl;


public class OrderWrapper {
	private EasyBuy_Order order;
	private List<OrderDetailShow> detailList;
	public OrderWrapper(EasyBuy_Order order){
		loadOrder(order);
	}
	private void  loadOrder(EasyBuy_Order order){
		this.order=order;
		List<OrderDetailShow> detailList=new ArrayList<OrderDetailShow>();
		OrderDetailServiceImpl detailService=new OrderDetailServiceImpl();
		List<EasyBuy_OrderDetail> orderDetailList=detailService.selectAll("orderId",order.getId());
		int orderDetailNum=orderDetailList.size();
		for(int i=0;i<orderDetailNum;i++){
			OrderDetailShow detailShow=new OrderDetailShow(orderDetailList.get(i));
			detailList.add(detailShow);
		}
		this.detailList=detailList;
		
	}
	
	public EasyBuy_Order getOrder() {
		return order;
	}
	public void setOrder(EasyBuy_Order order) {
		this.order = order;
	}
	public List<OrderDetailShow> getDetailList() {
		return detailList;
	}
	public void setDetailList(List<OrderDetailShow> detailList) {
		this.detailList = detailList;
	}
	
	
	
}
