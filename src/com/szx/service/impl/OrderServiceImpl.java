package com.szx.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_Order;
import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.bean.EasyBuy_User;
import com.szx.dao.OrderDao;
import com.szx.dao.OrderDetailDao;
import com.szx.dao.UserDao;
import com.szx.dao.impl.OrderDaoImpl;
import com.szx.dao.impl.OrderDetailDaoImpl;
import com.szx.dao.impl.UserDaoImpl;
import com.szx.service.OrderService;
import com.szx.util.Page;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao=new OrderDaoImpl();
	private OrderDetailDao detailDao=new OrderDetailDaoImpl();
	private UserDao userDao=new UserDaoImpl();
	@Override
	public int add(EasyBuy_Order order) {
		// TODO Auto-generated method stub
		EasyBuy_User testUser=userDao.selectOne("userName",order.getUserName());
		if(testUser==null){
			return -52;//新增订单失败
		}
		if(order.getStatus()==6){//购物车订单初始化总价钱为0
			List<EasyBuy_Order> testOrderList=orderDao.selectAll("userName",order.getUserName(),"status",6);
			if(testOrderList.size()!=0){
				return -52;//一个用户只能由一个购物车订单
			}else{
				order.setCost(new Float(0));
			}
		}
		order.setUserId(userDao.selectOne("userName",testUser.getUserName()).getId());
		return orderDao.add(order);
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		List<EasyBuy_OrderDetail> detailList=detailDao.selectAll("orderId",id);
		for(int i=0;i<detailList.size();i++){
			int temp=detailDao.deleteById(detailList.get(i).getId());
			if(temp<=0){
				return -51;
			}
		}//循环删除
		return orderDao.deleteById(id);
	}

	@Override
	public int update(EasyBuy_Order order) {
		// TODO Auto-generated method stub
		return orderDao.update(order);
	}

	@Override
	public List<EasyBuy_Order> selectAll(Object...objects) {
		// TODO Auto-generated method stub
		return orderDao.selectAll(objects);
	}

	@Override
	public EasyBuy_Order selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return orderDao.selectOne(objects);
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return orderDao.getTotalCount(objects);
	}

	@Override
	public void getPageList(Page<EasyBuy_Order> pageObj, Object... objects) {
		// TODO Auto-generated method stub
		int totalCount=orderDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_Order> orderList=orderDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(),objects);
			pageObj.setList(orderList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_Order>());
		}
	}

}
