package com.szx.util;



import com.szx.bean.EasyBuy_Product;
import com.szx.service.impl.ProductServiceImpl;

public class ShopcartUtil {
	private Integer cartId;
	private String productName;
	private Float unitPrice;
	private Integer cartQuantity;
	private Float subTotal;
	private String img;
	
	public ShopcartUtil(Integer productId, Integer quantity){
		load(productId,quantity);
	}
	
	private void load(Integer cartId, Integer cartQuantity){
		this.cartId=cartId;
		this.cartQuantity=cartQuantity;
		ProductServiceImpl productService=new ProductServiceImpl();
		EasyBuy_Product product=productService.selectOne("id",cartId);
		if(product!=null){
			this.productName=product.getName();
			this.unitPrice=product.getPrice();
			this.subTotal=(this.unitPrice)*(this.cartQuantity);
			this.img=product.getImg();
		}
	}

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Float getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(Integer cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public Float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	
}
