package com.szx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


import com.szx.bean.EasyBuy_Order;
import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.dao.OrderDao;
import com.szx.dao.OrderDetailDao;
import com.szx.dao.ProductDao;
import com.szx.dao.impl.OrderDaoImpl;
import com.szx.dao.impl.OrderDetailDaoImpl;
import com.szx.dao.impl.ProductDaoImpl;
import com.szx.service.OrderDetailService;
import com.szx.util.Page;

public class OrderDetailServiceImpl implements OrderDetailService {
	private OrderDetailDao detailDao=new OrderDetailDaoImpl();
	private OrderDao orderDao=new OrderDaoImpl();
	private ProductDao productDao=new ProductDaoImpl();
	
	@Override
	public int add(EasyBuy_OrderDetail detail) {
		// TODO Auto-generated method stub
			//detail新增，order连带新增！
		EasyBuy_Order currentOrder=orderDao.selectOne("id",detail.getOrderId());
		if(currentOrder.getStatus()==6){//如果是购物车订单，那么更新订单价格
			currentOrder.setCost(currentOrder.getCost()+detail.getCost());
			int result1=orderDao.update(currentOrder);
			if(result1<=0){
				return -80;
			}
		}
		return detailDao.add(detail);
	}

	@Override
	public int deleteById(Serializable id){
		// TODO Auto-generated method stub
		EasyBuy_OrderDetail deletedDetail=detailDao.selectOne("id",id);
		EasyBuy_Order currentOrder=orderDao.selectOne("id",deletedDetail.getOrderId());
		if(currentOrder.getCost()<=deletedDetail.getCost()||detailDao.selectAll("orderId",currentOrder.getId()).size()<=1){
			int result1=orderDao.deleteById(currentOrder.getId());//如果是该单的最后一个详情，那么该单直接删除！
			if(result1<=0){
				return -61;
			}
		}else{
			currentOrder.setCost(currentOrder.getCost()-deletedDetail.getCost());
			int result2=orderDao.update(currentOrder);
			if(result2<=0){
				return -61;
			}
		}
		return detailDao.deleteById(id);
	}

	@Override
	public int update(EasyBuy_OrderDetail detail) {//订单详情的单价变化，订单总价会联动变化
		// TODO Auto-generated method stub
		int updateId=detail.getId();
		EasyBuy_OrderDetail oldDetail=detailDao.selectOne("id",updateId);
		EasyBuy_Order currentOrder=orderDao.selectOne("id",detail.getOrderId());
		if(oldDetail.getQuantity()!=detail.getQuantity()){//detail数量发生了变化,强制使cost进行同步,并修改订单总价
			Float unitPrice=productDao.selectOne("id",detail.getProductId()).getPrice();//需要通过product来确定价格,所以当有detail时不能删除product
			if(detail.getQuantity()*unitPrice!=detail.getCost()){
				detail.setCost(detail.getQuantity()*unitPrice);
			}
			Float delta=unitPrice*(detail.getQuantity()-oldDetail.getQuantity());
			currentOrder.setCost(currentOrder.getCost()+delta);
			if(currentOrder.getCost()<=0){
				int result1=orderDao.deleteById(currentOrder.getId());
				if(result1<=0){
					return -62;
				}
			}else{
				int result1=orderDao.update(currentOrder);
				if(result1<=0){
					return -62;
				}
			}
			
			if(detail.getQuantity()<=0){
				return detailDao.deleteById(detail.getId());
				
			}else{
				return detailDao.update(detail);
			}
			
		}
			return detailDao.update(detail);
		
		
	}

	@Override
	public List<EasyBuy_OrderDetail> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		return detailDao.selectAll(objects);
	}

	@Override
	public EasyBuy_OrderDetail selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return detailDao.selectOne(objects);
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return detailDao.getTotalCount(objects);
	}

	@Override
	public void getPageList(Page<EasyBuy_OrderDetail> pageObj, Object...objects) {
		// TODO Auto-generated method stub
		int totalCount=detailDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_OrderDetail> detailList=detailDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(), objects);
			pageObj.setList(detailList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_OrderDetail>());
		}
	}

}
