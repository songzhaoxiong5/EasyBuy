<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
String orderId=request.getParameter("id");

pageContext.setAttribute("id", orderId);
OrderServiceImpl orderService=new OrderServiceImpl();
EasyBuy_Order order=orderService.selectOne("id",orderId);
pageContext.setAttribute("order", order);
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

    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}css/admin/theme.css"/>
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/font-awesome/css/font-awesome.css"/>
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
            <h1 class="page-title">Edit Order</h1>
	<div class="btn-toolbar">
    <button class="btn btn-primary" id="saveOrderBtn" type="button"><i class="icon-save"></i> Save</button>
    <a href="#myModal" data-toggle="modal" class="btn" id="upperDelButton" rel="${pageScope.order.id}">Delete</a>
    <button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> Order List</button>
	  <div class="btn-group">
	  </div>
	</div>
	<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
	<div class="well">
		<div class="btn-toolbar">
		<button class="btn btn-primary" id="addProductBtn" type="button"><i class="icon-shopping-cart"></i> Edit Order</button>
		</div>
	    <form id="orderAddForm" method="get" action="">
	    	<input type="hidden" name="opr" value="modify">
	    	<input type="hidden" name="delId" value="${pageScope.order.id}">
	    	<label>SerialNumber</label>
	    	<input type="text" class="input-xlarge" name="serialNumber" value="${pageScope.order.serialNumber}" id="serialNumber" readonly>
	        <label>Username</label>
	        <input type="text"  class="input-xlarge" name="userName" id="userName" value="${pageScope.order.userName}">
	        <label>User Address</label>
	        <input type="text"  class="input-xlarge" name="userAddress" id="userAddress" value="${pageScope.order.userAddress}"> 
	        <label><button class="btn" id="userAddressBtn" type="button"><i class="icon-hdd"></i> Use Default Address</button></label>
	        <!-- <label>Cost</label> -->
	        <input type="hidden" value="0.0" class="input-xlarge" name="cost" id="totalCost">
	        <label>Create Time</label>
	        <input type="text"  class="input-xlarge" name="createTime" value="${pageScope.order.createTime}" readonly> 
	        <div class="control-group">
			  <label class="control-label">Order Type</label>
			  <div class="controls">
				<select name="type" id="typeSelect">
					<option value="1" <c:if test="${pageScope.order.type == 1}"><c:out value="selected"/></c:if> >Customer Order</option>
					<option value="2" <c:if test="${pageScope.order.type == 2}"><c:out value="selected"/></c:if> >Stock</option>
				</select>
			  </div>
			</div>
			<div class="control-group">
			  <label class="control-label">Status</label>
			  <div class="controls">
				<select name="status" id="statusSelect">
					<option value="1"  <c:if test="${pageScope.order.status == 1}"><c:out value="selected"/></c:if> >Processing</option>
					<option value="2"  <c:if test="${pageScope.order.status == 2}"><c:out value="selected"/></c:if> >Checked</option>
					<option value="3"  <c:if test="${pageScope.order.status == 3}"><c:out value="selected"/></c:if> >Preparing Goods</option>
					<option value="4"  <c:if test="${pageScope.order.status == 4}"><c:out value="selected"/></c:if> >On Road</option>
					<option value="5"  <c:if test="${pageScope.order.status == 5}"><c:out value="selected"/></c:if> >Received</option>
					<option value="6"  <c:if test="${pageScope.order.status == 6}"><c:out value="selected"/></c:if> >In Cart</option>
				</select>
			  </div>
			</div>
	    </form>
	    <div class="appended" id="appendedContainer">
	    </div>
	    
	  </div>

		<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			    <h3 id="myModalLabel">Delete Confirmation</h3>
			  </div>
			  <div class="modal-body">
			    
			    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
			  </div>
			  <div class="modal-footer">
			    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
			    <button class="btn btn-danger" data-dismiss="modal" id="modalDel">Delete</button>
			  </div>
			    <input type="hidden"  name="delId" id="delId" value=""/>
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
    <script src="${pageScope.basePath}js/self/common/jquery.validate.js"></script>
     <script src="${pageScope.basePath}js/self/admin/validation-for-order.js"></script>
     <script src="${pageScope.basePath}js/self/common/util.js"></script>
     <script src="${pageScope.basePath}js/self/admin/order_add.js"></script>
    <script type="text/javascript">
  	$(document).ready(function(){
    	$("div.span9").on("click","#goBackToList",function(){
    		location.href="pages/admin/orders.jsp";
    	});
    	
    	$("#upperDelButton").click(function(){
	    		var delId=$(this).attr("rel");
	    		$("#delId").val(delId);
	    	});
	    $("#modalDel").click(function(){
	    		$("#myModal").modal('hide');
	    		var data="opr=del&delId="+$("#delId").val();
		    		$.getJSON("usercontrol",data,afterManipulation);
	    });
    	
    	
   	});
    	
    
    </script>
  </body>
</html>


