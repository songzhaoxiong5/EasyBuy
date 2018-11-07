<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>SynixMall Admin</title>
    <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}css/admin/theme.css">
    <link rel="stylesheet" href="${pageScope.basePath}lib/admin/font-awesome/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="${pageScope.basePath}css/self/label-for-error.css"/>
    <script src="${pageScope.basePath}lib/admin/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->
    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    
    <!-- upload begin -->
	    <link href="${pageScope.basePath}lib/upload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
	    <link href="${pageScope.basePath}lib/upload/themes/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    <!-- upload  -->
    
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body> 
  <!--<![endif]-->
    
    <%@ include file="console_elements/navbar.jsp" %>
    

 <div class="container-fluid">
        
 <div class="row-fluid">
   <%@ include file="console_elements/sidebar.jsp" %>
        <div class="span9">
            <h1 class="page-title">Add Product</h1>
			<div class="btn-toolbar">
			    <button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> Product List</button>
			  <div class="btn-group">
			  </div>
			</div>
		<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
		<div class="well">		      
			    <div class="box-content">
							<form class="form-horizontal" id="productAddForm" method="post" action="" enctype="multipart/form-data">
							  <fieldset>
							  <div id="result" style="display:none;" class="alert alert-info" role="alert"></div>
								<legend id="legend">Add Product</legend>
								<div class="control-group">
								  <label class="control-label">Name</label>
								  <div class="controls">
									<input type="text" class="span6"  name="name">
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">Description</label>
								  <div class="controls">
									<textarea  id="textarea" rows="5"  name="description" value="" class="span6"></textarea>
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">Price</label>
								  <div class="controls">
									<input type="text" class="span6"  name="price">
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">Stock</label>
								  <div class="controls">
									<input type="text" class="span6"  name="stock">
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">CategoryLevel1</label>
								  <div class="controls">
									<select name="categoryLevel1" id="select1">
										<option value="" id="default1">Please Select!</option>
									</select>
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">CategoryLevel2</label>
								  <div class="controls">
									<select name="categoryLevel2" id="select2">
										<option value="" id="default2">Please Select!</option>
									</select>
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">CategoryLevel3</label>
								  <div class="controls">
									<select name="categoryLevel3" id="select3">
										<option value="" id="default3" >Please Select!</option>
									</select>
								  </div>
								</div>
								
								<div class="control-group">
								  <label class="control-label">Product Status</label>
								  <div class="controls">
										<label class="radio">
								  		<input type="radio" name="isDelete"  value="0" checked>On Shelf
										</label>
										<label class="radio">
								  		<input type="radio" name="isDelete"  value="1">Off Shelf
										</label>
								  </div>
								</div>
								
								
								<div class="control-group">
								  <label class="control-label">Upload Image</label>
								 	 <div class="file-loading">
	            						<input id="kv-explorer" type="file" multiple name="img">
	        						</div>
								</div>          
								<div class="control-group" align="center">
								  <button  class="btn btn-primary"  type="button" id="submitButton">Save changes</button>
								  <button type="reset" class="btn">Cancel</button>
								</div>
							  </fieldset>
							</form>   
				</div>  
		</div>

       </div>
</div>
    

    
    <%@ include file="console_elements/footbar.jsp" %>
    
</div>
    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageScope.basePath}lib/admin/bootstrap/js/bootstrap.js"></script>
    

    <!-- Form Validate -->
    <script src="${pageScope.basePath}js/self/common/jquery.validate.js" type="text/javascript"></script>
	<script src="${pageScope.basePath}js/self/admin/validation-for-product.js"></script>
	
	<!-- upload begin -->
	    <script src="${pageScope.basePath}lib/upload/js/fileinput.js" type="text/javascript"></script>
	    <script src="${pageScope.basePath}lib/upload/themes/explorer-fa/theme.js" type="text/javascript"></script>
	    <script src="${pageScope.basePath}lib/upload/themes/fa/theme.js" type="text/javascript"></script>
	<!-- upload end -->
	
	<script src="${pageScope.basePath}js/self/common/util.js" type="text/javascript"></script>
	<script src="${pageScope.basePath}js/self/admin/dynamic-select.js" type="text/javascript"></script>
    <script type="text/javascript">
$(document).ready(function(){
		$("div.span9").on("click","#goBackToList",function(){
			location.href="pages/admin/products.jsp";
		});
		
		$("#submitButton").click(function(){
				if($("#productAddForm").valid()){
				var myForm=document.getElementById("productAddForm");//获取前台表单
  				var formData=new FormData(myForm);//
  				$.ajax({
  					"url":"productcontrol",
  					"data":formData,
  					"type":"POST",
  					"dataType":"json",
  					"success":afterManipulation,
  					"processData":false,
              		"contentType":false,
          			"cache": false
  				});}
		});
		initFirstCategory();
});
	
$(document).ready(function(){
    		$("#kv-explorer").fileinput({
           "theme": "explorer-fa",
           "uploadUrl": "newscontrol",
           overwriteInitial: false,
           initialPreviewAsData: true,
    		});
});
    </script>
    
    
    

  </body>
</html>
