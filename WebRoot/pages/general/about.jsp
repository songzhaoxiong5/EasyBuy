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
        <title>About Us || Stepre</title>
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
        <!--Breadcrumbs Start-->
        <div class="breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb">
                            <li><a href="pages/general/index.jsp"><i class="fa fa-home"></i>Home</a></li>
                            <li class="active">About Us</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Breadcrumbs-->
        <!--About Area Start-->
        <div class="home-hello-info">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="f-title text-center">
							<h3 class="title text-uppercase">About Us</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-7 col-sm-12 col-xs-12">
						<div class="about-page-cntent">
							<h3>欢迎来到我自己制作的电商网站Demo</h3>
							<p>该网站仅供参观学习使用，技术有限欢迎指教！</p>
							<blockquote>
								<p>你只有非常努力，才能看上去毫不费力！</p>
							</blockquote>
							<p>Web开发，不去实践是无法真正学到精髓的，感觉都会只是踩的坑还不够多。学的越多才发现自己其实什么也不会！</p>
						</div>
					</div>
					<div class="col-md-5 col-sm-12 col-xs-12">
						<div class="img-element">
							<img alt="banner1" src="img/self/my-icon2.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
        <!--End of ABout ARea-->
        <!--Our Team Start-->
        <div class="home-our-team">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="f-title text-center">
							<h3 class="title text-uppercase">Meet the team</h3>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 col-sm-4">
						<div class="item-team text-center">
							<div class="team-info">
								<div class="team-img">
									<img width="250" height="250" alt="team1" class="img-responsive" src="img/self/my-icon2.jpg">
									<div class="mask">
										<div class="mask-inner">
											<a href="#"><i class="fa fa-facebook"></i></a>
											<a href="#"><i class="fa fa-twitter"></i></a>
										</div>
									</div>
								</div>
							</div>
							<h4>Song Zhaoxiong</h4>
							<h5>Developer</h5>
						</div>
					</div>
					<div class="col-md-3 col-sm-4">
						<div class="item-team text-center">
							<div class="team-info">
								<div class="team-img">
									<img width="250" height="250" alt="team2" class="img-responsive" src="img/self/my-icon2.jpg">
									<div class="mask">
										<div class="mask-inner">
											<a href="#"><i class="fa fa-facebook"></i></a>
											<a href="#"><i class="fa fa-twitter"></i></a>
										</div>
									</div>
								</div>
							</div>
							<h4>Song Zhaoxiong</h4>
							<h5>Programmer</h5>
						</div>
					</div>
					<div class="col-md-3 col-sm-4">
						<div class="item-team text-center">
							<div class="team-info">
								<div class="team-img">
									<img width="250" height="250" alt="team3" class="img-responsive" src="img/about/ab-team3.jpg">
									<div class="mask">
										<div class="mask-inner">
											<a href="#"><i class="fa fa-facebook"></i></a>
											<a href="#"><i class="fa fa-twitter"></i></a>
										</div>
									</div>
								</div>
							</div>
							<h4>Anzo Perez</h4>
							<h5>Designer</h5>
						</div>
					</div>
					<div class="col-md-3 hidden-sm">
						<div class="item-team text-center">
							<div class="team-info">
								<div class="team-img">
									<img width="250" height="250" alt="team4" class="img-responsive" src="img/about/ab-team4.jpg">
									<div class="mask">
										<div class="mask-inner">
											<a href="#"><i class="fa fa-facebook"></i></a>
											<a href="#"><i class="fa fa-twitter"></i></a>
										</div>
									</div>
								</div>
							</div>
							<h4>Martin Demichelis</h4>
							<h5>Frontend Developer</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!--End of Our Team-->
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
       
        <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        
        <!-- specific-->
        <script type="text/javascript">
        	initUpperShopcart();
        
        </script>
        
    </body>
</html>
