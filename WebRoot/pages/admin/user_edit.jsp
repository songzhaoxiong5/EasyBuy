<%@ page language="java" import="java.util.*,com.szx.service.impl.*,com.szx.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
String userId=request.getParameter("id");
pageContext.setAttribute("id", userId);
UserServiceImpl userService=new UserServiceImpl();
EasyBuy_User user=userService.selectOne("id",userId);
pageContext.setAttribute("user", user);

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
            <h1 class="page-title">Edit User</h1>
		<div class="btn-toolbar">
		    <button class="btn btn-primary" id="saveBtn" type="button"><i class="icon-save"></i> Save</button>
		    <a href="#myModal" data-toggle="modal" class="btn" id="upperDelButton" rel="${pageScope.user.id}">Delete</a>
		    <button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> User List</button>
		  <div class="btn-group">
		  </div>
		</div>
		<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
<div class="well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home" data-toggle="tab">Profile</a></li>
      <li><a href="#profile" data-toggle="tab">Password</a></li>
    </ul>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <form id="userModifyForm" method="get" action="">
    	<input type="hidden" id="userId" name="id" value="${pageScope.user.id}"/>
    	<input type="hidden" id="opr" name="opr" value="modify"/>
        <label>Username</label>
        <input type="text" value="${pageScope.user.userName}" class="input-xlarge" name="userName">
        <label>Real Name</label>
        <input type="text" value="${pageScope.user.realName}" class="input-xlarge" name="realName">
        <label>Password</label>
        <input type="text" value="${pageScope.user.password}" class="input-xlarge" name="password">
        <label>Gender</label>
       	<label class="radio">
  		<input type="radio" <c:if test="${pageScope.user.sex==0}">checked</c:if> name="sex" id="sex1" value="0">Male
		</label>
		<label class="radio">
  		<input type="radio" <c:if test="${pageScope.user.sex==1}">checked</c:if> name="sex" id="sex2" value="1">Female
		</label>
        <label>Identity Code</label>
		<input type="text" value="${pageScope.user.identityCode}" class="input-xlarge" name="identityCode">
		<label>Email</label>
		<input type="text" value="${pageScope.user.email}" class="input-xlarge" name="email">
		<label>Mobile</label>
		<input type="text" value="${pageScope.user.mobile}" class="input-xlarge" name="mobile">
		<label>Address</label>
		<input type="text" value="${pageScope.user.address}" class="input-xlarge" name="address">
		<label>User Type</label>
       	<label class="radio">
  		<input type="radio" <c:if test="${pageScope.user.type==0}">checked</c:if> name="type" id="type1" value="0">Admin
		</label>
		<label class="radio">
  		<input type="radio" <c:if test="${pageScope.user.type==1}">checked</c:if> name="type" id="type2" value="1">General
		</label>	
    </form>
      </div>
      <div class="tab-pane fade" id="profile">
    <form id="tab2">
        <label>New Password</label>
        <input type="password" class="input-xlarge">
        <div>
            <button class="btn btn-primary">Update</button>
        </div>
    </form>
      </div>
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
	    $("#upperDelButton").click(function(){
	    		var delId=$(this).attr("rel");
	    		$("#delId").val(delId);
	    	});
	    $("#modalDel").click(function(){
	    		$("#myModal").modal('hide');
	    		var data="opr=del&delId="+$("#delId").val();
		    		$.getJSON("usercontrol",data,afterManipulation);
	    	});
	    	$("#saveBtn").click(function(){
	    	var $formArea=$("#userModifyForm");
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


