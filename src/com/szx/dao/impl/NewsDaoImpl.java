package com.szx.dao.impl;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_News;
import com.szx.dao.NewsDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;

public class NewsDaoImpl extends BaseDao implements NewsDao {

	@Override
	public int add(EasyBuy_News news) {
		// TODO Auto-generated method stub
		int result=0;
		String sql=null;
		if(news.getCreateTime()!=null){
			sql="insert into easybuy_news(title,content,createTime,img) values(?,?,?,?)";
			Object[] params={news.getTitle(),news.getContent(),news.getCreateTime(),news.getImg()};
			result=executeUpdate(sql,params);
		}else{
			sql="insert into easybuy_news(title,content,img) values(?,?,?)";
			Object[] params={news.getTitle(),news.getContent(),news.getImg()};
			result=executeUpdate(sql,params);
		}
		return result;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_news where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_News news) {
		// TODO Auto-generated method stub
		String sql=null;
		int result=0;
		if(news.getCreateTime()!=null){
			sql="update easybuy_news set title=?,content=?,createTime=?,img=? where id=?";
			Object[] params={news.getTitle(),news.getContent(),news.getCreateTime(),news.getImg(),news.getId()};
			result=executeUpdate(sql,params);
		}else{
			sql="update easybuy_news set title=?,content=?,img=? where id=?";
			Object[] params={news.getTitle(),news.getContent(),news.getImg(),news.getId()};
			result=executeUpdate(sql,params);
		}
		return result;
	}

	@Override
	public List<EasyBuy_News> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_news";
		Object[] params=null;
		if(objects.length!=0&&objects.length%2==0){//这里判断条件很强，要求入参个数必须为偶数
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
		List<EasyBuy_News> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_News.class);
		return list;
	}

	@Override
	public EasyBuy_News selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_news";
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
		EasyBuy_News news=null;
		news=ResultSetUtil.setSingle(rs, EasyBuy_News.class);
		return news;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_news";
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
	public List<EasyBuy_News> getPageList(int pageNo, int pageSize, Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_news";
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
		List<EasyBuy_News> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_News.class);
		return list;
	}

	

}
