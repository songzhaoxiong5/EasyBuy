package com.szx.dao.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.szx.bean.EasyBuy_Order;
import com.szx.dao.OrderDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;

public class OrderDaoImpl extends BaseDao implements OrderDao {

	@Override
	public int add(EasyBuy_Order order) {
		int result=0;
		String sql=null;
		if(order.getCreateTime()!=null){
			sql="insert into easybuy_order(userId,userName,userAddress,createTime,cost,status,type,serialNumber) values(?,?,?,?,?,?,?,?)";
			Object[] params={order.getUserId(),order.getUserName(),order.getUserAddress(),order.getCreateTime(),order.getCost(),order.getStatus(),order.getType(),order.getSerialNumber()};
			result=executeUpdate(sql,params);
		}else{
			sql="insert into easybuy_order(userId,userName,userAddress,cost,status,type,serialNumber) values(?,?,?,?,?,?,?)";
			Object[] params={order.getUserId(),order.getUserName(),order.getUserAddress(),order.getCost(),order.getStatus(),order.getType(),order.getSerialNumber()};
			result=executeUpdate(sql,params);
		}
		return result;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_order where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_Order order) {
		// TODO Auto-generated method stub
		int result=0;
		String sql=null;
		if(order.getCreateTime()!=null){
			sql="update easybuy_order set userId=?,userName=?,userAddress=?,createTime=?,cost=?,status=?,type=?,serialNumber=? where id=?";
			Object[] params={order.getUserId(),order.getUserName(),order.getUserAddress(),order.getCreateTime(),order.getCost(),order.getStatus(),order.getType(),order.getSerialNumber(),order.getId()};
			result=executeUpdate(sql,params);
		}else{
			sql="update easybuy_order set userId=?,userName=?,userAddress=?,cost=?,status=?,type=?,serialNumber=? where id=?";
			Object[] params={order.getUserId(),order.getUserName(),order.getUserAddress(),order.getCost(),order.getStatus(),order.getType(),order.getSerialNumber(),order.getId()};
			result=executeUpdate(sql,params);
		}
		return result; 
	}

	@Override
	public List<EasyBuy_Order> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order";
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
		List<EasyBuy_Order> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_Order.class);
		return list;
	}

	@Override
	public EasyBuy_Order selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order";
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
		EasyBuy_Order order=null;
		order=ResultSetUtil.setSingle(rs, EasyBuy_Order.class);
		return order;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_order";
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
	public List<EasyBuy_Order> getPageList(int pageNo, int pageSize, Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_order";
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
		List<EasyBuy_Order> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_Order.class);
		return list;
		
	}

	

}
