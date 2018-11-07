<%@ page language="java" import="java.util.*,com.szx.service.impl.*,com.szx.bean.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
String newsId=request.getParameter("id");
pageContext.setAttribute("id", newsId);
NewsServiceImpl newsService=new NewsServiceImpl();
EasyBuy_News news=newsService.selectOne("id",newsId);
pageContext.setAttribute("news", news);
String relativePath="#";
String absolutePath=news.getImg();
if(news.getImg()!=null){
	relativePath=news.getImg().substring(news.getImg().indexOf("EasyBuy")+8);
}

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
            <h1 class="page-title">Edit News</h1>
			<div class="btn-toolbar">
				<button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> News List</button>
			    <a href="#myModal" data-toggle="modal" class="btn" id="upperDelButton" rel="${pageScope.news.id}">Delete</a>
			  <div class="btn-group">
			  </div>
			</div>
		<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
		<div class="well">		      
			    <div class="box-content">
							<form class="form-horizontal" id="newsModifyForm" method="post" action="" enctype="multipart/form-data">
							  <fieldset>
							  <div id="result" style="display:none;" class="alert alert-info" role="alert"></div>
								<legend id="legend">News Edit</legend>
								 	<input type="hidden" name="id" value="${pageScope.news.id}">
							  		<input type="hidden" name="opr" value="modifyWithFile">
								<div class="control-group">
								  <label class="control-label">Title</label>
								  <div class="controls">
									<input type="text" class="span6"   name="title" value="${pageScope.news.title}">
								  </div>
								</div>
								<div class="control-group">
								  <label class="control-label">CreateTime</label>
								  <div class="controls">
									<input type="text" class="span6"  name="createTime" value="<fmt:formatDate value="${pageScope.news.createTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date" dateStyle="long" />">
								  </div>
								</div>
								<img src="<%=relativePath%>" class='img-polaroid' align="center" >
								<input type="hidden" value="${pageScope.news.img}" name="img">
								<div class="control-group">
								  <label class="control-label">Upload Image</label>
								 	 <div class="file-loading">
	            						<input id="kv-explorer" type="file" multiple name="img">
	        						</div>
								</div>          
								<div class="control-group">
								  <label class="control-label">Content</label>
								  <div class="controls">
									<textarea  id="textarea2" rows="5"  name="content" value="" class="span6">${pageScope.news.content}</textarea>
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
    

    <!-- Form Validate -->
    <script src="${pageScope.basePath}js/self/common/jquery.validate.js" type="text/javascript"></script>
	<script src="${pageScope.basePath}js/self/admin/validation-for-news.js"></script>
	
	<!-- upload begin -->
	    <script src="${pageScope.basePath}lib/upload/js/fileinput.js" type="text/javascript"></script>
	    <script src="${pageScope.basePath}lib/upload/themes/explorer-fa/theme.js" type="text/javascript"></script>
	    <script src="${pageScope.basePath}lib/upload/themes/fa/theme.js" type="text/javascript"></script>
	<!-- upload end -->
	
	<script src="${pageScope.basePath}js/self/common/util.js" type="text/javascript"></script>
    <script type="text/javascript">
		    	$(document).ready(function(){
		    			$("#result").css("block","none");
			    		$("#submitButton").click(function(){
			    				if($("#newsModifyForm").valid()){
			    						$("#result").css("display","none");
			    						var myForm=document.getElementById("newsModifyForm");//获取前台表单
					    				var formData=new FormData(myForm);//
					    				$.ajax({
					    					"url":"newscontrol",
					    					"data":formData,
					    					"type":"POST",
					    					"dataType":"json",
					    					"success":afterManipulation,
					    					"processData":false,
					                		"contentType":false,
					            			"cache": false
					    				});
			    				
			    				}
			    				
			    			}
			    		);
			  		 	$("#upperDelButton").click(function(){
				    		var delId=$(this).attr("rel");
				    		$("#delId").val(delId);
			    		});
				    	$("#modalDel").click(function(){
				    		$("#myModal").modal('hide');
				    		var data="opr=del&delId="+$("#delId").val();
					    		$.getJSON("newscontrol",data,afterManipulation);
				    	});
				    	$("div.span9").on("click","#goBackToList",function(){
    						location.href="pages/admin/news.jsp";
    					});
		    		
		    	});
    	
		    	$(document).ready(function () {
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

