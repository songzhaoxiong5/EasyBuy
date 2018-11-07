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
            <h1 class="page-title">Add User</h1>
	<div class="btn-toolbar">
    <button class="btn btn-primary" id="saveUserBtn" type="button"><i class="icon-save"></i> Save</button>
    <button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> User List</button>
  <div class="btn-group">
  </div>
</div>
<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
<div class="well">
    <form id="userAddForm" method="get" action="">
    	<input type="hidden" name="opr" value="add">
        <label>Username</label>
        <input type="text" value="" class="input-xlarge" name="userName" id="userName">
        <label>Real Name</label>
        <input type="text" value="" class="input-xlarge" name="realName">
        <label>Password</label>
        <input type="text" value="" class="input-xlarge" name="password">
        <label>Gender</label>
       	<label class="radio">
  		<input type="radio" name="sex" id="sex1" value="0" checked>Male
		</label>
		<label class="radio">
  		<input type="radio" name="sex" id="sex2" value="1">Female
		</label>
        <label>Identity Code</label>
		<input type="text" value="" class="input-xlarge" name="identityCode">
		<label>Email</label>
		<input type="text" value="" class="input-xlarge" name="email">
		<label>Mobile</label>
		<input type="text" value="" class="input-xlarge" name="mobile">
		<label>Address</label>
		<input type="text" value="" class="input-xlarge" name="address">
		<label>User Type</label>
       	<label class="radio">
  		<input type="radio" name="type" id="type1" value="0">Admin
		</label>
		<label class="radio">
  		<input type="radio" name="type" id="type2" value="1" checked>General
		</label>	
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
    <script src="${pageScope.basePath}js/self/common/jquery.validate.js"></script>
     <script src="${pageScope.basePath}js/self/admin/validation-for-admin.js"></script>
     <script src="${pageScope.basePath}js/self/common/util.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    	$("div.span9").on("click","#saveUserBtn",function(){
    		var $formArea=$("#userAddForm");
	    	var $inputs=$formArea.find(":input");
	    	var serialized=$inputs.serialize();
    		$.getJSON("usercontrol",serialized,afterManipulation);
    	});
    	$("div.span9").on("click","#goBackToList",function(){
    		location.href="pages/admin/users.jsp";
    	});
    	});
    	
    
    </script>
  </body>
</html>


