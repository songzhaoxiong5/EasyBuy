package com.szx.util;

import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Product;

public class ProductUtil {
	private Page<EasyBuy_Product> pageObj;
	private List<ProductWrapper> wrapperList;
	
	public ProductUtil(Page<EasyBuy_Product> pageObj){
		this.loadProduct(pageObj);
	}
	
	private void loadProduct(Page<EasyBuy_Product> pageObj){
		this.pageObj=pageObj;
		int productNum=pageObj.getList().size();
		List<ProductWrapper> list=new ArrayList<ProductWrapper>();
		for(int i=0;i<productNum;i++){
			ProductWrapper wrapper=new ProductWrapper(pageObj.getList().get(i));
			list.add(wrapper);
		}
		this.wrapperList=list;
	}

	public Page<EasyBuy_Product> getPageObj() {
		return pageObj;
	}

	public void setPageObj(Page<EasyBuy_Product> pageObj) {
		this.pageObj = pageObj;
	}

	public List<ProductWrapper> getWrapperList() {
		return wrapperList;
	}

	public void setWrapperList(List<ProductWrapper> wrapperList) {
		this.wrapperList = wrapperList;
	}
	
	
}
