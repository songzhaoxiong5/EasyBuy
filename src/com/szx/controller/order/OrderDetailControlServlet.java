package com.szx.controller.order;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import com.szx.bean.EasyBuy_OrderDetail;

import com.szx.controller.common.CommonServlet;
import com.szx.service.impl.OrderDetailServiceImpl;


public class OrderDetailControlServlet extends CommonServlet<EasyBuy_OrderDetail> {
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
		logger.debug("进入了orderdetailcontrolservlet");
		String opr=request.getParameter("opr");
		if("del".equals(opr)){
			int result=super.delete(request, response, OrderDetailServiceImpl.class);
			super.returnJSON(result, out);
		}else if("listAll".equals(opr)){//不分页查询所有结果，这个用的最多！
			super.selectAll(request, response, EasyBuy_OrderDetail.class, OrderDetailServiceImpl.class);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectAll(request, response, EasyBuy_OrderDetail.class,OrderDetailServiceImpl.class, objects);
		}else if("add".equals(opr)){
			int result=super.add(request, response, EasyBuy_OrderDetail.class, OrderDetailServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modify".equals(opr)){
			int result=super.modify(request, response, EasyBuy_OrderDetail.class, OrderDetailServiceImpl.class);
			super.returnJSON(result, out);
		}
		out.flush();
		out.close();
	}
	

}
