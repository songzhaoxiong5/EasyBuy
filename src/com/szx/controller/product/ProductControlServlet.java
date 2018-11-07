package com.szx.controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.szx.bean.EasyBuy_Product;


import com.szx.service.impl.ProductServiceImpl;
import com.szx.util.FootPrintUtil;
import com.szx.util.Page;

public class ProductControlServlet extends FootPrintUtil {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Logger logger=Logger.getLogger(ProductControlServlet.class);
	private ProductServiceImpl productService=new ProductServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		logger.debug("进入了productcontrolservlet");
		String opr=request.getParameter("opr");
		if(opr==null||opr.length()==0){
			int result=super.processFormData(request,response,EasyBuy_Product.class,ProductServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("addWithFile".equals(opr)){
			int result=super.processFormData(request,response,EasyBuy_Product.class,ProductServiceImpl.class,opr);
			super.returnJSON(result, out);
		}else if("list".equals(opr)){
			super.selectPageList(request, response, EasyBuy_Product.class, ProductServiceImpl.class);
		}else if("del".equals(opr)){
			int result=super.delete(request, response, ProductServiceImpl.class);
			super.returnJSON(result, out);
		}else if("modifyWithFile".equals(opr)){
			int result=super.processFormData(request, response, EasyBuy_Product.class, ProductServiceImpl.class, opr);
			super.returnJSON(result, out);
		}else if("listAll".equals(opr)){
			super.selectAll(request, response, EasyBuy_Product.class,ProductServiceImpl.class);
		}else if("listAllWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectAll(request, response,EasyBuy_Product.class, ProductServiceImpl.class, objects);
		}else if("listWithClues".equals(opr)){
			Object[] objects=super.parseClues(request, response);
			super.selectPageList(request, response, EasyBuy_Product.class, ProductServiceImpl.class, objects);
		}else if("forSell".equals(opr)){
			this.forSell(request,response);
		}else if("addfootprint".equals(opr)){
			Integer footprint=Integer.parseInt(request.getParameter("footprint"));
			super.addFootprint(request, response, footprint);
		}else if("showfootprint".equals(opr)){
			super.showFootPrint(request, response);
		}else if("searchWithClues".equals(opr)){
			Object[] objects=this.parseClues2(request, response);
			this.getSearchPages(request, response, objects);
		}
		out.flush();
		out.close();
	}
	//搜索功能条件判断：如果输入框中输入的为空，返回一个空的不定长参数，否则返回正常的不定长数组
	private Object[] parseClues2(HttpServletRequest request, HttpServletResponse response){
		String temp=request.getParameter("clueNumber");//clueNumber的数量包括searchString
		int clueNumber=0;
		if(temp!=null){
			clueNumber=Integer.parseInt(temp);
		}else{//有多少个clue,在这个搜索功能中，clue的数量其实是模糊查询字段的数量
			return new Object[0];//如果没有clueNumber的字段，那么返回一个长度为0的数组
		}
		Object[] targets=new Object[clueNumber];
		for(int i=0;i<clueNumber-1;i++){
			String temp1=request.getParameter("target"+(i+1));
			if(temp1!=null){
				targets[i]=temp1;
			}
		}
		String clue=request.getParameter("searchString");
		if(clue!=null&&!"".equals(clue)){
			targets[clueNumber-1]="%"+clue+"%";
			return targets;
		}else{//如果不存在searchString字段或者该字段的值为空时，返回一个空的数组
			return new Object[0];
		}
		
	}
	
	//搜索的方法
	private void getSearchPages(HttpServletRequest request, HttpServletResponse response, Object...objects){
		List<EasyBuy_Product> list=null;
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));//获得页码参数
  		Page<EasyBuy_Product> pageObj=new Page<>();
  	  	pageObj.setCurrentPageNo(pageIndex);
  	  	String pageSizeStr=request.getParameter("pageSize");
	  	  if(pageSizeStr==null||"undefined".equals(pageSizeStr)){
		  	  	pageObj.setPageSize(12);
		  	}else{
		  		int pageSize=Integer.parseInt(pageSizeStr);
		  		pageObj.setPageSize(pageSize);
		  	}
			pageObj.setList(list);
			PrintWriter out=null;
	  	  	
	  	  	try {
				out=response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  	  	ProductServiceImpl productService=new ProductServiceImpl();
	  	  	productService.getSearchPages(pageObj, objects);
	  	  	Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	  		String temp=gson.toJson(pageObj);
	  		String json="[{\"type\":\"EasyBuy_Product\"},"+temp+"]";
	  		logger.debug("您获取的商品搜索对象："+json);
	  		out.print(json);
	}
	
	
	
	
	private void forSell(HttpServletRequest request, HttpServletResponse response){
		PrintWriter out=null;
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Integer id=Integer.parseInt(request.getParameter("id"));
		String isDelete=request.getParameter("status");
		EasyBuy_Product product=productService.selectOne("id",id);
		if(product==null){
			out.print("{\"message\":\"The product does not exist!\"}");
		}else if("on".equals(isDelete)){
			product.setIsDelete(1);
			int result=productService.update(product);
			super.returnJSON(result, out);
		}else if("off".equals(isDelete)){
			product.setIsDelete(0);
			int result=productService.update(product);
			super.returnJSON(result, out);
		}else{
			out.print("{\"message\":\"The status of the product is wrong!\"}");
		}
			out.flush();
			out.close();
		
	}
	
	
	
	
}
