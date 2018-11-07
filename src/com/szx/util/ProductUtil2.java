package com.szx.util;

import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Product;

public class ProductUtil2 {
	private List<ProductWrapper> wrapperList;
	
	public ProductUtil2(List<EasyBuy_Product> productList){
		loadProduct(productList);
	}
	
	private void loadProduct(List<EasyBuy_Product> productList){
		int productNum=productList.size();
		List<ProductWrapper> list=new ArrayList<ProductWrapper>();
		for(int i=0;i<productNum;i++){
			ProductWrapper wrapper=new ProductWrapper(productList.get(i));
			list.add(wrapper);
		}
		this.wrapperList=list;
	}

	public List<ProductWrapper> getWrapperList() {
		return wrapperList;
	}

	public void setWrapperList(List<ProductWrapper> wrapperList) {
		this.wrapperList = wrapperList;
	}
	
	
}
