package com.szx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_ProductCategory;
import com.szx.dao.ProductCategoryDao;
import com.szx.dao.ProductDao;
import com.szx.dao.impl.ProductCategoryDaoImpl;
import com.szx.dao.impl.ProductDaoImpl;
import com.szx.service.ProductCategoryService;
import com.szx.util.Page;

public class ProductCategoryServiceImpl implements ProductCategoryService {
	private ProductCategoryDao categoryDao=new ProductCategoryDaoImpl();
	private ProductDao productDao=new ProductDaoImpl();
	@Override
	public int add(EasyBuy_ProductCategory category) {
		// TODO Auto-generated method stub
		EasyBuy_ProductCategory testCategory=categoryDao.selectOne("name",category.getName());
		if(testCategory!=null){
			return -1;
		}
		return categoryDao.add(category);
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		EasyBuy_ProductCategory currentCategory=categoryDao.selectOne("id",id);
		if(currentCategory.getType()==3){
			int numberOfProduct=productDao.selectAll("categoryLevel3",currentCategory.getId()).size();
			if(numberOfProduct>0){
				return -41;
			}
		}else if(currentCategory.getType()==2){
			int numberOfCategory3=categoryDao.selectAll("type",3,"parentId",currentCategory.getId()).size();
			if(numberOfCategory3>0){
				return -41;
			}
		}else if(currentCategory.getType()==1){
			int numberOfCategory2=categoryDao.selectAll("type",2,"parentId",currentCategory.getId()).size();
			if(numberOfCategory2>0){
				return -41;
			}
		}
		return categoryDao.deleteById(id);
	}

	@Override
	public int update(EasyBuy_ProductCategory category) {
		// TODO Auto-generated method stub
		EasyBuy_ProductCategory testCategory=categoryDao.selectOne("name",category.getName());
		if(testCategory!=null){
			if(testCategory.getId()==category.getId()){
				return categoryDao.update(category);
			}else{
				return -1;
			}
		}else{
			return categoryDao.update(category);
		}
		
		
	}

	@Override
	public List<EasyBuy_ProductCategory> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		return categoryDao.selectAll(objects);
	}

	@Override
	public EasyBuy_ProductCategory selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return categoryDao.selectOne(objects);
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return categoryDao.getTotalCount(objects);
	}

	@Override
	public void getPageList(Page<EasyBuy_ProductCategory> pageObj, Object ...objects) {
		// TODO Auto-generated method stub
		int totalCount=categoryDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_ProductCategory> categoryList=categoryDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(),objects);
			pageObj.setList(categoryList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_ProductCategory>());
		}
	}

}
