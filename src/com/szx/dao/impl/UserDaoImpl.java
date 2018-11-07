package com.szx.dao.impl;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;


import com.szx.bean.EasyBuy_User;
import com.szx.dao.UserDao;
import com.szx.util.BaseDao;
import com.szx.util.ResultSetUtil;
public class UserDaoImpl extends BaseDao implements UserDao{
	@Override
	public int add(EasyBuy_User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO easybuy_user(userName,mD5UserName,realName,`password`,mD5Password,sex,identityCode,email,mobile,address,type)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {user.getUserName(),user.getMD5UserName(),user.getRealName(),user.getPassword(),user.getMD5Password(),user.getSex(),user.getIdentityCode(),user.getEmail(),user.getMobile(),user.getAddress(),user.getType()};
		int rowNum = executeUpdate(sql, params); 
		return rowNum;
	}

	@Override
	public int deleteById(Serializable id) {
		// TODO Auto-generated method stub
		String sql="delete from easybuy_user where id=?";
		Object[] params={id};
		int rowNum=executeUpdate(sql,params);
		return rowNum;
	}

	@Override
	public int update(EasyBuy_User user) {
		// TODO Auto-generated method stub
		String sql="update easybuy_user set userName=?,mD5UserName=?,realName=?,password=?, mD5Password=?,sex=?,identityCode=?,email=?,mobile=?,address=?,type=? where id=?";
		Object[] params={user.getUserName(),user.getMD5UserName(),user.getRealName(),user.getPassword(),user.getMD5Password(),user.getSex(),user.getIdentityCode(),user.getEmail(),user.getMobile(),user.getAddress(),user.getType(),user.getId()};
		return executeUpdate(sql,params);
	}

	@Override
	public List<EasyBuy_User> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_user";
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
		List<EasyBuy_User> list=new ArrayList<>();
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_User.class);
		return list;
	}

	@Override
	public EasyBuy_User selectOne(Object... objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_user";
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
		EasyBuy_User user=null;
		user=ResultSetUtil.setSingle(rs, EasyBuy_User.class);
		return user;
	}
	

	@Override
	public EasyBuy_User findByInput(String userName, String password) {
		ResultSet rs=null;
		EasyBuy_User user=null;
		String sql="select * from easybuy_user where userName=? and password=?";
		Object[] params={userName,password};
		rs=executeQuery(sql,params);
		try{
			user=ResultSetUtil.setSingle(rs, EasyBuy_User.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public String findPasswordByName(String userName) {
		ResultSet rs=null;
		// TODO Auto-generated method stub
		String sql="select password from easybuy_user where userName=?";
		String password=null;
		Object[] params={userName};
		rs=executeQuery(sql,params);
		try {
			if(rs.next()){
				password=rs.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return password;
	}

	@Override
	public EasyBuy_User selectByName(String userName) {
		// TODO Auto-generated method stub
		EasyBuy_User user=null;
		ResultSet rs=null;
		String sql="select * from easybuy_user where userName=?";
		Object[] params={userName};
		rs=executeQuery(sql,params);
		user=ResultSetUtil.setSingle(rs, EasyBuy_User.class);
		return user;
	}

	@Override
	public EasyBuy_User findByMD5(String userName, String MD5Password) {
		EasyBuy_User user=null;
		ResultSet rs=null;
		String sql="select * from easybuy_user where userName=? and MD5Password=?";
		Object[] params={userName,MD5Password};
		rs=executeQuery(sql,params);
		user=ResultSetUtil.setSingle(rs, EasyBuy_User.class);
		return user;
	}

	@Override
	public String findMD5ByName(String userName) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String MD5Password=null;
		String sql="select mD5Password from easybuy_user where userName=?";
		Object[] params={userName};
		rs=executeQuery(sql,params);
		try {
			if(rs.next()){
				MD5Password=rs.getString("MD5Password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return MD5Password;
	}

	@Override
	public String findMD5PasswordByPlain(String password,String userName) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String MD5Password=null;
		String sql="select MD5Password from easybuy_user where password=? and userName=?";
		Object[] params={password,userName};
		rs=executeQuery(sql,params);
		try {
			if(rs.next()){
				MD5Password=rs.getString("MD5Password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return MD5Password;
	}

	@Override
	public String findPlainNameByMD5(String MD5UserName) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String userName=null;
		String sql="select userName from easybuy_user where MD5UserName=?";
		Object[] params={MD5UserName};
		rs=executeQuery(sql,params);
		try {
			if(rs.next()){
				userName=rs.getString("userName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return userName;
		
	}

	@Override
	public String findPlainPasswordByMD5(String MD5Password,String userName) {
		// TODO Auto-generated method stub
				ResultSet rs=null;
				String password=null;
				String sql="select password from easybuy_user where MD5Password=? and userName=?";
				Object[] params={MD5Password,userName};
				rs=executeQuery(sql,params);
				try {
					if(rs.next()){
						password=rs.getString("password");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					BaseDao.closeAfterQuery(rs);
				}
				return password;
	}

	@Override
	public String findMD5NameByPlain(String userName) {
		ResultSet rs=null;
		String MD5UserName=null;
		String sql="select MD5UserName from easybuy_user where userName=?";
		Object[] params={userName};
		rs=executeQuery(sql,params);
		try {
			if(rs.next()){
				MD5UserName=rs.getString("MD5UserName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			BaseDao.closeAfterQuery(rs);
		}
		return MD5UserName;
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		int count=0;
		String sql="select count(id) from easybuy_user";
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
	public List<EasyBuy_User> getPageList(int pageNo, int pageSize, Object ...objects) {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		String sql="select * from easybuy_user";
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
		List<EasyBuy_User> list=null;
		list=ResultSetUtil.eachResultSet(rs, EasyBuy_User.class);
		return list;
	}

	
	
	
}
