<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        <title>Shopping Cart || Stepre</title>
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
    <body>
        <!--Header Area Start-->
        <%@ include file="console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Cart Main Area Start-->
        <section class="cart-main-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="s-title">
                            <h1>Shopping Cart</h1>
                        </div>
                        <form action="ordercontorl?opr=checkIdentity">
                            <div class="cart-table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="p-times">Remove</th>
                                            <th class="p-image">Images</th>
                                            <th class="p-name">Product Name</th>
                                            <th class="p-edit">Edit</th>
                                            <th class="p-amount">Unit Price</th>
                                            <th class="p-quantity">Qty</th>
                                            <th class="p-total">SubTotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <div class="all-cart-buttons">
                                    <a href="pages/general/shop-grid.jsp">Continue Shopping</a>
                                    <div class="float-right">
                                        <a href="javascript:;" id="updateBtn">Update Shopping Cart </a>
                                        <a href="javascript:;" id="clearBtn">Clear Shopping Cart </a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="shipping-discount">
                                        <div class="shipping-title">
                                            <h3>Estimate Shipping And Tax</h3>
                                        </div>
                                        <p>Enter your destination to get shipping &amp; tax</p>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-6">
                                                <div class="level">
                                                    Country <span class="required" title="required">*</span>
                                                </div>
                                                <div class=" shipping-wrapper">
                                                  <select class="country">
                                                    <option value="state">Select options</option>
                                                    <option value="state">Bahasa Indonesia</option>
                                                    <option value="state">Bahasa Melayu</option>		
                                                    <option value="state">Deutsch (Deutschland)</option>		
                                                    <option value="state">English (Australia)</option>		
                                                    <option value="state">English (Canada)</option>		
                                                    <option value="state">English (India)</option>		
                                                    <option value="state">English (Ireland)</option>		
                                                    <option value="state">English (Maktoob)</option>		
                                                    <option value="state">English (Malaysia)</option>		
                                                  </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-6">
                                                <div class="level">
                                                    State/Province
                                                </div>
                                                <div class=" shipping-wrapper">
                                                  <select class="country">
                                                    <option value="state">Select options</option>
                                                    <option value="state">South Carolina</option>
                                                    <option value="state">South Dakota</option>
                                                    <option value="state">Tennessee</option>		
                                                    <option value="state">Texas</option>		
                                                    <option value="state">Utah</option>		
                                                    <option value="state">Vermont</option>		
                                                    <option value="state">Virginia</option>		
                                                    <option value="state">Washington</option>		
                                                    <option value="state">West Virginia</option>		
                                                    <option value="state">Wyoming</option>		
                                                  </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <div class="postal-code">
                                                    <div class="level">
                                                        Zip / Postal Code 
                                                    </div>
                                                    <input type="text" placeholder="">
                                                </div>
                                                <input type="submit" value="Get a Quote" name="#" class="button first">
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="shipping-discount">
                                        <div class="shipping-title">
                                            <h3>Discount Code</h3>
                                        </div>
                                        <p>Enter your coupon code if you have one</p>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <div class="postal-code">
                                                    <input type="text" placeholder="">
                                                </div>
                                                <input type="submit" value="Apply Coupon" name="#" class="button second">
                                            </div>
                                        </div>    
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="amount-totals">
                                        <p class="total">Grandtotal: <span id="totalAmount">$313.74</span></p>
                                        <input type="button" value="PROCCED TO CHECKOUT" name="#" class="button" id="checkoutBtn">
                                        <p class="multi-add">Checkout with multiples address</p>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Cart Main Area-->
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
       	<script type="text/javascript" src="js/self/general/shopcart.js"></script>
        
        <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        
        <!-- specific-->
        <script type="text/javascript">
        	initUpperShopcart();
        	initShopcart();//初始化购物车
        	$("#checkoutBtn").click(function(){
        		location.href="ordercontrol?opr=checkIdentity";
        	});
        </script>
    </body>
</html>

