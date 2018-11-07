package com.szx.controller.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.*;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.*;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import com.szx.util.Page;

public class CommonServlet<T> extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7017525581937794005L;
	private Logger logger=Logger.getLogger(CommonServlet.class);
	//通用增加方法，不包含文件上传！
	public <T> int add(HttpServletRequest request,HttpServletResponse response, Class<T> clazz, Class serviceClass){
		int rowNum=-1;
		try {
			T object=clazz.newInstance();
			Field[] fields=clazz.getDeclaredFields();
			for(Field field:fields){
				field.setAccessible(true);
				String value=request.getParameter(field.getName());//必须保证传出来的字段与bean中定义的字段一模一样，否则会出错
				if(value!=null){
					if("java.lang.Integer".equals(field.getType().getCanonicalName())){//判断字段是否为Integer类型
						field.set(object, Integer.parseInt(value));
					}else if("java.lang.Float".equals(field.getType().getCanonicalName())){
						field.set(object, Float.parseFloat(value));
					}else if("java.util.Date".equals(field.getType().getCanonicalName())){
						try {
							if(!"".equals(value)){
								field.set(object, new SimpleDateFormat("yy-MM-dd hh:mm:ss").parse(value));
							}
						} catch (IllegalArgumentException e) {
							// TODO Auto-generated catch block
							logger.debug("CommonServlet add方法");
							e.printStackTrace();
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							logger.error("CommonServlet中日期解析错误！");
							e.printStackTrace();
						}
					}else{
						System.out.println("进入了设置字符串的方法！");
						field.set(object, value);
					}
				}
			}
			Object service=serviceClass.newInstance();
			try {
				Method method1=serviceClass.getMethod("add", clazz);
				rowNum=(int)method1.invoke(service, object);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowNum;
		
	}
	
	//通用修改方法
	public <T> int modify(HttpServletRequest request,HttpServletResponse response, Class<T> clazz, Class serviceClass){
		int rowNum=-1;
		try {
			T object=clazz.newInstance();
			Field[] fields=clazz.getDeclaredFields();
			for(Field field:fields){
				field.setAccessible(true);
				String value=request.getParameter(field.getName());//必须保证传出来的字段与bean中定义的字段一模一样，否则会出错
				if(value!=null){
					if("java.lang.Integer".equals(field.getType().getCanonicalName())){//判断字段是否为Integer类型
						field.set(object, Integer.parseInt(value));
					}else if("java.lang.Float".equals(field.getType().getCanonicalName())){
						field.set(object, Float.parseFloat(value));
					}else if("java.util.Date".equals(field.getType().getCanonicalName())){
						try {
							field.set(object, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value));
						} catch (IllegalArgumentException e) {
							// TODO Auto-generated catch block
							logger.debug("CommonServlet add方法");
							e.printStackTrace();
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							logger.error("CommonServlet中日期解析错误！");
							e.printStackTrace();
						}
					}else{
						field.set(object, value);
					}
				}
				
			}
			Object service=serviceClass.newInstance();
			try {
				Method method1=serviceClass.getMethod("update", clazz);
				rowNum=(int)method1.invoke(service, object);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowNum;
	}
	
	
	//通用删除方法
	public  int delete(HttpServletRequest request,HttpServletResponse response, Class serviceClass){
		String id=request.getParameter("delId");
		int id2=Integer.parseInt(id);
		int rowNum=-2;
		if(id!=null){
			try {
				Object service=serviceClass.newInstance();
				Method method1=serviceClass.getMethod("deleteById",Serializable.class);
				rowNum=(int)method1.invoke(service, id2);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			logger.error("没有获得删除的id");
		}
		return rowNum;
	}
	
	//通用查询方法
	public void selectPageList(HttpServletRequest request,HttpServletResponse response, Class<T> clazz, Class serviceClass, Object...objects){
		List<T> list=null;
  		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));//获得页码参数
  		Page<T> pageObj=new Page<>();
  	  	pageObj.setCurrentPageNo(pageIndex);
  	  	String pageSizeStr=request.getParameter("pageSize");
  	  	if(pageSizeStr==null||"undefined".equals(pageSizeStr)){
	  	  	if("EasyBuy_Product".equals(clazz.getSimpleName())){//商品每页12个
	  	  		pageObj.setPageSize(12);
	  	  	}else if("EasyBuy_News".equals(clazz.getSimpleName())){
	  	  		pageObj.setPageSize(7);//新闻每页7个
	  	  	}else{
	  	  		pageObj.setPageSize(5);//设置每页的内容数量
	  	  	}
  	  	}else{
  	  		int pageSize=Integer.parseInt(pageSizeStr);
  	  		pageObj.setPageSize(pageSize);
  	  	}
		pageObj.setList(list);
		String type=clazz.getSimpleName();
		PrintWriter out=null;
  	  	
	  	  	try {
				out=response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  	  	Object service=null;
			try {
				service = serviceClass.newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Method method1=null;
			try {
				method1 = serviceClass.getMethod("getPageList",pageObj.getClass(),Object[].class);
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
					Object objects1 = Array.newInstance(Object.class, objects.length);
					for(int i=0;i<objects.length;i++){
						Array.set(objects1, i, objects[i]);
					}
					method1.invoke(service,pageObj,objects1);
				
				
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	  		String temp=gson.toJson(pageObj);
	  		String json="[{\"type\":\""+type+"\"},"+temp+"]";
	  		logger.error("您获取的分页对象："+json);
	  		out.print(json);
  	  	
  	  	
	}
	
	public int processFormData(HttpServletRequest request,HttpServletResponse response,Class<T> clazz, Class serviceClass, String opr){
		logger.debug("进入了解析包含文件表单的程序");
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String uploadFileName="";
  		String fieldName="";
  		T object=null;
		try {
			object = clazz.newInstance();
		} catch (InstantiationException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
  		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
  		String subFile="upload/"+clazz.getSimpleName().substring(clazz.getSimpleName().indexOf("_")+1).toLowerCase()+"/";
  		String uploadFilePath=request.getSession().getServletContext().getRealPath(subFile);
  		File uploadFile=new File(uploadFilePath);
  		if(!uploadFile.exists()){
  			uploadFile.mkdirs();
  		}
  		File tempPatchFile=new File(request.getSession().getServletContext().getRealPath("temp/"));
  		if(!tempPatchFile.exists()){
  			tempPatchFile.mkdirs();
  		}
  		if(isMultipart){
  			DiskFileItemFactory factory=new DiskFileItemFactory();
  			factory.setSizeThreshold(4096);//设置缓存阈值
  			factory.setRepository(tempPatchFile);
  			ServletFileUpload upload=new ServletFileUpload(factory);
  			upload.setFileSizeMax(1024*1024*5);//设置最大上传文件大小
  			try{
  				List<FileItem> items=upload.parseRequest(request);
  				System.out.println(items.size());
  				Iterator<FileItem> iter=items.iterator();
  				Field[] fields=clazz.getDeclaredFields();
  				while(iter.hasNext()){
  					FileItem item=(FileItem)iter.next();
  					if(item.isFormField()){
  						fieldName=item.getFieldName();
  						String value=item.getString("UTF-8");
  						if("opr".equals(fieldName)){
  							opr=value;
  						}else{
  							for(Field field:fields){
  	  							field.setAccessible(true);
  	  							if(field.getName().equals(fieldName)){
  	  								if("java.lang.Integer".equals(field.getType().getCanonicalName())){//判断字段是否为Integer类型
  	  									field.set(object, Integer.parseInt(value));
  	  								}else if("java.lang.Float".equals(field.getType().getCanonicalName())){
  	  									field.set(object, Float.parseFloat(value));
  	  								}else if("java.util.Date".equals(field.getType().getCanonicalName())){
  	  									try {
  	  										if(value!=null&&!"".equals(value)){
  	  											field.set(object, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(value));
  	  										}
  	  									} catch (IllegalArgumentException e) {
  	  										// TODO Auto-generated catch block
  	  										logger.debug("CommonServlet processFormData方法");
  	  										e.printStackTrace();
  	  									} catch (ParseException e) {
  	  										// TODO Auto-generated catch block
  	  										logger.error("CommonServlet中日期解析错误-processFormData");
  	  										e.printStackTrace();
  	  									}
  	  								}else{
  	  									field.set(object, value);
  	  								}
  	  							}
  	  						}
  						}
  						
  					}else{
		  						String fileName=item.getName();
		  						if(fileName!=null&&!fileName.equals("")){
		  							List<String> fileType=Arrays.asList("gif","jpeg","jpg","png");
		  							String ext=fileName.substring(fileName.lastIndexOf(".")+1);
		  						if(!fileType.contains(ext)&&fileName!=null){
		  							logger.error("上传失败，文件类型只能是gif、jpeg、jpg、png");
		  							StringBuffer resultJSON=new StringBuffer("{\"message\":\"file type error!\"}");
		  							out.print(resultJSON);
		  							out.flush();//ajax动态返回错误信息
		  						}else{		  							
		  								File fullFile=new File(((Long)(System.currentTimeMillis())).toString().replace(".","-")+"-"+item.getName());
		  								File saveFile=new File(uploadFilePath,fullFile.getName());
		  								item.write(saveFile);
		  								if("EasyBuy_News".equals(clazz.getSimpleName())){
		  									Method method1=clazz.getMethod("setImg", String.class);
		  									method1.invoke(object, uploadFilePath+"\\"+fullFile.getName());
		  								}else if("EasyBuy_Product".equals(clazz.getSimpleName())){
		  									Method method1=clazz.getMethod("setImg", String.class);
		  									method1.invoke(object, uploadFilePath+"\\"+fullFile.getName());
		  									Method method2=clazz.getMethod("setFileName", String.class);
		  									method2.invoke(object, fileName);
		  								}
		  						}
		  						}
		  							
		  					}
		  				}
		  				
		  			}catch(FileUploadBase.SizeLimitExceededException ex){
		  				logger.error("上传失败，文件太大，全部文件的最大限制是："+upload.getSizeMax()+"bytes!");
		  				StringBuffer resultJSON=new StringBuffer("{\"message\":\"exceeds max volumn\"}");
						out.print(resultJSON);
						out.flush();//ajax动态返回错误信
		  			}catch(Exception e){
		  				e.printStackTrace();
		  				logger.error("文件上传发生错误！");
		  				StringBuffer resultJSON=new StringBuffer("{\"message\":\"error\"}");
						out.print(resultJSON);
						out.flush();//ajax动态返回错误信息
		  				
		  			}
		  		}
  				logger.error("您添加的带文件对象:"+object);
  				int result=0;
  				try{
  					Object service=serviceClass.newInstance();
  	  				if("addWithFile".equals(opr)){
  	  					Method method3=serviceClass.getMethod("add", clazz);
  	  					result=(int)method3.invoke(service, object);
  	  				}else if("modifyWithFile".equals(opr)){
  	  					Method method4=serviceClass.getMethod("update", clazz);
  	  					result=(int)method4.invoke(service, object);
  	  				}else{
  	  					System.out.println("进入默认添加方法！");
  	  					Method method5=serviceClass.getMethod("add", clazz);
	  					result=(int)method5.invoke(service, object);
  	  				}
  				}catch(Exception e){
  					e.printStackTrace();
  					logger.error(e);
  				}
  				
  				return result;
  				
	}
		
		
		public void selectAll(HttpServletRequest request,HttpServletResponse response, Class<T> clazz,Class serviceClass, Object ...objects){
			List<T> list=null;
			Object service=null;
			try {
				service=serviceClass.newInstance();
			} catch (InstantiationException | IllegalAccessException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			Method method=null;
			try {
				method=serviceClass.getMethod("selectAll",Object[].class);
			} catch (NoSuchMethodException | SecurityException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				
					Object objects1 = Array.newInstance(Object.class, objects.length);
					for(int i=0;i<objects.length;i++){
						Array.set(objects1, i, objects[i]);
					}
					list=(List<T>)method.invoke(service,objects1);
				
			} catch (IllegalAccessException | IllegalArgumentException
					| InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String type=clazz.getSimpleName();
			Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	  		String temp=gson.toJson(list);
	  		String json="[{\"type\":\""+type+"\"},"+temp+"]";
	  		logger.error("您获得的未分页对象："+json);
			PrintWriter out=null;
			try {
				out=response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(json);		
		}
		
		public void returnJSON(int result, PrintWriter out){
			if(result>0){
				out.print("{\"result\":\"success\"}");
			}else if(result==-1){//返回1是重名错误！
				out.print("{\"message\":\"The name has been used!\"}");
			}else if(result==-2){//删除错误
				out.print("{\"message\":\"Failure: Delete!\"}");
			}else if(result==-21){
				out.print("{\"message\":\"The user still has order!\"}");
			}else if(result==-51){
				out.print("{\"message\":\"Error encountered when delete the order detail!\"}");
			}else if(result==-41){
				out.print("{\"message\":\"There is still content in this category!\"}");
			}else if(result==-52){
				out.print("{\"message\":\"The User Name is invalid!\"}");
			}else if(result==-53){
				out.print("{\"message\":\"Failure: Modify Order!\"}");
			}
			else{
				out.print("{\"result\":\"error\"}");
			}
		}
		
		public Object[] parseClues(HttpServletRequest request,HttpServletResponse response){
			String clueNum=request.getParameter("clueNumber");
			if(clueNum==null){
				return new Object[0];
			}
			int clueNum1=Integer.parseInt(clueNum);//获得查询关键词的个数
			Object[] objects=new Object[clueNum1*2];
			for(int j=0;j<clueNum1*2;j++){
				objects[j]=0;
			}//初始化
			for(int i=0;i<clueNum1;i++){
				objects[2*i]=request.getParameter("clue"+(i+1));
//				if("Date".equals(request.getParameter("clueType"+(i+1)))){
//					try {
//						objects[2*i+1]=new SimpleDateFormat("yy-MM-dd hh:mm:ss").parse(request.getParameter("clueVal"+(i+1)));
//					} catch (ParseException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}else if("Integer".equals(request.getParameter("clueType"+(i+1)))){
//					objects[2*i+1]=Integer.parseInt(request.getParameter("clueVal"+(i+1)));
//				}else if("Float".equals(request.getParameter("clueType"+(i+1)))){
//					objects[2*i+1]=Float.parseFloat(request.getParameter("clueVal"+(i+1)));
//				}else{
//					objects[2*i+1]=request.getParameter("clueVal"+(i+1));
//				}
				
				objects[2*i+1]=request.getParameter("clueValue"+(i+1));
			}
			return objects;
		}
		
		public void internalError(HttpServletResponse response){
			try {
				response.sendRedirect("pages/general/error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
