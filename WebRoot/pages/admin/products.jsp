<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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

    <script src="lib/admin/jquery-1.8.1.min.js" type="text/javascript"></script>

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
        	 <div class="stats">
				    <p class="stat"><span class="number" id="totalNum"></span>Entities</p>
				    <p class="stat"><span class="number" id="totalPages"></span>Pages</p>
			</div>
            <h1 class="page-title">Product List</h1>
			<div class="btn-toolbar">
			    <button class="btn btn-primary" id="add"><i class="icon-plus"></i> New Product</button>
			    <button class="btn">Import</button>
			    <button class="btn">Export</button>
			    <div class="btn-group" id="main-product-container">
  					<a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="product-level-info" currentId="" type="">
   							 Select the Product Category!<span class="caret"></span></a>
   						<!-- first grade dropdown menu links -->
  						<ul class="dropdown-menu" id="first-product-level">
				    			<li ><a href="javascript:;" parentId="0" selfId="0">Please Select</a></li>
				  		</ul>
				  		<!-- first -->
				</div>
			</div>
			<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
			<div class="well">
			    <table class="table">
			      <thead>
			        <tr>
			          <th>Name</th>
			          <th>Description</th>
			          <th>Price</th>
			          <th>Stock</th>
			          <th>CategoryLevel1</th>
			          <th>CategoryLevel2</th>
			          <th>CategoryLevel3</th>
			          <th>For Sale?</th>
			          <th>Image</th>
			          <th></th>
			          <th style="width: 26px;"></th>
			        </tr>
			      </thead>
			      <tbody>
			      </tbody>
			    </table>
			</div>

			<!-- 删除模态 -->	
			<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h3 id="myModalLabel">Delete Confirmation</h3>
			    </div>
			    <div class="modal-body" id="modal-body1">
			        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
			    </div>
			    <div class="modal-footer">
			        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			        <button class="btn btn-danger" data-dismiss="modal" id="modalDel">Delete</button>
			    </div>
			    <input type="hidden"  name="delId" id="delId" value=""/>
			</div>
			
			<!-- 上架模态 -->
			<div class="modal small hide fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h3 id="myModalLabel">For Sale Confirmation</h3>
			    </div>
			    <div class="modal-body" id="modal-body2">
			        <p class="error-text"><i class="icon-refresh modal-icon"></i>Are you sure you want to put this product to the mall?</p>
			    </div>
			    <div class="modal-footer">
			        <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
			        <button class="btn btn-danger" data-dismiss="modal" id="modalSell">Yes</button>
			    </div>
			    <input type="hidden"  name="sellId" id="sellId" value="" sell=""/>
			</div>
			
			<!-- 信息模态 -->
			<div class="modal small hide fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			        <h3 id="myModalLabel">Attention!</h3>
			    </div>
			    <div class="modal-body" id="modal-body2">
			        <p class="error-text"><i class="icon-refresh modal-icon"></i>Sorry! We have encountered some problem!</p>
			    </div>
			    <div class="modal-footer">
			        <button class="btn" data-dismiss="modal" aria-hidden="true" id="confirm">I See!</button>
			    </div>
			    <input type="hidden"  name="info" id="info" value=""/>
			</div>
			
			
	</div>    
</div>
   <%@ include file="console_elements/footbar.jsp" %>
    
</div>
    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageScope.basePath}lib/admin/bootstrap/js/bootstrap.js"></script>
    <script src="js/self/common/download.js" type="text/javascript"></script>
    <script src="js/self/common/util.js" type="text/javascript"></script>
    <script src="js/self/admin/products.js" type="text/javascript"></script>
    <script src="js/self/admin/three-level-menu.js" type="text/javascript"></script>
    <script type="text/javascript">
    	
$(document).ready(function(){
    	
    	$("#add").click(function(){
    		location.href="pages/admin/product_add.jsp";
    	});
    	
    	
    	//点击删除模态按钮的方法	
		$("div.span9").on("click","#modalDel",function(){
		 		$("#myModal").modal('hide');
		 		var sent="opr=del&delId="+$("#delId").val();
		 		$.getJSON("productcontrol",sent,refresh);
		});
    	
    	function refresh(data){
			getProducts(1,"productcontrol");
			afterManipulation(data);
			$("#product-level-info").html("Select the Product Category!<span class='caret'></span>");
		}
    	
    	//点击上架模态按钮的方法
    	$("div.span9").on("click","#modalSell",function(){
		 		$("#myModal2").modal('hide');
		 		var sent="opr=forSell&id="+$("#sellId").val()+"&status="+$("#sellId").attr("sell");
		 		$.getJSON("productcontrol",sent,refresh);
		});
    	
    	
    	//点击上架按钮的操作！
    	$("div.span9").on("click","#sellBtn",function(){
    		var sellId=$(this).attr("rel");
    		var status=$(this).attr("sell");
    		if(status=="on"){
    			$("#modal-body2>p").html("<i class='icon-refresh modal-icon'></i>Are you sure you want to put this product off the shelf?");
    			$("#sellId").val(sellId);
    			$("#sellId").attr("sell",status);
    		}else if(status=="off"){
    			$("#modal-body2>p").html("<i class='icon-refresh modal-icon'></i>Are you sure you want to put this product on the shelf?");
    			$("#sellId").val(sellId);
    			$("#sellId").attr("sell",status);
    		}else{
    			$("#myModal3").modal('show');
    		}
    	});
    	
    	//信息窗口的确认按钮
    	$("#confirm").click(function(){
    		$("#myModal3").modal('hide');	
    	});
    	
    	
    	$("div.span9").on("click","i.icon-shopping-cart",function(){
			var sellId=$(this).parent().attr("rel");
			var status=$(this).parent().attr("sell");
			if(status=="on"){
    			$("#modal-body2>p").html("<i class='icon-refresh modal-icon'></i>Are you sure you want to put this product off the shelf?");
    			$("#sellId").val(sellId);
    			$("#sellId").attr("sell",status);
    		}else if(status=="off"){
    			$("#modal-body2>p").html("<i class='icon-refresh modal-icon'></i>Are you sure you want to put this product on the shelf?");
    			$("#sellId").val(sellId);
    			$("#sellId").attr("sell",status);
    		}else{
    			$("#myModal3").modal('show');
    		}
		});
    	
    	//点击删除按钮的操作
    	$("div.span9").on("click","#removeBtn",function(){
		var delId=$(this).attr("rel");
		$("#delId").val(delId);
		});
		$("div.span9").on("click","i.icon-remove",function(){
			var delId=$(this).parent().attr("rel");
			$("#delId").val(delId);
		});
	    	
    	
    	
    	
    	initProductTree();//生成三级联动菜单！
    	
    	getProducts(1,"productcontrol");//默认给出所有商品
    	
    	
});
    	
    	
    </script>
  </body>
</html>


