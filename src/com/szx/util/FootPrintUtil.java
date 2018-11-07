package com.szx.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.szx.bean.EasyBuy_Product;
import com.szx.controller.common.CommonServlet;
import com.szx.service.impl.ProductServiceImpl;

public class FootPrintUtil extends CommonServlet<EasyBuy_Product> {
	private static Logger logger=Logger.getLogger(FootPrintUtil.class);
	private static String footprintNameRegx="^footprint[1-9]\\d*$";
	private static String footprintValueRegx="^[1-9]\\d*$";
	private static ProductServiceImpl productService=new ProductServiceImpl();
	private Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	
	public void showFootPrint(HttpServletRequest request, HttpServletResponse response){
		PrintWriter out=null;
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<EasyBuy_Product> list=new ArrayList<>();
		Cookie[] cookies=request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().matches(footprintNameRegx)&&cookies[i].getValue().matches(footprintValueRegx)){
				Integer currentFootprint=Integer.parseInt(cookies[i].getValue());
				EasyBuy_Product product=productService.selectOne("id",currentFootprint);
				if(product!=null){
					list.add(product);
				}
			}
		}
		String json=gson.toJson(list);
		logger.debug("您获得的浏览记录对象为："+json);
		out.print(json);
	}
	
	public void addFootprint(HttpServletRequest request, HttpServletResponse response, Integer footprint){
		if(!checkExistence(request,response,footprint)){
			int nextPosition=this.getNextPosition(request, response, footprint);
			Cookie cookie=new Cookie("footprint"+nextPosition,footprint.toString());
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
		PrintWriter out=null;
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("{\"result\":\"added\"}");
		out.flush();
		out.close();
	}
	
	private boolean checkExistence(HttpServletRequest request, HttpServletResponse response, Integer footprint){
		Cookie[] cookies=request.getCookies();
		boolean flag=false;
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().matches(footprintNameRegx)&&cookies[i].getValue().matches(footprintValueRegx)&&cookies[i].getValue().equals(footprint.toString())){
				flag=true;
			}
		}
		return flag;
	}
	
	//将下一个浏览记录存储的位置的表示记录为nextPosition,当前最大的position为currentPosition
	private int getNextPosition(HttpServletRequest request, HttpServletResponse response, Integer footprint){
		Cookie[] cookies=request.getCookies();
		boolean flag=false;
		int nextPosition=-1;
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("footprintPosition")&&cookies[i].getValue().matches(footprintValueRegx)){
				//当前存在nextposition
				if(cookies[i].getValue().equals("6")){
					cookies[i].setValue("1");
					cookies[i].setMaxAge(60*60*24*7);
					response.addCookie(cookies[i]);
					nextPosition=1;
				}else{
					cookies[i].setValue(new Integer(Integer.parseInt(cookies[i].getValue())+1).toString());
					cookies[i].setMaxAge(60*60*24*7);//重新保存!
					response.addCookie(cookies[i]);//重新保存!
					nextPosition=Integer.parseInt(cookies[i].getValue());
				}
				flag=true;
			}
		}
		if(!flag){
				//当前不存在这个cookie
				Cookie cookie=new Cookie("footprintPosition","1");
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
				nextPosition=1;
		}
		return nextPosition;
	}
	
	
}
