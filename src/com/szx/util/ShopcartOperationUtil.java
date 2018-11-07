package com.szx.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.szx.bean.EasyBuy_Order;
import com.szx.bean.EasyBuy_OrderDetail;
import com.szx.bean.EasyBuy_Product;
import com.szx.bean.EasyBuy_User;
import com.szx.controller.common.ShopcartControlServlet;
import com.szx.service.impl.OrderDetailServiceImpl;
import com.szx.service.impl.OrderServiceImpl;
import com.szx.service.impl.ProductServiceImpl;

public class ShopcartOperationUtil extends HttpServlet {
	
	private Logger logger=Logger.getLogger(ShopcartOperationUtil.class);
	private Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	private static ProductServiceImpl productService=new ProductServiceImpl();
	private static OrderServiceImpl orderService=new OrderServiceImpl();
	private static OrderDetailServiceImpl detailService=new OrderDetailServiceImpl();
	private static String cartNameRegx="^cartId[1-9]\\d*$";
	private static String cartValueRegx="^[1-9]\\d*$";
	
	
	//拿到所有当前的购物车信息！以JSON的格式输出！
		public void getShopCartInfo(HttpServletRequest request, HttpServletResponse response, boolean isLogin){
				//如果用户未登录，购物车信息是一个封装类
				PrintWriter out=null;
				try {
					out=response.getWriter();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(!isLogin){
					List<ShopcartUtil> shopcartList=new ArrayList<ShopcartUtil>();
					Cookie[] cookies=request.getCookies();
					if(cookies!=null){
						for(int i=0;i<cookies.length;i++){
							if(cookies[i].getName().matches(cartNameRegx)&&cookies[i].getValue().matches(cartValueRegx)){
								for(int j=0;j<cookies.length;j++){
									if(("cartQuantity"+cookies[i].getName().substring(6)).equals(cookies[j].getName())){
										if(cookies[j].getValue().matches(cartValueRegx)){
											Integer cartId=Integer.parseInt(cookies[i].getValue());
											Integer cartQuantity=Integer.parseInt(cookies[j].getValue());
											ShopcartUtil util=new ShopcartUtil(cartId,cartQuantity);
											if(util.getImg()!=null){//这一句判断是否装载成功！
												shopcartList.add(util);
											}
										}
									}
								}
							}
						}
					}
					//Gson输出操作
					String json=gson.toJson(shopcartList);
					logger.debug("输出的非登陆用户的购物车信息为："+json);
					out.print(json);
					out.flush();
					out.close();
				}else{//如果用户登录了,购物车信息是一个order对象
					EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
					Integer userId=loginUser.getId();
					List<EasyBuy_Order> orderList=orderService.selectAll("userId",userId,"status",6);
					OrderUtil2 orderUtil2=new OrderUtil2(orderList);
					String json=gson.toJson(orderUtil2);
					logger.debug("输出的登录用户的购物车信息为："+json);
					out.print(json);
					out.flush();
					out.close();
					//Gson输出操作
				}
			
		}
		
		//一次性只增加cartQuantity数量的方法！cartQuantity是增加的量
		public int addShopCart(HttpServletRequest request, HttpServletResponse response, Integer cartId,Integer cartQuantity,boolean isLogin){
					//如果用户没有登录！有cookie的话加1，没有的话设置为1！
			if(!isLogin){
				Cookie[] resultCookies=searchInCart(request,response,cartId);
				if(resultCookies!=null){//当前有该商品
					resultCookies[1].setValue((new Integer(Integer.parseInt(resultCookies[1].getValue())+cartQuantity)).toString());
					resultCookies[1].setMaxAge(60*60*24*7);
					response.addCookie(resultCookies[1]);
				}else{//当前没有该商品
					int currentPosition=this.currentShopcartPosition(request, response);//选择可以插入的新位置
					Cookie cookie1=new Cookie("cartId"+(currentPosition+1),cartId.toString());
					Cookie cookie2=new Cookie("cartQuantity"+(currentPosition+1),cartQuantity.toString());
					cookie1.setMaxAge(60*60*24*7);
					cookie2.setMaxAge(60*60*24*7);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
				}
				return 1;
			}else{//如果有用户登录！
				EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
				Integer userId=loginUser.getId();
				List<EasyBuy_Order> orderList=orderService.selectAll("userId",userId,"status",6);
				EasyBuy_Order orderForCart=null;
				EasyBuy_Product productToAdd=null;
				//如果有购物车！，判断购物车中是否有这件商品
				if(orderList.size()!=0){//有购物车订单
					orderForCart=orderList.get(0);
					Integer orderId=orderForCart.getId();
					List<EasyBuy_OrderDetail> orderDetailList=detailService.selectAll("orderId",orderId,"productId",cartId);
					if(orderDetailList.size()!=0){//有购物车订单且购物车订单中有该商品
						EasyBuy_OrderDetail orderDetail=orderDetailList.get(0);//取出该订单详情
						orderDetail.setQuantity(orderDetail.getQuantity()+cartQuantity);
						int result1=detailService.update(orderDetail);//修改数据库！
						if(result1<=0){
							return -83;
						}
					}else{//有订单但是没有该商品，增加该商品详情！
						EasyBuy_OrderDetail newDetail=new EasyBuy_OrderDetail();
						newDetail.setProductId(cartId);
						newDetail.setQuantity(cartQuantity);
						productToAdd=productService.selectOne("id",cartId);
						newDetail.setOrderId(orderId);
						newDetail.setCost(productToAdd.getPrice()*cartQuantity);
						int result2=detailService.add(newDetail);//修改数据库！
						if(result2<=0){
							return -83;
						}
					}
				}else{//没有购物车订单！用两步式订单生成法进行订单生成！
					EasyBuy_Order newOrder=new EasyBuy_Order();
					Date date=new Date();
					long serialNumber1=date.getTime();//生成订单号用系统时间进行生成，这里具体开发可以加上ip等区别信息提高安全性
					String serialNumber=new Long(serialNumber1).toString();
					newOrder.setSerialNumber(serialNumber);//订单号
					newOrder.setStatus(6);//购物车订单
					newOrder.setType(1);//普通用户订单
					newOrder.setUserAddress(loginUser.getAddress());
					newOrder.setUserId(loginUser.getId());
					newOrder.setUserName(loginUser.getUserName());
					newOrder.setCost(new Float(0));//新订单的初始价格一定为0
					int result3=orderService.add(newOrder);//新增订单
					if(result3<=0){
						return -83;
					}
					EasyBuy_Order addedOrder=orderService.selectOne("serialNumber",serialNumber);
					if(addedOrder!=null){
						int orderId=addedOrder.getId();
						EasyBuy_OrderDetail newDetail=new EasyBuy_OrderDetail();
						productToAdd=productService.selectOne("id",cartId);
						if(productToAdd!=null){
							newDetail.setCost(productToAdd.getPrice()*cartQuantity);
							newDetail.setOrderId(orderId);
							newDetail.setProductId(cartId);
							newDetail.setQuantity(cartQuantity);//设定数量
							int result4=detailService.add(newDetail);
							if(result4<=0){
								orderService.deleteById(orderId);//回滚删除前生成的订单！
								return -84;
							}
						}
						
					}
					
				}
				return 1;
			}
			
		}
		//一次性删除购物车中某个商品固定数量，其中cartQuantity是这个固定的数量
		public int deleteShopcartByStep(HttpServletRequest request, HttpServletResponse response, Integer cartId,Integer cartQuantity,boolean isLogin){
			if(!isLogin){
				Cookie[] resultCookies=searchInCart(request,response,cartId);
				if(resultCookies!=null){//当前有该商品
					//如果删除该大小后数量小于或者的等于0
					if(Integer.parseInt(resultCookies[1].getValue())<=cartQuantity){
						resultCookies[1].setMaxAge(0);
						response.addCookie(resultCookies[1]);//删除cookies
					}else{
						resultCookies[1].setValue((new Integer(Integer.parseInt(resultCookies[1].getValue())-cartQuantity)).toString());
						resultCookies[1].setMaxAge(60*60*24*7);
						response.addCookie(resultCookies[1]);
					}
				}
				return 1;
			}else{//如果有用户登录！
				EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
				Integer userId=loginUser.getId();
				List<EasyBuy_Order> orderList=orderService.selectAll("userId",userId,"status",6);
				EasyBuy_Order orderForCart=null;
				//如果有购物车！，判断购物车中是否有这件商品
				if(orderList.size()!=0){//有购物车订单
					orderForCart=orderList.get(0);
					Integer orderId=orderForCart.getId();
					List<EasyBuy_OrderDetail> orderDetailList=detailService.selectAll("orderId",orderId,"productId",cartId);
					if(orderDetailList.size()>0){//有购物车订单且购物车订单中有该商品
						EasyBuy_OrderDetail orderDetail=orderDetailList.get(0);//取出该订单详情
						if(orderDetail.getQuantity()<=cartQuantity){
							int result1=detailService.deleteById(orderDetail.getId());
							if(result1<=0){
								return -85;
							}else{
								return result1;
							}
						}else{
							orderDetail.setQuantity(orderDetail.getQuantity()-cartQuantity);
							int result1=detailService.update(orderDetail);//修改数据库！
							if(result1<=0){
								return -81;
							}
						}
						
					}
				}
				return 1;
			}
		}
		
		
		//一次性删除购物车中某个商品的方法
		public int deleteShopcart(HttpServletRequest request, HttpServletResponse response,Integer cartId,boolean isLogin){
			//分情况讨论用户是否登录的情况
			if(!isLogin){//用户没有登录的情况
				Cookie[] cookies=request.getCookies();
				for(int i=0;i<cookies.length;i++){
					if(cookies[i].getName().matches(cartNameRegx)&&(cookies[i].getValue().equals(cartId.toString()))){
						boolean flag=false;//标识是否已经删除了cookie[i]...
						for(int j=0;j<cookies.length;j++){
							if(("cartQuantity"+cookies[i].getName().substring(6)).equals(cookies[j].getName())&&cookies[j].getValue().matches(cartValueRegx)){
								cookies[i].setMaxAge(0);
								cookies[j].setMaxAge(0);
								response.addCookie(cookies[i]);//删除了对应的cookie对象
								response.addCookie(cookies[j]);//删除了对应的cookie对象
								flag=true;
							}
						}
						if(!flag){
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
						
					}
				}
				return 1;
			}else{//用户登录以后的情形！
				EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
				EasyBuy_Order cartOrder=orderService.selectOne("userId",loginUser.getId(),"status",6);
				if(cartOrder!=null){
					EasyBuy_OrderDetail detailToBeDeleted=detailService.selectOne("orderId",cartOrder.getId(),"productId",cartId);
					if(detailToBeDeleted!=null){
						int result1=detailService.deleteById(detailToBeDeleted.getId());
						if(result1<=0){
							return -85;
						}
					}
					
				}
			}
			return 1;
		}
		
		//清空购物车的方法！
		public int clearShopcart(HttpServletRequest request, HttpServletResponse response,boolean isLogin){
			//分情况讨论用户是否登录
			if(!isLogin){//当用户没有进行登录时
				Cookie[] cookies=request.getCookies();
				for(int i=0;i<cookies.length;i++){
					if((cookies[i].getName().matches(cartNameRegx))||(cookies[i].getName().matches("^cartQuantity[1-9]\\d*$"))){
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
				return 1;
			}else{//当用户登录时
				EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
				List<EasyBuy_Order> cartOrderList=orderService.selectAll("userId",loginUser.getId(),"status",6);
				if(cartOrderList.size()!=0){
					int result1=orderService.deleteById(cartOrderList.get(0).getId());//orderDetail也将被一并删除
					if(result1<=0){
						return -86;
					}
				}
			}
			return 1;
		}
		
		//重置购物车的方法，与前台表单配合的方法，读取request中的相关字段然后赋值
		public int updateShopCart(HttpServletRequest request, HttpServletResponse response, Integer cartId, Integer cartQuantity, boolean isLogin){
			if(!isLogin){//对于游客
				Cookie[] targets=this.searchInCart(request, response, cartId);
				if(targets!=null){
					targets[1].setValue(cartQuantity.toString());
					targets[1].setMaxAge(60*60*24*7);
					response.addCookie(targets[1]);
				}else{
					this.addShopCart(request, response, cartId, cartQuantity, false);
				}
				return 1;
			}else{//对于登录用户
				int result1=this.deleteShopcart(request, response, cartId, true);//删除原来的
				if(result1<=0){
					return -87;
				}else{
					int result2=this.addShopCart(request, response, cartId, cartQuantity, true);
					if(result2<=0){
						return -88;
					}else{
						return 1;
					}
				}
				
			}
		}
		
		
		
		
		
		public int currentShopcartPosition(HttpServletRequest request, HttpServletResponse response){
			int currentPosition=0;
			Cookie[] cookies=request.getCookies();
			if(cookies!=null){
					for(int i=0;i<cookies.length;i++){
						if(cookies[i].getName().matches(cartNameRegx)&&cookies[i].getValue().matches(cartValueRegx)){
							for(int j=0;j<cookies.length;j++){
								if(("cartQuantity"+cookies[i].getName().substring(6)).equals(cookies[j].getName())&&cookies[j].getValue().matches(cartValueRegx)){
									int position=Integer.parseInt(cookies[i].getName().substring(6));
									if(position>currentPosition){
										currentPosition=position;//最大的位置！
									}
								}
							}
						}
					}
					return currentPosition;
			}else{
				return 0;
			}
		}
		
		public Cookie[] searchInCart(HttpServletRequest request, HttpServletResponse response,int cartId){
			Cookie[] cookies=request.getCookies();
			Cookie[] resultCookies=null;
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().matches(cartNameRegx)&&cookies[i].getValue().equals(new Integer(cartId).toString())){
					for(int j=0;j<cookies.length;j++){
						if(("cartQuantity"+cookies[i].getName().substring(6)).equals(cookies[j].getName())&&cookies[j].getValue().matches(cartValueRegx)){
							resultCookies=new Cookie[]{cookies[i],cookies[j]};
						}
					}
				}
			}
			return resultCookies;
		}
		
		public void showMessage(PrintWriter out,int result){
			if(result>0){
				out.print("{\"success\":\"yes\"}");
			}else{
				out.print("{\"error\":\"Shopcart Operation Error! Error Code:"+result+"\"}");
			}
		}
		
		//这个方法是当用户登录时，将用户未登录时的购物车保存在登录用户购物车数据库中
		public int transformShopCart(HttpServletRequest request, HttpServletResponse response){
			List<ShopcartUtil> list=new ArrayList<>();
			list=this.getCartCookieList(request, response);
			int result=1;
			if(list.size()>0){
				for(int i=0;i<list.size();i++){
					result=this.addShopCart(request, response, list.get(i).getCartId(), list.get(i).getCartQuantity(),true);
					if(result<=0){
						return -89;
					}
				}
				this.clearShopcart(request, response, false);//清除cookie中的购物车信息！
			}
			return result;
		}
		
		
		private List<ShopcartUtil> getCartCookieList(HttpServletRequest request, HttpServletResponse response){
			Cookie[] cookies=request.getCookies();
			List<ShopcartUtil> list=new ArrayList<>();
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().matches(cartNameRegx)&&cookies[i].getValue().matches(cartValueRegx)){
						for(int j=0;j<cookies.length;j++){
							if(("cartQuantity"+cookies[i].getName().substring(6)).equals(cookies[j].getName())&&cookies[j].getValue().matches(cartValueRegx)){
									Integer cartId=Integer.parseInt(cookies[i].getValue());
									Integer cartQuantity=Integer.parseInt(cookies[j].getValue());
									ShopcartUtil shopcartUtil=new ShopcartUtil(cartId,cartQuantity);
									list.add(shopcartUtil);
							}
						}
					
					
				}
			}
			return list;
		}
}
