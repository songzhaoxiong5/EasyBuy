package com.szx.dao;
import com.szx.bean.*;
public interface UserDao extends CommonDao<EasyBuy_User> {
	public EasyBuy_User findByInput(String userName,String password);
	public EasyBuy_User findByMD5(String userName,String MD5Password);
	public String findPasswordByName(String userName);
	public String findMD5ByName(String userName);
	public EasyBuy_User selectByName(String userName);
	public String findMD5PasswordByPlain(String password,String userName);
	public String findPlainPasswordByMD5(String MD5Password,String userName);
	public String findPlainNameByMD5(String MD5UserName);
	public String findMD5NameByPlain(String userName);
}
