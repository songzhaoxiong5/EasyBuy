package com.szx.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;


import com.szx.service.impl.*;
import com.szx.bean.*;
import com.szx.controller.common.*;

public class UserControlServlet extends CommonServlet<EasyBuy_User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
		PrintWriter out=response.getWriter();
		String opr=request.getParameter("opr");
		if("del".equals(opr)){
			int result=super.delete(request, response, UserServiceImpl.class);
			super.returnJSON(result, out);
		}else if("add".equals(opr)){
			int result=super.add(request, response, EasyBuy_User.class, UserServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modify".equals(opr)){
			int result=super.modify(request, response, EasyBuy_User.class, UserServiceImpl.class);
			super.returnJSON(result, out);
		}else if("list".equals(opr)){
			super.selectPageList(request, response, EasyBuy_User.class, UserServiceImpl.class);
		}else if("listAll".equals(opr)){
			super.selectAll(request, response, EasyBuy_User.class,UserServiceImpl.class);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectAll(request, response, EasyBuy_User.class,UserServiceImpl.class, objects);
		}else if("listWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectPageList(request, response, EasyBuy_User.class, UserServiceImpl.class, objects);
		}
		out.flush();
		out.close();
	}
	
}
