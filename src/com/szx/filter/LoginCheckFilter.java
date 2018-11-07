package com.szx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.*;

import com.szx.bean.EasyBuy_User;

public class LoginCheckFilter implements Filter {
	private Logger logger=Logger.getLogger(LoginCheckFilter.class);
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		logger.debug("进入了过滤器-用户登录");
		HttpServletRequest 	request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		HttpSession session=request.getSession(false);
		if((session!=null)&&(session.getAttribute("login")!=null)){
			System.out.println("有login字段");
			EasyBuy_User user=(EasyBuy_User)(session.getAttribute("login"));
			if(user.getType()==0){
				logger.debug(user.getUserName()+"登录！");
				chain.doFilter(req, resp);
				logger.debug("退出了过滤器-用户登录");
			}else{
				response.sendRedirect(request.getContextPath()+"/pages/general/login.jsp");
			}
		}else{
			response.sendRedirect(request.getContextPath()+"/pages/general/login.jsp");
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
