package com.szx.controller.user;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.szx.bean.EasyBuy_User;
import com.szx.service.impl.UserServiceImpl;

public class RegisterControlServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4297481676920794541L;

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
		response.setContentType("text/html;UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		UserServiceImpl userService=new UserServiceImpl();
	  	String userName=request.getParameter("userName");
	  	String password=request.getParameter("password");
	  	String sex=request.getParameter("sex");
	  	String realName=request.getParameter("realName");
	  	String PID=request.getParameter("PID");
	  	String email=request.getParameter("email");
	  	String phone=request.getParameter("phone");
	  	String type=request.getParameter("userType");
	 	if(userService.checkExistence(userName)){
	 		
	 		out.print("<script type='text/javascript' charset='utf-8'>alert('该用户已存在！');location.href='pages/general/register.jsp?opr=wrong&userName="+userName+
	 				"&sex="+sex+"&realName="+realName+"&PID="+PID+"&email="+email+"&phone="+phone+"&type="+type+"';</script>");
	 	}else{
	 		EasyBuy_User user=new EasyBuy_User();
	 		user.setUserName(userName);
	 		user.setPassword(password);
	 		user.setSex(Integer.parseInt(sex));
	 		user.setRealName(realName);
	 		user.setIdentityCode(PID);
	 		user.setEmail(email);
	 		user.setMobile(phone);
	 		user.setType(Integer.parseInt(type));
	 		int result=userService.add(user);
	 		if(result>0){
	 			response.sendRedirect("pages/general/index.jsp");
	 			
	 		}else{
	 			out.print("<script type='text/javascript' charset='utf-8'>alert('注册失败，请联系管理员！');location.href='pages/general/register.jsp?userName="+userName+
	 				"&sex="+sex+"&realName="+realName+"&PID="+PID+"&email="+email+"&phone="+phone+"&type="+type+"';</script>");
	 		 
	 		}
	 	}
	}
	
}
