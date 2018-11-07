package com.szx.dao.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.szx.bean.EasyBuy_OrderDetail;

import com.szx.dao.OrderDetailDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;

public class OrderDetailDaoImpl extends BaseDao implements OrderDetailDao {

	@Override
	public int add(EasyBuy_OrderDetail detail) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO easybuy_order_detail(orderId,productId,quantity,cost)"
				+ " VALUES(?,?,?,?)";
		Object[] params = {detail.getOrderId(),detail.getProductId(),detail.getQuantity(),detail.getCost()};
		int rowNum = executeUpdate(sql, params); 
		return rowNum;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_order_detail where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_OrderDetail detail) {
		// TODO Auto-generated method stub
		String sql="update easybuy_order_detail set orderId=?,productId=?,quantity=?,cost=? where id=?";
		Object[] params={detail.getOrderId(),detail.getProductId(),detail.getQuantity(),detail.getCost(),detail.getId()};
		return executeUpdate(sql,params);
	}

	@Override
	public List<EasyBuy_OrderDetail> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order_detail";
		Object[] params=null;
		if(objects.length!=0&&objects.length%2==0){
			params=new Object[objects.length/2];
			for(int i=0;i<params.length;i++){
				params[i]=0;
			}//初始化对象数组为全零数组！
			sql+=" where ";
			for(int i=0;;){
				if(i%2==0){
					sql+=objects[i];
					sql+="=?";
					if((i+2)!=objects.length){
						sql+=" and ";
					}
				}else{
					params[(i-1)/2]=objects[i];
				}
				if((++i)==objects.length){
					break;
				}
			}
		}
		if(params==null){
			rs=executeQuery(sql);
		}else{
			rs=executeQuery(sql, params);
		}
		List<EasyBuy_OrderDetail> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_OrderDetail.class);
		return list;
	}

	@Override
	public EasyBuy_OrderDetail selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order_detail";
		Object[] params=null;
		if(objects.length!=0&&objects.length%2==0){
			params=new Object[objects.length/2];
			for(int i=0;i<params.length;i++){
				params[i]=0;
			}//初始化对象数组为全零数组！
			sql+=" where ";
			for(int i=0;;){
				if(i%2==0){
					sql+=objects[i];
					sql+="=?";
					if((i+2)!=objects.length){
						sql+=" and ";
					}
				}else{
					params[(i-1)/2]=objects[i];
				}
				if((++i)==objects.length){
					break;
				}
			}
		}
		if(params==null){
			rs=executeQuery(sql);
		}else{
			rs=executeQuery(sql, params);
		}
		EasyBuy_OrderDetail detail=null;
		detail=ResultSetUtil.setSingle(rs, EasyBuy_OrderDetail.class);
		return detail;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_order_detail";
		Object[] params=null;
		if(objects.length!=0&&objects.length%2==0){
			params=new Object[objects.length/2];
			for(int i=0;i<params.length;i++){
				params[i]=0;
			}//初始化对象数组为全零数组！
			sql+=" where ";
			for(int i=0;;){
				if(i%2==0){
					sql+=objects[i];
					sql+="=?";
					if((i+2)!=objects.length){
						sql+=" and ";
					}
				}else{
					params[(i-1)/2]=objects[i];
				}
				if((++i)==objects.length){
					break;
				}
			}
		}
		if(params==null){
			rs=executeQuery(sql);
		}else{
			rs=executeQuery(sql, params);
		}
		try {
			if(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return count;
	}

	@Override
	public List<EasyBuy_OrderDetail> getPageList(int pageNo, int pageSize, Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order_detail";
		if(objects.length!=0&&objects.length%2==0){
			Object[] params=new Object[objects.length/2+2];
			for(int i=0;i<params.length;i++){
				params[i]=0;
			}//初始化对象数组为全零数组！
			sql+=" where ";
			for(int i=0;;){
				if(i%2==0){
					sql+=objects[i];
					sql+="=?";
					if((i+2)!=objects.length){
						sql+=" and ";
					}
				}else{
					params[(i-1)/2]=objects[i];
				}
				if((++i)==objects.length){
					break;
				}
			}
			params[objects.length/2]=(pageNo-1)*pageSize;
			params[objects.length/2+1]=pageSize;
			sql+=" order by id desc limit ?,?";
			rs=executeQuery(sql,params);
		}else{
			Object[] params={(pageNo-1)*pageSize,pageSize};
			sql+=" order by id desc limit ?,?";
			rs=executeQuery(sql,params);
		}
		List<EasyBuy_OrderDetail> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_OrderDetail.class);
		return list;
	}

	

}
