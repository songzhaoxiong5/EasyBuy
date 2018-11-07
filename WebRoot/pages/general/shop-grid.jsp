<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);

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
        <title>SynixMall || Product Page</title>
        <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 
        <meta name="description" content="SynixMall Product Page">
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
    <body class="product-grid">
        <!--Header Area Start-->
        <%@ include file="console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Breadcrumbs Start-->
        <div class="breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-md-offset-3">
                        <ul class="breadcrumb">
                            <li><a href="pages/general/index.jsp"><i class="fa fa-home"></i>Home</a></li>
                            <li class="active" type="" currentId="" id="currentCategory">Welcome!</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Breadcrumbs-->
        <!--Category Service Area Start-->
        <section class="cat-service-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="cat-menu">
                            <ul id="category">
                                <li class="cat-title"><a href="#">Categories</a></li>
                            </ul>
                        </div>
                        <div class="p-widget-title top-title">
                            <div class="left-sidebar-title"><h3>Shop by</h3></div>
                        </div>
                        <aside class="widget-price">
                            <h3 class="sidebar-sub-title">Price Slider</h3>
                            <div class="price_filter">
                                <div id="slider-range"></div>
                                <div class="price_slider_amount">
                                    <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                </div>
                            </div>	
                            <a href="#">Show</a>
                        </aside>
                        <aside class="widget-list">
                            <h3 class="sidebar-sub-title">Fast Filter</h3>
                            <ul id="product-list">
                                <li><a href="#">Ellectronic</a></li>
                                <li><a href="#">Fashion &amp; Beauty</a></li>
                                <li><a href="#">SmartPhone &amp; Tablets</a></li>
                                <li><a href="#">Sports &amp; Outdoors</a></li>
                                <li><a href="#">Automotive &amp; Motorcyle</a></li>
                                <li><a href="#">Jewery &amp; Watches</a></li>
                            </ul>
                        </aside>
                        <div class="p-widget-title compare">
                            <div class="left-sidebar-title"><h3>Compare Products</h3></div>
                        </div>
                        <aside><p>You have no item(s) to compare</p></aside>
                        <aside class="widget widget-tags">
                            <h3 class="sidebar-title"><span>Popular Tags</span></h3>
                            <ul>
                                <li><a href="#" class="medium">Apple (Macbook)</a></li>
                                <li><a href="#">Dell</a></li>
                                <li><a href="#" class="x-large">Acer</a></li>
                                <li><a href="#" class="large">HP</a></li>
                                <li><a href="#" class="m-large">Levono</a></li>
                                <li><a href="#" class="large">laptop</a></li>
                                <li><a href="#" class="ex-large">Sony</a></li>
                                <li><a href="#" class="sml">Nokia Lumia 630</a></li>
                            </ul>
                            <a class="n-a-btn" href="#">View All Tags</a>
                        </aside>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12" id="productsArea">
                        <div class="cat-service-banner">
                            <a href="#">
                                <img src="img/banner/banner-29.jpg" alt="">
                            </a>
                        </div>
                        <div class="shop-item-filter">
                            <div class="shop-tab clearfix">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs navbar-left" role="tablist">
                                    <li role="presentation" class="active"><a href="#grid" class="grid-view" aria-controls="grid" role="tab" data-toggle="tab" id="gridBtn"></a></li>
                                    <li role="presentation"><a href="#list" class="list-view" aria-controls="list" role="tab" data-toggle="tab" id="listBtn"></a></li>
                                </ul>
                                <div class="filters">
                                    <div class="filter-by">
                                        <h4>Short by </h4>
                                        <form action="#">
                                            <div class="select-filter">
                                                <select>
                                                  <option value="color">Position</option>
                                                  <option value="name">Name</option>
                                                  <option value="brand">Brand</option>
                                                </select> 
                                            </div>
                                        </form>								
                                    </div>
                                    <div class="filter-by">
                                        <h4>Show </h4>
                                        <form action="#">
                                            <div class="select-filter">
                                                <select>
                                                  <option value="10">12</option>
                                                  <option value="20">16</option>
                                                  <option value="30">20</option>
                                                </select> 
                                            </div>
                                        </form>								
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div> 
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="grid">
                                <div class="row" id="showArea1">
                                    
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="list">
                                <div class="row product-list">
                                    <div class="col-md-12" id="showArea2">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>    
                        <div class="row">
                            <div class="col-md-12">
                                <div class="pagination clearfix">
                                    <p id="pagiStatus">Items From &nbsp;<span id="numFrom">0</span> to <span id="numTo">12</span> of <span id="numTotal">48</span> total</p>
                                    <ul id="pagiUl">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Category Service Area-->
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
        
        <!-- util.js -->
        
        <script type="text/javascript" src="js/self/common/util.js"></script>
        
        <!-- footprint.js -->
        <script type="text/javascript" src="js/self/general/footprint.js"></script>
        
        <!-- shopcart -->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        <script type="text/javascript" src="js/self/general/shopcart-button.js"></script>
        
        <!-- shop-grid.js -->
        
        <script type="text/javascript" src="js/self/general/shop-grid.js"></script>
        
        
        <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        <!-- specific -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		initProductCategories();
        		getProducts(1,12,getPagi1);
        		initUpperShopcart();
        	});
        </script>
        
    </body>
</html>
