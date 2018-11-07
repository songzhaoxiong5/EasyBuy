package com.szx.service;
import java.io.Serializable;
import java.util.List;
import com.szx.bean.*;
import com.szx.dao.*;
public interface UserService extends CommonService<EasyBuy_User>{
	
	public EasyBuy_User findByInput(String userName, String password);
	
	public boolean checkExistence(String userName);
	
	public String findMD5PasswordByPlain(String password,String userName);
	
	public String findPlainNameByMD5(String MD5UserName);
	
	public String findPlainPasswordByMD5(String MD5Password,String userName);
	
	public String findMD5NameByPlain(String userName);
	
}
