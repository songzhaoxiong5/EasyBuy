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
        <title>Checkout || SynixMall</title>
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
        
        <!-- hintbox CSS
		============================================ -->          
        <link rel="stylesheet" href="css/self/hintbox.css">
        
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body class="checkout">
        <!--Header Area Start-->
        <%@ include file="console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Checkout Area Start-->
        <section class="checkout-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="s-title">
                            <h1>Checkout</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-9 col-md-9">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#billing">
                                            1. BILLING INFORMATION
                                        </a>
                                    </h4>
                                </div>
                                <div id="billing" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <div class="login-form">
                                            <form action="#">
                                                <div class="customer-name">
                                                    <div class="first-name">
                                                        <p>First Name<span>*</span></p>
                                                        <input type="text" readonly value="${pageScope.loginUser.realName}">
                                                    </div>
                                                    <div class="middle-name">
                                                        <p>Middle Name/Initial</p>
                                                        <input type="text"  readonly value="${pageScope.loginUser.realName}">
                                                    </div>
                                                    <div class="last-name">
                                                        <p>Last Name<span>*</span></p>
                                                        <input type="text" readonly value="${pageScope.loginUser.realName}">
                                                    </div>
                                                </div>
                                                <div class="customer-info">
                                                    <div class="company-name">
                                                        <p>Company</p>
                                                        <input type="text" disabled>
                                                    </div>
                                                    <div class="email-address">
                                                        <p>Email Adress<span>*</span></p>
                                                        <input type="email" readonly value="${pageScope.loginUser.email}">
                                                    </div>
                                                </div>
                                                <p>Address<span>*</span></p>
                                                <input type="text" readonly value="${! empty pageScope.loginUser.address ? pageScope.loginUser.address : ""}">
                                                <input type="text">
                                                <div class="city-country">
                                                    <div class="city">
                                                        <p>City<span>*</span></p>
                                                        <input type="text" disabled>
                                                    </div>
                                                    <div class="state">
                                                        <p>State/Province</p>
                                                        <select class="country" disabled>
                                                            <option value="state">Please select region, state or province</option>
                                                            <option value="indo">Bahasa Indonesia</option>
                                                            <option value="melyu">Bahasa Melayu</option>		
                                                            <option value="deutsch">Deutsch (Deutschland)</option>		
                                                            <option value="austra">English (Australia)</option>		
                                                            <option value="canada">English (Canada)</option>		
                                                            <option value="india">English (India)</option>		
                                                            <option value="ireland">English (Ireland)</option>		
                                                            <option value="maktoob">English (Maktoob)</option>		
                                                            <option value="malaysia">English (Malaysia)</option>		
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="city-country">
                                                    <div class="city">
                                                        <p>Zip/Postal Code<span>*</span></p>
                                                        <input type="text"  disabled>
                                                    </div>
                                                    <div class="state">
                                                        <p>Country<span>*</span></p>
                                                        <select class="country" disabled>
                                                            <option value="AF">Afghanistan</option>
                                                            <option value="AU">Australia</option>		
                                                            <option value="BH">Bahrain</option>		
                                                            <option value="BD">Bangladesh</option>		
                                                            <option value="CA">Canada</option>		
                                                            <option value="DK">Denmark</option>		
                                                            <option value="EG">Egypt</option>		
                                                            <option value="FR">France</option>		
                                                            <option value="GB">United Kingdom</option>		
                                                            <option selected="selected" value="US">United States</option>		
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="customer-info">
                                                    <div class="telephone">
                                                        <p>Telephone<span>*</span></p>
                                                        <input type="text" readonly value="${pageScope.loginUser.mobile}">
                                                    </div>
                                                    <div class="fax">
                                                        <p>Fax</p>
                                                        <input type="text" disabled>
                                                    </div>
                                                </div>
                                                <div class="ship-wrap">
                                                    <div class="ship-address">
                                                        <input type="radio" name="check" value="guest" disabled>
                                                        <span>Ship to this address</span>
                                                    </div>
                                                     <div class="ship-address">
                                                        <input type="radio" name="check" value="user" checked="checked" readonly>
                                                        <span>Ship to different address</span>
                                                    </div>
                                                </div>
                                                <a href="pages/general/user_console/user_info.jsp" class="login-btn">Continue</a>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#shipping">
                                            2. SHIPPING INFORMATION
                                        </a>
                                    </h4>
                                </div>
                                <div id="shipping" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        We do not ship internationally.<br>

                                        If you would like to use an international credit card to ship within the United States, please call Customer Care at 1-855-233-3120 during normal business hours to complete your transaction.<br>

                                        ASICS America restricts shipments to international re-shippers or businesses that forward packages to international addresses, commonly referred to as freight forwarders. For customers in countries outside the United States, please contact the local ASICS subsidiary or an authorized ASICS distributor.
                                    </div>
                                </div>
                            </div>
                            
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFive">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#payment-info">
                                            3. PAYMENT INFORMATION
                                        </a>
                                    </h4>
                                </div>
                                <div id="payment-info" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <div class="ship-method payment">
                                            <div class="ship-wrap">
                                                <div class="ship-address">
                                                    <input type="radio" name="check" value="check" disabled>
                                                    <span>Check / Money order </span>
                                                </div>
                                                 <div class="ship-address">
                                                    <input type="radio" name="check" value="credit" disabled>
                                                    <span>Credit Card (saved) </span>
                                                </div>
                                            </div>
                                            <div class="ship-btn">
                                                <a href="javascript:;" class="back-btn"><i class="fa fa-long-arrow-up"></i>Back</a>
                                                <a href="javascript:;" class="login-btn">Continue</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingSix">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#order-review">
                                            4. ORDER REVIEW
                                        </a>
                                    </h4>
                                </div>
                                <div id="order-review" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <form action="#">
                                            <div class="checkout-table table-responsive">
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <th class="p-name">Product Name</th>
                                                            <th class="p-amount">Price</th>
                                                            <th class="p-amount">Qty</th>
                                                            <th class="p-total">SubTotal</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <td colspan="3" class="text-right">Grand Total</td>
                                                            <td class="p-total" id="orderReviewTotal">£318.84</td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                                <div class="checkout-buttons">
                                                    <p>Forgot an Item? <a href="pages/general/cart.jsp">Edit Your Cart</a></p>
                                                    <a class="login-btn" href="javascript:;" id="placeOrderBtn">Place Order</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="checkout-progress">
                            <div class="check-title">
                                <h3>Checkout Progress</h3>
                            </div>
                            <ul class="check">
                                <li><a href="#"><i class="fa fa-angle-right"></i>Billing address</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>Shipping address</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>shipping method</a></li>
                                <li><a href="#"><i class="fa fa-angle-right"></i>payment method</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Checkout Area-->
        <!--Brand Area Start-->
        <%@ include file="console_elements/brand-area.jsp" %>
        <!--End of Brand Area-->        
        <!--Footer Widget Area Start-->
        <%@ include file="console_elements/footer-widget-area.jsp" %>
        <!--End of Footer Widget Area-->
        <!--Footer Area Start-->
        <%@ include file="console_elements/footer.jsp" %>
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
        
        <!-- util js -->
        <script type="text/javascript" src="js/self/common/util.js"></script>
        
        <!-- shopcart -->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        <script type="text/javascript" src="js/self/general/shopcart-button.js"></script>
        <script type="text/javascript" src="js/self/general/checkout.js"></script>
        
        <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        <!-- specific-->
        <script type="text/javascript">
        	initUpperShopcart();
        	initOrderReview();
        </script>
    </body>
</html>


