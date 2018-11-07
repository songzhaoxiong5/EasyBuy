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
        	<div class="stats">
				    <p class="stat"><span class="number" id="totalNum"></span>Entities</p>
				    <p class="stat"><span class="number" id="totalPages"></span>Pages</p>
			</div>
            <h1 class="page-title">Category List</h1>
	<div class="btn-toolbar">
    <button class="btn btn-primary" id="addCategoryBtn"><i class="icon-user"></i> Add Category</button>
	  <div class="btn-group">
				  <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="showBtn" rel="">
				    Click to Select Category Type!
				    <span class="caret"></span>
				  </a>
				  <!-- 核心技术：三级联动菜单 -->
				  <ul class="dropdown-menu" id="select">
				    <!-- dropdown menu links -->
				    	<li><a href="javascript:;" rel="1">First Category</a></li>
				    	<li><a href="javascript:;" rel="2">Second Category</a></li>
				    	<li><a href="javascript:;" rel="3">Third Category</a></li>
				  </ul>
			</div>
	</div>
<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>Category Name</th>
          <th>Category Type</th>
          <th>Parent Category</th>
          <th></th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
 </div>
 			<!-- 模态窗口 -->
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
    <script src="${pageScope.basePath}js/self/admin/validation-for-category.js"></script>
    <script src="${pageScope.basePath}js/self/common/util.js"></script>
    <script src="${pageScope.basePath}js/self/admin/getpagi.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    	
    		$("#addCategoryBtn").click(function(){
    			location.href="pages/admin/category_add.jsp";
    		});
    		
    		getPagi(1,"categorycontrol");
    		
    		
    		$("div.span9").on("click","#modalDel",function(){
	    		$("#myModal").modal('hide');
	    		var data="opr=del&delId="+$("#delId").val();
	    		$.getJSON("categorycontrol",data,refresh);
    			function refresh(data){
    				getPagi(1,"categorycontrol");
    				$("#showBtn").html("Click to Select Category Type!<span class='caret'></span>");
    				afterManipulation(data);
    			}
   			});
    	
    	
    	
    		$("div.span9").on("click","#select a",function(){
    				$("#showBtn").html($(this).text()+"<span class='caret'></span>");
    				$("#showBtn").attr("rel",$(this).attr("rel"));
    				getPagi2(1,"categorycontrol",$("#showBtn").attr("rel"));
    		});
    		
    			
    	
    	
    	});
    	
    
    </script>
  </body>
</html>


