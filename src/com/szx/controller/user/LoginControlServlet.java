package com.szx.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.szx.bean.EasyBuy_User;
import com.szx.service.impl.UserServiceImpl;
import com.szx.util.*;


public class LoginControlServlet extends ShopcartOperationUtil {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8817856507781945270L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		UserServiceImpl userService=new UserServiceImpl();
		String opr=request.getParameter("opr");
		if("logout".equals(opr)){
			request.getSession().removeAttribute("login");//退出登录
			response.sendRedirect("pages/general/index.jsp");
		}else if("checkLogged".equals(opr)){
	  		Cookie[] cookies=request.getCookies();
	  		if(cookies!=null){
	  		for(int i=0;i<cookies.length;i++){
	  			if("login".equals(cookies[i].getName())&&"yes".equals(cookies[i].getValue())){
	  				EasyBuy_User user=(EasyBuy_User)request.getSession().getAttribute("login");
	  				if(user!=null){
	  					if(user.getType()==1){
	  		  				request.getRequestDispatcher("pages/general/index.jsp").forward(request,response);
	  		  				return;
	  		  				}else{
	  		  					request.getRequestDispatcher("pages/general/index.jsp").forward(request,response);
	  		  					return;
	  		  				}
	  				}
	  				
	  			}
	  		}
	  		}
	  		request.getRequestDispatcher("pages/general/login.jsp?opr=doLogin").forward(request,response);
	  		return;
	  		
	  	}else{
	  		//Judge whether the Remember Me Option is selected
	  		String rememberMe=request.getParameter("remember");
	  		String userName=request.getParameter("userName");
	  		String password=request.getParameter("password");
	  		boolean valid=false;
	  		boolean valid1=false;
	  		boolean valid2=false;
	  		Cookie cookie1=null;
	  		Cookie cookie2=null;
	  		Cookie[] cookies=request.getCookies();
	  		if("1".equals(rememberMe)){
	  		//Judge whether this is the first time the user select this option
	  		if(cookies!=null){
	  		for(int i=0;i<cookies.length;i++){
	  			if("userName".equals(cookies[i].getName())){
	  				valid1=true;
	  				cookie1=cookies[i];
	  			}
	  			if("password".equals(cookies[i].getName())){
	  				valid2=true;
	  				cookie2=cookies[i];
	  			}
	  		}
	  		valid=valid1&&valid2;
	  		if(!valid){
	  			String MD5UserName=null;
	  			String MD5Password=null;
	  			try {
					MD5UserName=userService.findMD5NameByPlain(userName)==null?MyMD5Util.getEncryptedPwd(userName):userService.findMD5NameByPlain(userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			
	  			try {
					MD5Password=userService.findMD5PasswordByPlain(password,userName)==null?MyMD5Util.getEncryptedPwd(password):userService.findMD5PasswordByPlain(password,userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			Cookie userCookie=new Cookie("userName",MD5UserName);
	  			userCookie.setMaxAge(60*60*24*7);
	  			Cookie pwdCookie=new Cookie("password",MD5Password);
	  			pwdCookie.setMaxAge(60*60*24*7);
	  			response.addCookie(userCookie);
	  			response.addCookie(pwdCookie);
	  		}else{
	  			String MD5UserName=null;
	  			String MD5Password=null;
	  			try {
					MD5UserName=userService.findMD5NameByPlain(userName)==null?MyMD5Util.getEncryptedPwd(userName):userService.findMD5NameByPlain(userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			
	  			try {
					MD5Password=userService.findMD5PasswordByPlain(password,userName)==null?MyMD5Util.getEncryptedPwd(password):userService.findMD5PasswordByPlain(password,userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			cookie1=new Cookie("userName",MD5UserName);
	  			cookie1.setMaxAge(60*60*24*7);
	  			cookie2=new Cookie("password",MD5Password);
	  			cookie2.setMaxAge(60*60*24*7);
	  			response.addCookie(cookie1);
	  			response.addCookie(cookie2);
	  			
	  		}
	  		}else{
	  			String MD5UserName=null;
	  			String MD5Password=null;
	  			try {
					MD5UserName=userService.findMD5NameByPlain(userName)==null?MyMD5Util.getEncryptedPwd(userName):userService.findMD5NameByPlain(userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			
	  			try {
					MD5Password=userService.findMD5PasswordByPlain(password,userName)==null?MyMD5Util.getEncryptedPwd(password):userService.findMD5PasswordByPlain(password,userName);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	  			Cookie userCookie=new Cookie("userName",MD5UserName);
	  			userCookie.setMaxAge(60*60*24*7);
	  			Cookie pwdCookie=new Cookie("password",MD5Password);
	  			pwdCookie.setMaxAge(60*60*24*7);
	  			response.addCookie(userCookie);
	  			response.addCookie(pwdCookie);
	  		}
	  		}else{
	  			if(cookies!=null){
	  				for(int i=0;i<cookies.length;i++){
	  			if("userName".equals(cookies[i].getName())){
	  				cookies[i].setMaxAge(0);
	  				response.addCookie(cookies[i]);
	  			}
	  			if("password".equals(cookies[i].getName())){
	  				cookies[i].setMaxAge(0);
	  				response.addCookie(cookies[i]);
	  			}
	  			}
	  			}
	  			
	  		}
	  		
	  		EasyBuy_User user=userService.findByInput(userName, password);
	  		if(user!=null){
	  			request.getSession().setAttribute("login", user);
	  			Cookie logged=new Cookie("login","yes");
	  			logged.setMaxAge(60*60*24*7);
	  			response.addCookie(logged);
	  			super.transformShopCart(request, response);//转换购物车，此操作会清除本机上的所有购物车cookie并且将原来cookie中的购物车信息加载到数据库
	  			response.sendRedirect("pages/general/index.jsp");
	  			return;
//	  			if(user.getType()==0){//log to administration
//	  				response.sendRedirect("pages/admin/index.jsp");
//	  			}else{
//	  				response.sendRedirect("pages/login_success.jsp");
//		  			return;
//	  			}
	  		}else{
	  			out.print("<script type='text/javascript' charset='utf-8'>alert('用户名或密码错误！');location.href='pages/general/login.jsp?opr=wrong&userName="+userName+"';</script>");
	  		
	  	}
	  	}
	  	
	  	
	}
	
	
	
}
