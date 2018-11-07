package com.szx.dao.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.szx.bean.EasyBuy_ProductCategory;

import com.szx.dao.ProductCategoryDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;

public class ProductCategoryDaoImpl extends BaseDao implements ProductCategoryDao {

	@Override
	public int add(EasyBuy_ProductCategory category) {
		String sql = "INSERT INTO easybuy_product_category(name,parentId,type)"
				+ " VALUES(?,?,?)";
		Object[] params = {category.getName(),category.getParentId(),category.getType()};
		int rowNum = executeUpdate(sql, params); 
		return rowNum;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_product_category where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_ProductCategory category) {
		// TODO Auto-generated method stub
		String sql="update easybuy_product_category set name=?,parentId=?,type=? where id=?";
		Object[] params={category.getName(),category.getParentId(),category.getType(),category.getId()};
		return executeUpdate(sql,params);
	}

	@Override
	public List<EasyBuy_ProductCategory> selectAll(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product_category";
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
		List<EasyBuy_ProductCategory> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_ProductCategory.class);
		return list;
	}

	@Override
	public EasyBuy_ProductCategory selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product_category";
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
		EasyBuy_ProductCategory category=null;
		category=ResultSetUtil.setSingle(rs, EasyBuy_ProductCategory.class);
		return category;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_product_category";
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
	public List<EasyBuy_ProductCategory> getPageList(int pageNo, int pageSize, Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product_category";
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
		List<EasyBuy_ProductCategory> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_ProductCategory.class);
		return list;
	}
}

	


