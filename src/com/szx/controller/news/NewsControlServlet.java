package com.szx.controller.news;


import java.io.IOException;
import java.io.PrintWriter;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;

import com.szx.bean.EasyBuy_News;
import com.szx.service.impl.NewsServiceImpl;
import com.szx.controller.common.*;

public class NewsControlServlet extends CommonServlet<EasyBuy_News> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Logger logger=Logger.getLogger(NewsControlServlet.class);

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
		logger.debug("进入了newscontrolservlet");
		String opr=request.getParameter("opr");
		if(opr==null||opr.length()==0){
			int result=super.processFormData(request,response,EasyBuy_News.class,NewsServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("addWithFile".equals(opr)){
			int result=super.processFormData(request,response,EasyBuy_News.class,NewsServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("list".equals(opr)){
			super.selectPageList(request, response, EasyBuy_News.class, NewsServiceImpl.class);
		}else if("del".equals(opr)){
			int result=super.delete(request, response, NewsServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modifyWithFile".equals(opr)){
			int result=super.processFormData(request, response,  EasyBuy_News.class, NewsServiceImpl.class, opr);
			super.returnJSON(result, out);
		}else if("listAll".equals(opr)){
			super.selectAll(request, response, EasyBuy_News.class,NewsServiceImpl.class);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectAll(request, response, EasyBuy_News.class,NewsServiceImpl.class, objects);
		}else if("listWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectPageList(request, response, EasyBuy_News.class, NewsServiceImpl.class, objects);
		}
		out.flush();
		out.close();
	}
	
	
	
}
