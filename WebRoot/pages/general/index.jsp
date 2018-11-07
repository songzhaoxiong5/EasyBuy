<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("basePath", basePath);	
%>

<!DOCTYPE html>

<html class="no-js" lang="">
    <head>
    	<base href="<%=basePath%>">
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Welcome to Synix mall!</title>
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
    <body class="home-one">
        <!--Header Area Start-->
        <%@ include file="console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Slider Area Start-->
		<div class="slider-area">
			<div class="preview-2">
				<div id="nivoslider" class="slides">	
					<img src="img/slider/slider-1.jpg" alt="" title="#slider-direction-1"/>
					<img src="img/slider/slider-2.jpg" alt="" title="#slider-direction-2"/>
				</div>
				<!-- direction 1 -->
				<div id="slider-direction-1" class="t-cn slider-direction">
                    <div class="slider-progress"></div>
					<!-- layer 1 -->
					<div class="layer-1">
						<img src="img/slider/slider-l-1.png" alt=""/>
					</div>
					<!-- layer 2 -->
					<div class="layer-2">
						<img src="img/slider/slider-l-2.png" alt=""/>
					</div>
					<!-- layer 3 -->
					<div class="layer-3">
						<img src="img/slider/slider-l-3.png" alt=""/>
					</div>
					<!-- layer 4 -->
					<div class="layer-4">
						<img src="img/slider/slider-l-4.png" alt=""/>
					</div>
					<!-- layer 5 -->
					<div class="layer-5">
						<img src="img/slider/slider-l-5.png" alt=""/>
					</div>
					<!-- layer 6 -->
					<div class="wow bounceInDown layer-6" data-wow-duration="3s" data-wow-delay="3.5s">
						<img src="img/slider/slider-l-6.png" alt=""/>
					</div>
					<div class="slider-content slider-text-1">
						<div class="wow bounceInDown" data-wow-duration="3s" data-wow-delay="3s">
							<h1 class="title1">Welcome To Synix Mall!</h1>
						</div>
					</div>
				</div>
				<!-- direction 2 -->
				<div id="slider-direction-2" class="slider-direction">
				    <div class="slider-progress"></div>
					<!-- layer 7 -->
					<div class="wow bounceInDown t-cn layer-7" data-wow-duration="3s" data-wow-delay="0s">
						<img class="t-cn" src="img/slider/slider-l-logo.png" alt="" />
					</div>
					<div class="slider-content slider-text-2">
						<div class="wow bounceInDown" data-wow-duration="3s" data-wow-delay="1s">
							<h1 class="title1">Powered By Java</h1>
						</div>
					</div>
					<div class="slider-content slider-text-3">
						<div class="wow bounceInRight" data-wow-duration="3s" data-wow-delay="3s">
							<h5 class="title1">Welcome To SynixMall</h5>
						</div>
					</div>
					<div class="slider-content slider-text-4">
						<div class="wow bounceInUp" data-wow-duration="3s" data-wow-delay="3s">
							<a href='#' class='button-text'>Buy Now <i class="fa fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!--End of Slider Area-->
        <!--Category Service Area Start-->
        <section class="cat-service-area">
            <div class="container">
                <div class="row">
		<!-- begin of left navigation -->
                    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs">
                        <div class="cat-menu">
                            <ul id="category">
                                <li class="cat-title"><a href="#">Categories</a></li>
                            </ul>
                        </div>
                    </div>
 		<!-- end of left navigation -->
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="cat-service-banner border-hover">
                            <a href="#">
                                <img src="img/banner/banner-1.jpg" alt="">
                                <div class="banner-text">
                                    <h3>Toshiba Satellite Z930</h3>
                                    <h2>Price $564</h2>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 hidden-sm">
                        <div class="single-info">
                            <div class="s-icon"><i class="fa fa-phone"></i></div>
                            <div class="single-info-text">
                                <h3><span>Phone:</span>(+1)888 987 666</h3>
                            </div>
                        </div>
                        <div class="single-info">
                            <div class="s-icon"><i class="fa fa-truck"></i></div>
                            <div class="single-info-text">
                                <h3>Free shipping</h3>
                                <p>On order over $199</p>
                            </div>
                        </div>
                        <div class="single-info">
                            <div class="s-icon"><i class="fa fa-money"></i></div>
                            <div class="single-info-text">
                                <h3><span>Money</span> back 100%</h3>
                                <p>Within 30 Days delivery</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Category Service Area-->
        
        <!--New Arrivals Carousel Area Start-->
        <section class="new-arrival-carousel-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="arrival-heading">
                            <h2 id="currentCategory">Welcome!</h2>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="new-arrival-carousel" id="showArea1">
                        <div class="col-md-3" >
                            <div class="single-product" id="owl1">
                             
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl2">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl3">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl4">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl5">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl6">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl7">
                                
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="single-product" id="owl8">
                                
                            </div>
                        </div>  
                        <div class="col-md-3">
                            <div class="single-product" id="owl9">
                                
                            </div>
                        </div>   
                        <div class="col-md-3">
                            <div class="single-product" id="owl10">
                                
                            </div>
                        </div>    
                        <div class="col-md-3">
                            <div class="single-product" id="owl11">
                                
                            </div>
                        </div> 
                        <div class="col-md-3">
                            <div class="single-product" id="owl12">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of New Arrivals Carousel Area-->
        <!--Product Banner Area Start-->
        <div class="product-banner-area border-hover">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <a href="#"><img src="img/banner/banner-2.jpg" alt=""></a>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <a href="#"><img src="img/banner/banner-3.jpg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Product Banner Area-->
        <!--Features Tab Area Start-->
        <div class="features-tab-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4">
                        <aside class="widget widget-banner border-hover">
                            <a href="#"><img src="img/banner/banner-4.jpg" alt=""></a>
                        </aside>
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
                        <aside class="widget widget-newletter">
                            <h3 class="sidebar-title"><span>Newsletter</span></h3>
                            <div class="news-form">
                                <p>Please send a letter to us, believe that the information promotion will not slip out of hand you</p>
                                <form id="news-form" action="#">
                                    <input type="text" placeholder="Your Email . ." name="s">
                                    <button type="submit">Subscribe</button>
                                </form>                                
                            </div>
                        </aside>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-8">
                        <div class="features-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#page1" aria-controls="page1" role="tab" data-toggle="tab" id="page1Btn">Page 1</a></li>
                                <li role="presentation"><a href="#page2" aria-controls="page2" role="tab" data-toggle="tab" id="page2Btn">Page 2</a></li>
                                <li role="presentation"><a href="#page3" aria-controls="page3" role="tab" data-toggle="tab" id="page3Btn">Page 3</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="page1">
                                <div class="row">   
                                    <div class="single-p-slide" id="showArea2">
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl1">
                                                
                                            </div>
                                            <div class="single-product" id="owl2">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl3">
                                                
                                            </div>
                                            <div class="single-product" id="owl4">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl5">
                                                
                                            </div>
                                            <div class="single-product" id="owl6">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl7">
                                                
                                            </div>
                                            <div class="single-product" id="owl8">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl9">
                                                
                                            </div>
                                            <div class="single-product" id="owl10">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl11">
                                                
                                            </div>
                                            <div class="single-product" id="owl12">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="page2">
                                <div class="row">
                                    <div class="single-p-slide" id="showArea3">
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl1">
                                                
                                            </div>
                                            <div class="single-product" id="owl2">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl3">
                                                
                                            </div>
                                            <div class="single-product" id="owl4">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl5">
                                                
                                            </div>
                                            <div class="single-product" id="owl6">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl7">
                                                
                                            </div>
                                            <div class="single-product" id="owl8">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl9">
                                                
                                            </div>
                                            <div class="single-product" id="owl10">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl11">
                                                
                                            </div>
                                            <div class="single-product" id="owl12">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div role="tabpanel" class="tab-pane" id="page3">
                                <div class="row">
                                    <div class="single-p-slide" id="showArea4">
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl1">
                                                
                                            </div>
                                            <div class="single-product" id="owl2">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl3">
                                                
                                            </div>
                                            <div class="single-product" id="owl4">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl5">
                                                
                                            </div>
                                            <div class="single-product" id="owl6">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl7">
                                                
                                            </div>
                                            <div class="single-product" id="owl8">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl9">
                                                
                                            </div>
                                            <div class="single-product" id="owl10">
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="single-product" id="owl11">
                                                
                                            </div>
                                            <div class="single-product" id="owl12">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Features Tab Area-->
        <!--Full Width Banner Area-->
        <div class="full-width-banner-area border-hover">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <a href="#"><img src="img/banner/banner-5.jpg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Full Width Banner Area-->
        <!--Featured Bottom Tab Area Start-->
        <section class="features-tab-area bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-9">
                        <div class="features-tab bottom">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#recently" aria-controls="recently" role="tab" data-toggle="tab" id="footprintBtn">Recently Viewed</a></li>
                                <li role="presentation"><a href="#bestseller" aria-controls="bestseller" role="tab" data-toggle="tab">BESTSELLER</a></li>
                                <li role="presentation"><a href="#sale" aria-controls="sale" role="tab" data-toggle="tab">SALE</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <div class="tab-content row">
                            <div role="tabpanel" class="tab-pane active" id="recently">
                                <div class="single-p-slide-bottom" id="footprint">
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl1">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl2">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl3">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl4">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl5">
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product" id="owl6">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="bestseller">
                                <div class="single-p-slide row">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-5.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-4.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-3.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87<span>$186.94</span></h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-2.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-1.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-3.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div role="tabpanel" class="tab-pane" id="sale">
                                <div class="single-p-slide row">
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-2.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-4.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87<span>$186.94</span></h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-3.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-5.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-1.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <a href="#">
                                                <img src="img/product/tab-4.jpg" alt="">
                                                <i class="fa fa-expand"></i>
                                            </a>    
                                            <div class="product-info">
                                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                                <div class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h5>$156.87</h5>
                                                <button class="n-a-btn"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="latest-heading">
                            <h2 id="news2">Latest News</h2>
                        </div>
                        <div class="latest-news">
                            <div class="single-news" id="newsContainer4">
                                <div class="single-image">
                                    <a href="#">
                                        <img src="img/blog/news-1.jpg" alt="">
                                        <span><i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="news-info">
                                    <a href="#"><h5>Grow 5% in 2016</h5></a>
                                    <p>Here we've rounded up some of the latest products to ..</p>
                                </div>
                            </div>
                            <div class="single-news" id="newsContainer5">
                                <div class="single-image">
                                    <a href="#">
                                        <img src="img/blog/news-2.jpg" alt="">
                                        <span><i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="news-info">
                                    <a href="#"><h5>Hyper Cat joins ..</h5></a>
                                    <p>HyperCat has announced that it is joining Industrial...</p>
                                </div>
                            </div>
                            <div class="single-news" id="newsContainer6">
                                <div class="single-image">
                                    <a href="#">
                                        <img src="img/blog/news-3.jpg" alt="">
                                        <span><i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="news-info">
                                    <a href="#"><h5>Inteil boosts MO</h5></a>
                                    <p>In a $19million cash deal, Intersil has acquir MOSFET . .</p>
                                </div>
                            </div>
                            <div class="single-news" id="newsContainer7">
                                <div class="single-image">
                                    <a href="#">
                                        <img src="img/blog/news-4.jpg" alt="">
                                        <span><i class="fa fa-caret-right"></i></span>
                                    </a>
                                </div>
                                <div class="news-info">
                                    <a href="#"><h5>Intel invest $50</h5></a>
                                    <p>Intel, Delft University of Technology and TNO, Dutch. . ]</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Featured Bottom Tab Area-->
        <!--Blog Area Start-->
        <section class="blog-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="arrival-heading">
                            <h2 id="news1">Latest News</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="single-blog" id="newsContainer1">
                            <div class="blog-image white-hover">
                                <a href="#">
                                    <img src="img/blog/blog-1.jpg" alt="">
                                    <span>Read more <i class="fa fa-angle-right"></i></span>
                                </a>
                            </div>
                            <div class="blog-info">
                                <h4><a href="#">Developing printed electronics</a></h4>
                                <p>Quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam qtatem ...�?/p>
                                <div class="post_info">
                                    <p class="author">By <span><a href="#">Bootexperts</a></span></p>
                                    <p class="comment">
                                       <i class="fa fa-comment-o"></i>
                                       <span><a href="#">1</a></span>
                                    </p>
                                    <p class="date">
                                        <span class="count">August 20, 2015</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="single-blog" id="newsContainer2">
                            <div class="blog-image white-hover">
                                <a href="#">
                                    <img src="img/blog/blog-2.jpg" alt="">
                                    <span>Read more <i class="fa fa-angle-right"></i></span>
                                </a>
                            </div>
                            <div class="blog-info">
                                <h4><a href="#">So many words, so little information</a></h4>
                                <p>It seems the memory industry has taken to making announcements which have little to say beyond.</p>
                                <div class="post_info">
                                    <p class="author">By <span><a href="#">Bootexperts</a></span></p>
                                    <p class="comment">
                                       <i class="fa fa-comment-o"></i>
                                       <span><a href="#">1</a></span>
                                    </p>
                                    <p class="date">
                                        <span class="count">August 20, 2015</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 hidden-sm">
                        <div class="single-blog" id="newsContainer3">
                            <div class="blog-image white-hover">
                                <a href="#">
                                    <img src="img/blog/blog-3.jpg" alt="">
                                    <span>Read more <i class="fa fa-angle-right"></i></span>
                                </a>
                            </div>
                            <div class="blog-info">
                                <h4><a href="#">Avoid epic failure</a></h4>
                                <p>Consumers expect today's electronics to be faster, smaller and highly reliable. This is a challenging ...</p>
                                <div class="post_info">
                                    <p class="author">By <span><a href="#">Bootexperts</a></span></p>
                                    <p class="comment">
                                       <i class="fa fa-comment-o"></i>
                                       <span><a href="#">1</a></span>
                                    </p>
                                    <p class="date">
                                        <span class="count">August 20, 2015</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End of Blog Area-->
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

        <!-- upperShopcart js-->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        
        <!-- main js
		============================================ -->           
        <script src="js/main.js"></script>
        
        <!-- util.js -->
        
        <script type="text/javascript" src="js/self/common/util.js"></script>
        
        <!-- index.js -->
        
        <script type="text/javascript" src="js/self/general/index.js"></script>
        
        <!-- footprint.js -->
        <script type="text/javascript" src="js/self/general/footprint.js"></script>
        
        <!-- shopcart -->
        <script type="text/javascript" src="js/self/general/uppershopcart.js"></script>
        <script type="text/javascript" src="js/self/general/shopcart-button.js"></script>
       
       <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        <!-- specific -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		initProductCategories();
        		getProducts(1);
        		initUpperShopcart();
        		initFootprint();
        		initNews();
        		
        		function initNews(){
        			var sent="opr=list&pageIndex=1";
        			$.getJSON("newscontrol",sent,function(data){
        				var newsList=data[1].list;//注意返回JSON的格式
        				if(!$.isEmptyObject(newsList)){
        					for(var i=0;i<newsList.length;i++){
        						if(i<3){
        							var $container1=$("#newsContainer"+(i+1));
	        						$container1.find("div.blog-image").find("a").attr("href","pages/general/news.jsp?newsId="+newsList[i].id);//填充链接
	        						$container1.find("div.blog-image").find("img").attr("src",parsePath(newsList[i].img));//填充图片
	        						var $infoArea=$container1.find("div.blog-info");
        							var $title=$infoArea.find("h4").find("a").attr("href","pages/general/news.jsp?newsId="+newsList[i].id);//设置链接2
        							$title.html(newsList[i].title);//设置标题
        							$infoArea.find("p").eq(0).html(newsList[i].content);//设置内容
        							var $postInfo=$infoArea.find("div.post_info");
        							$postInfo.find("p.author").find("a").attr("href","pages/general/about.jsp");//设置作者链接
        							$postInfo.find("p.author").find("a").html("songzhaoxiong");//设置作者名称
        							$postInfo.find("p.date").find("span").html(newsList[i].createTime);//设置新闻创建时间
        						}else{
        							var $container2=$("#newsContainer"+(i+1));
        							$container2.find("div.single-image").find("a").attr("href","pages/general/news.jsp?newsId="+newsList[i].id);//填充链接
        							$container2.find("div.single-image").find("a").find("img").attr("src",parsePath(newsList[i].img));//填充新闻图片
        							var $infoArea2=$container2.find("div.news-info");
        							$infoArea2.find("a").attr("href","pages/general/news.jsp?newsId"+newsList[i].id);//填充链接2
        							$infoArea2.find("a").find("h5").html(newsList[i].title);
        							$infoArea2.find("p").html(newsList[i].content);
        						}
        					}
        				}
        			});
        		}
        	});
        </script>
        
       
    </body>
</html>
