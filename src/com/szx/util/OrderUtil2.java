package com.szx.util;

import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Order;


public class OrderUtil2 {
	private List<OrderWrapper> wrapperList;
	
	public OrderUtil2(List<EasyBuy_Order> list){
		loadOrder(list);
	}
	
	private void loadOrder(List<EasyBuy_Order> list){
		int orderNum=list.size();
		List<OrderWrapper> wrapperList=new ArrayList<OrderWrapper>();
		for(int i=0;i<orderNum;i++){
			OrderWrapper wrapper=new OrderWrapper(list.get(i));
			wrapperList.add(wrapper);
		}
		this.wrapperList=wrapperList;
	}
	
	public List<OrderWrapper> getWrapperList() {
		return wrapperList;
	}

	public void setWrapperList(List<OrderWrapper> wrapperList) {
		this.wrapperList = wrapperList;
	}
	
	
	
}
