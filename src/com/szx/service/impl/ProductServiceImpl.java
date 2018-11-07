package com.szx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.bean.EasyBuy_Product;
import com.szx.dao.OrderDetailDao;
import com.szx.dao.ProductDao;
import com.szx.dao.impl.OrderDetailDaoImpl;
import com.szx.dao.impl.ProductDaoImpl;
import com.szx.service.ProductService;
import com.szx.util.Page;

public class ProductServiceImpl implements ProductService {
	private ProductDao productDao=new ProductDaoImpl();
	private OrderDetailDao detailDao=new OrderDetailDaoImpl();
	@Override
	public int add(EasyBuy_Product product) {
		// TODO Auto-generated method stub
		EasyBuy_Product testProduct=productDao.selectOne("name",product.getName());
		if(testProduct==null){
			return productDao.add(product);
		}else{
			return -1;
		}
		
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		List<EasyBuy_OrderDetail> orderDetailList=detailDao.selectAll("productId",id);
		if(orderDetailList.size()>0){
			return  -31;
		}
		return productDao.deleteById(id);
	}

	@Override
	public int update(EasyBuy_Product product) {
		// TODO Auto-generated method stub
		EasyBuy_Product testProduct=productDao.selectOne("name",product.getName());
		if(testProduct!=null){
			if(testProduct.getId()==product.getId()){
				return productDao.update(product);
			}else{
				return -1;
			}
		}else{
			return productDao.update(product);
		}
		
	}

	@Override
	public List<EasyBuy_Product> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		return productDao.selectAll(objects);
	}

	@Override
	public EasyBuy_Product selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return productDao.selectOne(objects);
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return productDao.getTotalCount(objects);
	}

	@Override
	public void getPageList(Page<EasyBuy_Product> pageObj, Object ...objects) {
		// TODO Auto-generated method stub
		int totalCount=productDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_Product> productList=productDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(),objects);
			pageObj.setList(productList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_Product>());
		}
	}
	
	
	
	public List<EasyBuy_Product> getSearchList(Object...objects){
		return ((ProductDaoImpl)(productDao)).getSearchList(objects);
	}
	
	public int getTotalCount2(Object...objects){
		return ((ProductDaoImpl)(productDao)).getTotalCount2(objects);
	}
	
	public void getSearchPages(Page<EasyBuy_Product> pageObj, Object ...objects){
		int totalCount=((ProductDaoImpl)productDao).getTotalCount2(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_Product> productList=((ProductDaoImpl)productDao).getSearchPages(pageObj.getCurrentPageNo(), pageObj.getPageSize(),objects);
			pageObj.setList(productList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_Product>());
		}
	}
}
