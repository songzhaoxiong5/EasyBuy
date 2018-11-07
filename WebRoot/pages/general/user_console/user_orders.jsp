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
                                    <h1>User Orders</h1>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" value="${pageScope.loginUser.id}" name="id" id="userInfo">
						<div class="table-responsive" id="mainContainerForOrders">
							<table class="cart-table">
								<thead>
								<tr>
                                        <th class="p-name">Order Number:<span>1</span></th>
                                        <th class="p-name">Create Time:<span>123</span></th>
                                        <th class="p-amount">Status:<span>1</span></th>
                                        <th class="p-total">Cost:<span>1</span></th>
                                 </tr>
								</thead>
								<thead>
                                    <tr>
                                        <th class="p-name">Product Name</th>
                                        <th class="p-amount">Price</th>
                                        <th class="p-amount">Quantity</th>
                                        <th class="p-total">SubTotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                </tbody>
							</table>
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
        <!-- util.js -->
        <script src="js/self/common/util.js"></script>
         <!-- shopcart -->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        <script type="text/javascript" src="js/self/general/shopcart-button.js"></script>
        
        <script type="text/javascript" src="js/self/general/user_orders.js"></script>
        <!-- specific -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		initUpperShopcart();
        		initUserOrders();
        	});
        </script>
    </body>
</html>

