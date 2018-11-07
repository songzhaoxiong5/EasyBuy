package com.szx.service.impl;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import com.szx.bean.EasyBuy_User;
import com.szx.service.*;
import com.szx.dao.impl.*;
import com.szx.util.*;

public class UserServiceImpl implements UserService {
	private UserDaoImpl userDao=new UserDaoImpl();
	private OrderDaoImpl orderDao=new OrderDaoImpl();
	@Override
	public int add(EasyBuy_User user){
		// TODO Auto-generated method stub
		try {
			String MD5Password=MyMD5Util.getEncryptedPwd(user.getPassword());
			String MD5UserName=MyMD5Util.getEncryptedPwd(user.getUserName());
			user.setMD5Password(MD5Password);
			user.setMD5UserName(MD5UserName);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EasyBuy_User testUser=userDao.selectOne("userName",user.getUserName());
		if(testUser!=null){
			return -1;
		}
		return userDao.add(user);
		
	}

	@Override
	public int deleteById(Serializable id){
		// TODO Auto-generated method stub
		int orderHeld=orderDao.selectAll("userId",id).size();
		if(orderHeld>0){
			return -21;
		}
		return userDao.deleteById(id);
	}

	@Override
	public int update(EasyBuy_User user) {
		// TODO Auto-generated method stub
		EasyBuy_User testUser=userDao.selectOne("userName",user.getUserName());
		if(testUser!=null){
			if(testUser.getId()==user.getId()){
				if(!user.getPassword().equals(testUser.getPassword())){
					try {
						String newMd5Pwd=MyMD5Util.getEncryptedPwd(user.getPassword());
						user.setMD5Password(newMd5Pwd);
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					try {
						String newMd5Name=MyMD5Util.getEncryptedPwd(user.getUserName());
						user.setMD5UserName(newMd5Name);
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				return userDao.update(user);
			}else{
				return -1;
			}
		}else{
			return userDao.update(user);
		}
		
	
		
	}

	@Override
	public List<EasyBuy_User> selectAll(Object ...objects) {
		// TODO Auto-generated method stub
		return userDao.selectAll(objects);
	}

	@Override
	public EasyBuy_User selectOne(Object... objects) {
		// TODO Auto-generated method stub
		return userDao.selectOne(objects);
		
	}

	@Override
	public EasyBuy_User findByInput(String userName, String password) {
		// TODO Auto-generated method stub
		//先判断有没有该用户
		try {			
			String passwordInDB=userDao.findPasswordByName(userName);
			if(passwordInDB==null){
				return null;
			}
			//EasyBuy_User user=null;
			//在不加密的情况下判断是否有该用户,用MD5密码判断
			//user=userDao.findByMD5(userName, password);
			//if(user!=null){
			//	return user; 
			//}
			//如果没有，加密输入的密码，再次判断有没有这个用户
			String MD5PasswordInDB=userDao.findMD5ByName(userName);
			if(MyMD5Util.validPassword(password, MD5PasswordInDB)){
				return userDao.findByInput(userName, passwordInDB);
			}else{
				return null;
			}
				
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean checkExistence(String userName) {
		// TODO Auto-generated method stub
		if(userDao.selectByName(userName)!=null){
			return true;
		}
		return false;
	}

	@Override
	public String findMD5PasswordByPlain(String password,String userName) {
		// TODO Auto-generated method stub
		return userDao.findMD5PasswordByPlain(password,userName);
	}

	@Override
	public String findPlainNameByMD5(String MD5UserName) {
		// TODO Auto-generated method stub
		return userDao.findPlainNameByMD5(MD5UserName);
	}

	@Override
	public String findPlainPasswordByMD5(String MD5Password,String userName) {
		// TODO Auto-generated method stub
		return userDao.findPlainPasswordByMD5(MD5Password,userName);
	}

	@Override
	public String findMD5NameByPlain(String userName) {
		// TODO Auto-generated method stub
		return userDao.findMD5NameByPlain(userName);
	}

	@Override
	public int getTotalCount(Object...objects) {
		// TODO Auto-generated method stub
		return userDao.getTotalCount(objects);
	}

	@Override
	public void getPageList(Page<EasyBuy_User> pageObj, Object ...objects) {
		// TODO Auto-generated method stub
		int totalCount=userDao.getTotalCount(objects);
		pageObj.setTotalCount(totalCount);
		if(totalCount>0){
			if(pageObj.getCurrentPageNo()>pageObj.getTotalPageCount()){
				pageObj.setCurrentPageNo(pageObj.getTotalPageCount());
			}
			List<EasyBuy_User> userList=userDao.getPageList(pageObj.getCurrentPageNo(), pageObj.getPageSize(),objects);
			pageObj.setList(userList);
		}else{
			pageObj.setCurrentPageNo(0);
			pageObj.setList(new ArrayList<EasyBuy_User>());
		}
	}

	
	

	

}
