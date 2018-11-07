package com.szx.util;

import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Order;


public class OrderUtil {
	private Page<EasyBuy_Order> pageObj;
	private List<OrderWrapper> wrapperList;
	
	public OrderUtil(Page<EasyBuy_Order> pageObj){
		this.loadOrder(pageObj);
	}//初始化对象即完成了填充！
	
	
//wrapperList内含Wrapper Wrapper含一个order,一个orderdetilshow的list,一个ordertailshow含一个orderdetail和一个productname
	private void loadOrder(Page<EasyBuy_Order> pageObj){
		this.pageObj=pageObj;
		List<EasyBuy_Order> orderList=pageObj.getList();
		int orderNum=orderList.size();//有多少order
		List<OrderWrapper> wrapperList=new ArrayList<OrderWrapper>();//初始化一个ArrayList
		for(int i=0;i<orderNum;i++){//循环填充wrapperList
			OrderWrapper wrapper=new OrderWrapper(orderList.get(i));
			wrapperList.add(wrapper);
		}
		this.wrapperList=wrapperList;
	}
	
	

	public Page<EasyBuy_Order> getPageObj() {
		return pageObj;
	}



	public void setPageObj(Page<EasyBuy_Order> pageObj) {
		this.pageObj = pageObj;
	}



	public List<OrderWrapper> getWrapperList() {
		return wrapperList;
	}



	public void setWrapperList(List<OrderWrapper> wrapperList) {
		this.wrapperList = wrapperList;
	}

	
	
	
}
