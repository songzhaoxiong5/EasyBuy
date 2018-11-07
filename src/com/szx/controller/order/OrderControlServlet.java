package com.szx.controller.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.szx.bean.EasyBuy_Order;
import com.szx.bean.EasyBuy_User;


import com.szx.controller.common.CommonServlet;
import com.szx.service.impl.OrderServiceImpl;


import com.szx.util.OrderUtil;
import com.szx.util.OrderUtil2;
import com.szx.util.Page;

public class OrderControlServlet extends CommonServlet<EasyBuy_Order> {
	private static final long serialVersionUID = 1L;
	private Logger logger=Logger.getLogger(OrderControlServlet.class);

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
		logger.debug("进入了ordercontrolservlet");
		String opr=request.getParameter("opr");
		if(opr==null||opr.length()==0){
			int result=super.processFormData(request,response,EasyBuy_Order.class,OrderServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("addWithFile".equals(opr)){
			int result=super.processFormData(request,response,EasyBuy_Order.class,OrderServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("list".equals(opr)){
			this.getOrderPages(request, response);
		}else if("del".equals(opr)){
			int result=super.delete(request, response, OrderServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modify".equals(opr)){
			int result1=super.delete(request, response, OrderServiceImpl.class);
			int result2=super.add(request, response, EasyBuy_Order.class, OrderServiceImpl.class);
			int result=-53;
			if(result1>0&&result2>0){
				result=result1+result2;
			}
			super.returnJSON(result, out);
		}else if("listAll".equals(opr)){
			this.getOrder(request, response);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			this.getOrder(request, response, objects);
		}else if("listWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectPageList(request, response, EasyBuy_Order.class, OrderServiceImpl.class, objects);
		}else if("add".equals(opr)){
			int result=super.add(request, response, EasyBuy_Order.class, OrderServiceImpl.class);
			super.returnJSON(result, out);
		}else if("checkIdentity".equals(opr)){
			this.checkIdentity(request, response);
		}else if("placeOrder".equals(opr)){
			this.placeOrder(request, response);
		}
		out.flush();
		out.close();
	}
	
	private void checkIdentity(HttpServletRequest request, HttpServletResponse response){
		EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");//判断用户是否登录
		if(loginUser!=null){
			try {
				response.sendRedirect("pages/general/checkout.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				response.sendRedirect("pages/general/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void placeOrder(HttpServletRequest request, HttpServletResponse response){
		EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");//判断用户是否登录
		if(loginUser==null){
			try {
				response.sendRedirect("pages/general/login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			OrderServiceImpl orderService=new OrderServiceImpl();
			EasyBuy_Order orderToPlace=orderService.selectOne("userId",loginUser.getId(),"status","6","type","1");
			if(orderToPlace!=null){
				orderToPlace.setStatus(1);
				Date date=new Date();
				orderToPlace.setCreateTime(date);
				int result=orderService.update(orderToPlace);
				if(result>0){
					try {
						response.sendRedirect("pages/general/user_console/user_orders.jsp");
						return;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					try {
						response.sendRedirect("pages/general/error.jsp");
						return;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}else{
				try {
					response.sendRedirect("pages/general/error.jsp");
					return;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	//获取分页订单！
	private void getOrderPages(HttpServletRequest request,HttpServletResponse response, Object...objects){
		List<EasyBuy_Order> list=null;
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));//获得页码参数
  		Page<EasyBuy_Order> pageObj=new Page<>();
  	  	pageObj.setCurrentPageNo(pageIndex);
  	  	pageObj.setPageSize(5);//设置每页的内容数量
		pageObj.setList(list);
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		OrderServiceImpl orderService=new OrderServiceImpl();
		orderService.getPageList(pageObj, objects);
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
  		OrderUtil orderUtil=new OrderUtil(pageObj);
  		String json=gson.toJson(orderUtil);
  		logger.error("The OrderUtil Object you got: "+json);
  		out.print(json);
	}
	
	//获取不分页订单！
	private void getOrder(HttpServletRequest request,HttpServletResponse response, Object...objects){
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<EasyBuy_Order> list=null;
		OrderServiceImpl orderService=new OrderServiceImpl();
		list=orderService.selectAll(objects);
		OrderUtil2 orderUtil2=new OrderUtil2(list);
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
  		String json=gson.toJson(orderUtil2);
  		logger.error("您获取到的对象："+json);
  		out.print(json);
	}
}
