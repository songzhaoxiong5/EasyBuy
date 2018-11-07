package com.szx.controller.common;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import com.szx.bean.EasyBuy_User;
import com.szx.util.ShopcartOperationUtil;


public class ShopcartControlServlet extends ShopcartOperationUtil {
	private Logger logger=Logger.getLogger(ShopcartControlServlet.class);
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
		logger.debug("进入了shopcartcontrol");
		String opr=request.getParameter("opr");
		EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
		boolean isLogin=(loginUser!=null?true:false);
		if("fetch".equals(opr)){//单纯获取当前的购物车信息！不做任何修改
			super.getShopCartInfo(request, response,isLogin);
		}else if("add".equals(opr)){
			String temp=request.getParameter("cartId");//前台拿到的商品id
			Integer cartId=Integer.parseInt(temp);
			String temp1=request.getParameter("cartQuantity");
			Integer cartQuantity=Integer.parseInt(temp1);
			PrintWriter out=response.getWriter();
			int result=super.addShopCart(request, response, cartId,cartQuantity,isLogin);
			this.showMessage(out, result);
			out.flush();
			out.close();
		}else if("del".equals(opr)){
			PrintWriter out=response.getWriter();
			String temp=request.getParameter("cartId");
			Integer cartId=Integer.parseInt(temp);
			int result=super.deleteShopcart(request, response,cartId,isLogin);
			this.showMessage(out, result);
			out.flush();
			out.close();
		}else if("clear".equals(opr)){
			PrintWriter out=response.getWriter();
			int result=super.clearShopcart(request, response,isLogin);
			this.showMessage(out, result);
			out.flush();
			out.close();
		}else if("update".equals(opr)){
			PrintWriter out=response.getWriter();
			String temp=request.getParameter("cartId");//前台拿到的商品id
			Integer cartId=Integer.parseInt(temp);
			String temp1=request.getParameter("cartQuantity");
			Integer cartQuantity=Integer.parseInt(temp1);
			int result=super.updateShopCart(request, response, cartId, cartQuantity,isLogin);
			this.showMessage(out, result);
			out.flush();
			out.close();
		}
		
	}
	
	
	
	
}
