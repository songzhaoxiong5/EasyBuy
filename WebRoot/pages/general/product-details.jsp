<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
String temp=request.getParameter("productId");
if(temp!=null){
	int productId=Integer.parseInt(temp);
	ProductServiceImpl productService=new ProductServiceImpl();
	EasyBuy_Product currentProduct=productService.selectOne("id",productId);
	if(currentProduct!=null){
		pageContext.setAttribute("product", currentProduct);
		String relativePath=currentProduct.getImg().substring(29);
		pageContext.setAttribute("imgPath", relativePath);
		ProductCategoryServiceImpl categoryService=new ProductCategoryServiceImpl();
		EasyBuy_ProductCategory category=categoryService.selectOne("id",currentProduct.getCategoryLevel3());
		if(category!=null){
			String thirdCategory=category.getName();
			pageContext.setAttribute("category", thirdCategory);
		}
	}
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
        <title>Product Details || SynixMall</title>
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
    <body class="product-details">
        <!--Header Area Start-->
        <%@ include file="console_elements/header.jsp" %>
        <!--End of Header Area-->
        <!--Mainmenu Area Start-->
        <%@ include file="console_elements/mainmenu-area.jsp" %>
        <!--End of Mainmenu Area-->
        <!--Error Text Area Start-->
        <!--Breadcrumbs Start-->
        <div class="breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb">
                            <li><a href="pages/general/index.jsp"><i class="fa fa-home"></i>Home</a></li>
                            <li class="active">${pageScope.category}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Breadcrumbs-->
        <!--Product Details Area Start-->
        <section class="product-details-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-9"> 
                        <div class="row"> 
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="product-s-l">
                                    <div class="product-large">
                                        <div class="tab-content">
                                            <div class="tab-pane active in" id="img-1">
                                                <a href="product-details.html"><img alt="" class="zoom_01" src="img/product/p-d-1.jpg"  data-zoom-image="img/product/p-d-1.jpg"></a>
                                            </div>
                                            <div class="tab-pane" id="img-2">
                                                <a href="product-details.html"><img alt="" class="zoom_01" src="img/product/p-d-2.jpg"  data-zoom-image="img/product/p-d-2.jpg"></a>
                                            </div>
                                            <div class="tab-pane" id="img-3">
                                                <a href="product-details.html"><img alt="" class="zoom_01" src="img/product/p-d-3.jpg"  data-zoom-image="img/product/p-d-3.jpg"></a>
                                            </div>
                                            <div class="tab-pane" id="img-4">
                                                <a href="product-details.html"><img alt="" class="zoom_01" src="img/product/p-d-4.jpg"  data-zoom-image="img/product/p-d-4.jpg"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-small">
                                        <ul class="nav nav-tabs bxslider" role="tablist">
                                            <li class="active">
                                                <a href="#img-1" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-2" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-3" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-4" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li class="active">
                                                <a href="#img-1" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-2" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-3" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#img-4" data-toggle="tab">
                                                    <img alt="" src="${pageScope.imgPath}">
                                                </a>
                                            </li>
                                        </ul>
                                        <!-- BX Slider Navigation -->
                                        <div class="outside">
                                            <p><span id="slider-prev"></span> <span id="slider-next"></span></p>
                                        </div>  
                                        <!-- BX Slider Navigation -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="product-right-details">
                                    <div class="product-info">
                                        <h4>${pageScope.product.name}</h4>
                                        <h5>$${pageScope.product.price}</h5>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star grey"></i>
                                            <i class="fa fa-star grey"></i>
                                        </div>
                                        <p>3 Review (s)</p>
                                    </div>
                                </div>
                                <div class="borderd-para">
                                    <p>${pageScope.product.stock}</p>
                                    <p>Also in stores: <span>125</span> product result.</p>
                                </div>
                                <p class="details">${pageScope.product.description}</p>
                                <div class="p-d-info">
                                    <div class="filter-by">
                                        <h4>Size:</h4>
                                        <form action="#">
                                            <div class="select-filter">
                                                <select>
                                                  <option value="m">M</option>
                                                  <option value="l">L</option>
                                                  <option value="xl">XL</option>
                                                  <option value="xs">XS</option>
                                                </select> 
                                            </div>
                                        </form>								
                                    </div>
                                    <div class="filter-by">
                                        <h4>Color:</h4>
                                        <form action="#">
                                            <div class="select-filter">
                                                <select>
                                                  <option value="white">White</option>
                                                  <option value="red">Red</option>
                                                  <option value="blue">Blue</option>
                                                  <option value="green">Green</option>
                                                </select> 
                                            </div>
                                        </form>								
                                    </div>
                                    <div class="filter-by">
                                        <h4>Quantity:</h4>
                                        <form action="#">
                                            <div class="select-filter number">
                                                <div class="inc qtybutton">+</div>
                                                <input type="text" value="0" name="qtybutton" class="cart-plus-minus-box" id="quantityBtn">
                                                <div class="dec qtybutton">-</div>
                                            </div>
                                        </form>								
                                    </div>
                                    <div class="product-info">
                                        <button class="n-a-btn shopcart2" productId="${pageScope.product.id}"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                        <a class="wishlist" href="#"><i class="fa fa-heart"></i></a>
                                        <a class="signal" href="#"><i class="fa fa-signal"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="p-details-tab">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#description" aria-controls="description" role="tab" data-toggle="tab">Product Description</a></li>
                                        <li role="presentation"><a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">Reviews</a></li>
                                        <li role="presentation"><a href="#tags" aria-controls="tags" role="tab" data-toggle="tab">Product Tags</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                                <div class="tab-content review">
                                    <div role="tabpanel" class="tab-pane active" id="description">
                                        <p>${pageScope.product.description}</p>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="reviews">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="review-left">
                                                    <p> <a href="">Bootexperts</a><span> Review by </span> Bootexperts </p>
                                                    <div class="review-rating">
                                                        <p>price</p>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-rating">
                                                        <p>value</p>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-rating">
                                                        <p>quality</p>
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </div>
                                                    <p>Bootexperts <span class="italic">(Posted on 11/4/2015)</span></p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="review-right">
                                                    <h3>You're reviewing: Tristique ut lectus</h3>
                                                    <h4>How do you rate this product? *</h4>
                                                    <form action="mail.php" method="post">
                                                        <div class="p-details-table table-responsive">
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>1 star</th>
                                                                        <th>2 stars</th>
                                                                        <th>3 stars</th>
                                                                        <th>4 stars </th>
                                                                        <th>5 stars </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <th>Price</th>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Value</th>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th>Quality</th>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                        <td><input type="radio" class="radio" value=""></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>    
                                                        </div>
                                                        <div class="row form-top">
                                                            <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                                                <label>Nickname<span title="required" class="required">*</span></label>
                                                                <input type="text" class="form-control" name="name">
                                                            </div>
                                                            <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                                                <label>Summary of Your Review<span title="required" class="required">*</span></label>
                                                                <input type="text" class="form-control" name="subject">
                                                            </div>
                                                            <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                                                <label>Review<span title="required" class="required">*</span></label>
                                                                <textarea class="yourmessage" name="message"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="submit-form form-group col-sm-12 submit-review">
                                                            <a class="add-tag-btn" href="#">Submit Review</a>
                                                        </div>
                                                    </form>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="tags">
                                        <div class="product-tag-name">
                                            <form action="mail.php" method="post">
                                                <div class="row form-top">
                                                    <div class="form-group col-sm-12 col-md-12 col-lg-12">
                                                        <label>Add Your Tags:</label>
                                                        <input type="text" class="form-control">
                                                        <a class="add-tag-btn" href="#">ADD Tags</a>
                                                    </div>
                                                </div>
                                            </form>
                                            <p>Use spaces to separate tags. Use single quotes (') for phrases.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="arrival-heading">
                                    <h2>Recently Viewed</h2>
                                </div>
                            </div>
                            <div class="clear"></div>
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
                    </div>    
                    <div class="col-md-3 sidebar-info">
                        <div class="feature-heading">
                            <h2>Related Products</h2>
                        </div>
                        <div class="single-news">
                            <div class="single-image">
                                <a href="#">
                                    <img src="img/product/p-1.jpg" alt="">
                                </a>
                            </div>
                            <div class="product-info">
                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                <h5>$156.87 </h5>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star grey"></i>
                                    <i class="fa fa-star grey"></i>
                                </div>
                            </div>
                        </div>
                        <div class="single-news">
                            <div class="single-image">
                                <a href="#">
                                    <img src="img/product/p-2.jpg" alt="">
                                </a>
                            </div>
                            <div class="product-info">
                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                <h5>$156.87</h5>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star grey"></i>
                                    <i class="fa fa-star grey"></i>
                                </div>
                            </div>
                        </div>
                        <div class="single-news">
                            <div class="single-image">
                                <a href="#">
                                    <img src="img/product/p-3.jpg" alt="">
                                </a>
                            </div>
                            <div class="product-info">
                                <h4><a href="#">SparkFun Badgers Intel</a></h4>
                                <h5>$156.87</h5>
                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star grey"></i>
                                    <i class="fa fa-star grey"></i>
                                </div>
                            </div>
                        </div>
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
                        <aside class="widget widget-banner border-hover">
                            <a href="#"><img alt="" src="img/banner/banner-30.jpg"></a>
                        </aside>  
                    </div>
                </div>
            </div>
        </section>
        <!--End of product-details Area-->
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
        
        <!-- searchbox.js -->
        
        <script type="text/javascript" src="js/self/general/searchbox.js"></script>
        
        
        <!-- specific -->
        <script type="text/javascript">
        	$(document).ready(function(){
        		initUpperShopcart();
        		initFootprint();
        		
        	});
        </script>
        
        
    </body>
</html>
