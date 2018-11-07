<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
EasyBuy_User loginUser=(EasyBuy_User)request.getSession().getAttribute("login");
if(loginUser==null){
	response.sendRedirect(basePath+"pages/general/login.jsp");
}else{
	pageContext.setAttribute("loginUser", loginUser);
}
%>

<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html class="no-js" lang="">
    <head>
    	<base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>User-Console|| Synix Mall</title>
        <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Fonts
		============================================ -->
		<link href='http://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <!-- Favicon
		============================================ -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">        
		<!-- CSS  -->
		
		<!-- Bootstrap CSS
		============================================ -->      
        <link rel="stylesheet" href="css/bootstrap.min.css">
        
		<!-- owl.carousel CSS
		============================================ -->      
        <link rel="stylesheet" href="css/owl.carousel.css">
        
		<!-- owl.theme CSS
		============================================ -->      
        <link rel="stylesheet" href="css/owl.theme.css">
        
		<!-- owl.transitions CSS
		============================================ -->      
        <link rel="stylesheet" href="css/owl.transitions.css">
        
		<!-- font-awesome.min CSS
		============================================ -->      
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <!-- animate CSS
		============================================ -->         
        <link rel="stylesheet" href="css/animate.css">
        
		<!-- nivo slider CSS
		============================================ -->
		<link rel="stylesheet" href="lib/nivo-slider/css/nivo-slider.css" type="text/css" />
		<link rel="stylesheet" href="lib/nivo-slider/css/preview.css" type="text/css" media="screen" />
        
        <!-- normalize CSS
		============================================ -->        
        <link rel="stylesheet" href="css/normalize.css">
        
        <!-- main CSS
		============================================ -->          
        <link rel="stylesheet" href="css/main.css">
        
        <!-- UI CSS
		============================================ -->          
        <link rel="stylesheet" href="css/jquery-ui.css">
        
        <!-- BX Slider CSS
		============================================ -->          
        <link rel="stylesheet" href="css/jquery.bxslider.css">
        
        <!-- Meanmenu CSS
		============================================ -->          
        <link rel="stylesheet" href="css/meanmenu.min.css">
        
        <!-- style CSS
		============================================ -->          
        <link rel="stylesheet" href="css/style.css">
        
        <!-- responsive CSS
		============================================ -->          
        <link rel="stylesheet" href="css/responsive.css">
        
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--Header Area Start-->
        <%@ include file="../console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="../console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Wishlist Area Start-->
        <div class="wishlist-concept">
			<div class="container">
				<div class="row">
					<%@ include file="asidebar.jsp" %>
					<div class="col-sm-12 col-lg-9 col-md-9">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="s-title">
                                    <h1>User Information</h1>
                                </div>
                            </div>
                        </div>
						<div class="table-responsive">
							<table class="cart-table">
								<thead>
									<tr>
										<th></th>
										<th>Personal Information</th>
										<th>Operation</th>
										<th></th>
									</tr>
								</thead>
								<form id="infoForm">
								<input type="hidden" name="opr" value="modify">
								<input type="hidden" name="id" value="${pageScope.loginUser.id}">
								<input type="hidden" name="type" value="${pageScope.loginUser.type}">
								<tbody id="infoTable">
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">User Name</a>
										</td>
										<td>
											<input type="text" name="userName" value="${pageScope.loginUser.userName}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Real Name</a>
										</td>
										<td>
											<input type="text" name="realName" value="${pageScope.loginUser.realName}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Password</a>
										</td>
										<td>
											<input type="password" name="password" value="${pageScope.loginUser.password}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Sex</a>
										</td>
										<td>
											<c:if test="${pageScope.loginUser.sex == 1}"><input type="radio" value="1" name="sex" checked readonly><span>男</span><span>&nbsp;&nbsp;</span><input type="radio" value="0" name="sex" readonly><span>女</span></c:if>
											<c:if test="${pageScope.loginUser.sex == 0}"><input type="radio" value="1" name="sex" readonly ><span>男</span><span>&nbsp;&nbsp;</span><input type="radio" value="0" name="sex" checked readonly><span>女</span></c:if>
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;" >Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Identity Code</a>
										</td>
										<td>
											<input type="text" name="identityCode" value="${pageScope.loginUser.identityCode}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Email</a>
										</td>
										<td>
											<input type="text" name="email" value="${pageScope.loginUser.email}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Phone</a>
										</td>
										<td>
											<input type="text" name="mobile" value="${pageScope.loginUser.mobile}" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									<tr>
										<td>
											<a href="javascript:;" class="tb-img">Address</a>
										</td>
										<td>
											<input type="text" name="address" value="${pageScope.loginUser.address }" readonly style="width:400px;">
										</td>
										<td class="text-center">
											<a class="edit editable" href="javascript:;">Edit</a>
										</td>
										<td><a class="remove" href="javascript:;"><i class="fa fa-columns"></i></a></td>
									</tr>
									
								</tbody>
								</form>
							</table>
						</div>
                        <div class="all-cart-buttons">
                            <a href="javascript:;" id="updateInfoBtn">Update Information</a>
                        </div>
						<div class="back-button">
							<a href="pages/general/index.jsp"><small>« </small> Back</a>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!--End of Wishlist Area-->
        <!--Brand Area Start-->
        <%@ include file="../console_elements/brand-area.jsp" %>
        <!--End of Brand Area-->        
        <!--Footer Widget Area Start-->
        <%@ include file="../console_elements/footer-widget-area.jsp" %>
        <!--End of Footer Widget Area-->
        <!--Footer Area Start-->
        <%@ include file="../console_elements/footer.jsp" %>
        <!--End of Footer Area-->
        
        <!-- jquery-1.11.3.min js
		============================================ -->         
        <script src="js/vendor/jquery-1.11.3.min.js"></script>
        
        <!-- bootstrap js
		============================================ -->         
        <script src="js/bootstrap.min.js"></script>
        
        <!-- owl.carousel.min js
		============================================ -->       
        <script src="js/owl.carousel.min.js"></script>
        
        <!-- nivo slider js
		============================================ -->       
		<script src="lib/nivo-slider/js/jquery.nivo.slider.js" type="text/javascript"></script>
		<script src="lib/nivo-slider/home.js" type="text/javascript"></script>
        
        <!-- wow js
		============================================ -->       
        <script src="js/wow.js"></script> 
        <script>
			new WOW().init();
		</script>  
            
        <!-- Price Slider js
		============================================ -->       
        <script src="js/price-slider.js"></script>        
        
        <!-- BX Slider js
		============================================ -->       
        <script src="js/jquery.bxslider.min.js"></script>
        
        <!--Countdown js-->
        <script src="js/jquery.countdown.min.js"></script>
        
        <!-- Scroll Up js
		============================================ -->         
        <script src="js/jquery.scrollUp.min.js"></script>        
        
        <!-- Elevate Zoom js
		============================================ -->         
        <script src="js/jquery.elevatezoom.js"></script>    
        
        <!-- Meanmenu js
		============================================ -->         
        <script src="js/meanmenu.js"></script>    
        
        <!-- plugins js
		============================================ -->         
        <script src="js/plugins.js"></script>
        
        <!-- main js
		============================================ -->           
        <script src="js/main.js"></script>
        
        
         <!-- shopcart -->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        <script type="text/javascript" src="js/self/general/shopcart-button.js"></script>
        
        <script type="text/javascript" src="js/self/general/user-info.js">
        <!-- specific -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		initUpperShopcart();
        	});
        </script>
    </body>
</html>
