package com.szx.dao.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.szx.bean.EasyBuy_Product;

import com.szx.dao.ProductDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;

public class ProductDaoImpl extends BaseDao implements ProductDao {

	@Override
	public int add(EasyBuy_Product product) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO easybuy_product(name,description,price,stock,categoryLevel1,categoryLevel2,categoryLevel3,fileName,isDelete,img)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),product.getCategoryLevel3(),product.getFileName(),product.getIsDelete(),product.getImg()};
		int rowNum = executeUpdate(sql, params); 
		return rowNum;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_product where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_Product product) {
		// TODO Auto-generated method stub
		String sql="update easybuy_product set name=?,description=?,price=?,stock=?,categoryLevel1=?,categoryLevel2=?,categoryLevel3=?,fileName=?,isDelete=?,img=? where id=?";
		Object[] params={product.getName(),product.getDescription(),product.getPrice(),product.getStock(),product.getCategoryLevel1(),product.getCategoryLevel2(),product.getCategoryLevel3(),product.getFileName(),product.getIsDelete(),product.getImg(),product.getId()};
		return executeUpdate(sql,params);
	}

	@Override
	public List<EasyBuy_Product> selectAll(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product";
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
		List<EasyBuy_Product> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_Product.class);
		return list;
	}

	@Override
	public EasyBuy_Product selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product";
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
		EasyBuy_Product product=null;
		product=ResultSetUtil.setSingle(rs, EasyBuy_Product.class);
		return product;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_product";
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
	public List<EasyBuy_Product> getPageList(int pageNo, int pageSize, Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_product";
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
		List<EasyBuy_Product> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_Product.class);
		return list;
	}
	
	
	//模糊查询的实现方法 where x or y like ? clueNumber=X&target1=X&target2=X&searchClue=X;
	public List<EasyBuy_Product> getSearchList(Object...objects){//不分页查询的方法
		ResultSet rs=null;
		List<EasyBuy_Product> productList=new ArrayList<>();
		String sql="select * from easybuy_product ";
		if(objects.length>=2){
			Object[] params={objects[objects.length-1]};
			sql+=" where ";
			for(int i=0;;){
				sql=sql+((String)(objects[i]));
				if(++i==(objects.length-1)){
					break;
				}else{
					sql+=" or ";
				}
			}
			sql+=" like ?";
			rs=super.executeQuery(sql, params);
			productList=ResultSetUtil.eachResultSet(rs, EasyBuy_Product.class);
		}
		super.closeAfterQuery(rs);
		return productList;
	}
	
	//获取模糊查询数量的方法
	public int getTotalCount2(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_product";
		if(objects.length>=2){
			Object[] params={objects[objects.length-1]};
			sql+=" where ";
			for(int i=0;;){
				sql=sql+((String)(objects[i]));
				if(++i==(objects.length-1)){
					break;
				}else{
					sql+=" or ";
				}
			}
			sql+=" like ?";
			rs=super.executeQuery(sql, params);
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
		return count;	
}
	
	
	
	public List<EasyBuy_Product> getSearchPages(int pageNo, int pageSize, Object...objects){
		ResultSet rs=null;
		List<EasyBuy_Product> productList=new ArrayList<>();
		String sql="select * from easybuy_product ";
		if(objects.length>=2){
			sql+="where ";
			for(int i=0;;){
				sql=sql+((String)(objects[i]));
				if(++i==(objects.length-1)){
					break;
				}else{
					sql+=" or ";
				}
			}
			sql+=" like ? order by id desc limit ?,?";
			Object[] params={objects[objects.length-1],(pageNo-1)*pageSize,pageSize};
			rs=super.executeQuery(sql, params);
			productList=ResultSetUtil.eachResultSet(rs, EasyBuy_Product.class);
			return productList;
		}
			return productList;
	}
	
}
