package com.szx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_News;
import com.szx.dao.NewsDao;
import com.szx.dao.impl.NewsDaoImpl;
import com.szx.service.NewsService;
import com.szx.util.Page;

public class NewsServiceImpl implements NewsService {
	private NewsDao newsDao=new NewsDaoImpl();
	@Override
	public int add(EasyBuy_News news) {
		// TODO Auto-generated method stub
		return newsDao.add(news);
	}
	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		return newsDao.deleteById(id);
	}
	@Override
	public int update(EasyBuy_News news) {
		// TODO Auto-generated method stub
		return newsDao.update(news);
	}
	@Override
	public List<EasyBuy_News> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		return newsDao.selectAll(objects);
	}
	@Override
	public EasyBuy_News selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return newsDao.selectOne(objects);
	}
	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return newsDao.getTotalCount(objects);
	}
	@Override
	public void getPageList(Page<EasyBuy_News> pageObj, Object... objects) {
		// TODO Auto-generated method stub
		int totalCount=newsDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_News> newsList=newsDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(), objects);
			pageObj.setList(newsList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_News>());
		}
	}

}
