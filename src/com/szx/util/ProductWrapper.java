package com.szx.util;

import com.szx.bean.EasyBuy_Product;
import com.szx.bean.EasyBuy_ProductCategory;
import com.szx.service.impl.ProductCategoryServiceImpl;

public class ProductWrapper {
	private EasyBuy_Product product;
	private String firstCategoryName;
	private String secondCategoryName;
	private String thirdCategoryName;
	
	public ProductWrapper(EasyBuy_Product product){
		loadProduct(product);
	}
	
	private void loadProduct(EasyBuy_Product product){
		this.product=product;
		ProductCategoryServiceImpl categoryService=new ProductCategoryServiceImpl();
		EasyBuy_ProductCategory category1=categoryService.selectOne("id",product.getCategoryLevel1());
		this.firstCategoryName=category1.getName();
		EasyBuy_ProductCategory category2=categoryService.selectOne("id",product.getCategoryLevel2());
		this.secondCategoryName=category2.getName();
		EasyBuy_ProductCategory category3=categoryService.selectOne("id",product.getCategoryLevel3());
		this.thirdCategoryName=category3.getName();
	}

	public EasyBuy_Product getProduct() {
		return product;
	}

	public void setProduct(EasyBuy_Product product) {
		this.product = product;
	}

	public String getFirstCategoryName() {
		return firstCategoryName;
	}

	public void setFirstCategoryName(String firstCategoryName) {
		this.firstCategoryName = firstCategoryName;
	}

	public String getSecondCategoryName() {
		return secondCategoryName;
	}

	public void setSecondCategoryName(String secondCategoryName) {
		this.secondCategoryName = secondCategoryName;
	}

	public String getThirdCategoryName() {
		return thirdCategoryName;
	}

	public void setThirdCategoryName(String thirdCategoryName) {
		this.thirdCategoryName = thirdCategoryName;
	}
	
	
}
