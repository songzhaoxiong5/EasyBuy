package com.szx.controller.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import com.szx.bean.EasyBuy_ProductCategory;
import com.szx.controller.common.CommonServlet;
import com.szx.service.impl.ProductCategoryServiceImpl;


public class CategoryControlServlet extends CommonServlet<EasyBuy_ProductCategory> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Logger logger=Logger.getLogger(CategoryControlServlet.class);
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		logger.debug("进入了categorycontrolservlet");
		String opr=request.getParameter("opr");
		if(opr==null||opr.length()==0){
			int result=super.processFormData(request,response,EasyBuy_ProductCategory.class,ProductCategoryServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("addWithFile".equals(opr)){
			int result=super.processFormData(request,response,EasyBuy_ProductCategory.class,ProductCategoryServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("list".equals(opr)){
			super.selectPageList(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class);
		}else if("del".equals(opr)){
			int result=super.delete(request, response, ProductCategoryServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modifyWithFile".equals(opr)){
			int result=super.processFormData(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class, opr);
			super.returnJSON(result, out);
		}else if("listAll".equals(opr)){
			super.selectAll(request, response, EasyBuy_ProductCategory.class,ProductCategoryServiceImpl.class);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectAll(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class, objects);
		}else if("listWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectPageList(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class, objects);
		}else if("add".equals(opr)){
			int result=super.add(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modify".equals(opr)){
			int result=super.modify(request, response, EasyBuy_ProductCategory.class, ProductCategoryServiceImpl.class);
			super.returnJSON(result, out);
		}
		out.flush();
		out.close();
	}
	
}
