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
            <h1 class="page-title">Add Category</h1>
	<div class="btn-toolbar">
    <button class="btn btn-primary" id="saveCategoryBtn" type="button"><i class="icon-save"></i> Save</button>
    <button class="btn btn-primary" id="goBackToList"><i class="icon-user"></i> Category List</button>
  <div class="btn-group">
  </div>
</div>
<div id="result" style="display:none;position:absolute;z-index=5; font-size:16px;" class="alert alert-info" role="alert"></div>
<div class="well">
    <form id="categoryAddForm" method="get" action="">
    	<input type="hidden" name="opr" value="add">
        <label>Category Name</label>
        <input type="text" value="" class="input-xlarge" name="name">
        <label>Category Type</label>
       	<label class="radio">
  		<input type="radio" name="type"  value="1" checked>First
		</label>
		<label class="radio">
  		<input type="radio" name="type"  value="2">Second
		</label>
		<label class="radio">
  		<input type="radio" name="type"  value="3">Third
		</label>
		<input type="hidden" name="parentId" id="parentId">
		<label>Parent Category</label>
		<div class="btn-group">
			  <a class="btn dropdown-toggle btn-success" data-toggle="dropdown" href="#" id="showBtn">
			    Click to Select!
			    <span class="caret"></span>
			  </a>
			  <ul class="dropdown-menu" id="select">
			    <!-- dropdown menu links -->
			    	<li ><a href="javascript:;" rel="0">请选择！</a></li>
			  </ul>
		</div>
		<br/>
		<label>Parent Category Name</label>
		<input type="text" readonly id="parentName" class="input-xlarge">
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
    <script src="${pageScope.basePath}js/self/common/jquery.validate.js" type="text/javascript"></script>
     <script src="${pageScope.basePath}js/self/admin/validation-for-category.js"></script>
     <script src="${pageScope.basePath}js/self/common/util.js"></script>
    <script type="text/javascript">
   	$(document).ready(function(){
   			var $showBtn=$("#showBtn");//显示父类按钮
	    	var $formArea=$("#categoryAddForm");//获取表单
	    	var $inputs=$formArea.find(":input");//所有的表单input元素
	    	var $select=$("#select");//获取父类按钮下拉菜单
	    	
	    	
	    	$("#saveCategoryBtn").click(function(){
	    		if($("#categoryAddForm").valid()){
	    			var serialized=$inputs.serialize();
	    			$.getJSON("categorycontrol",serialized,afterManipulation);
	    		}
	    	});//保存！
	    	
	    	$("div.span9").on("click","#goBackToList",function(){
	    		location.href="pages/admin/categories.jsp";
	    	});//跳转回项目列表！
	    	
	    	$("input[name='type']").click(function(){initParentCategory();});//动态获得父类类型
	    	
	    	function initParentCategory(){
	    		$("#saveCategoryBtn").attr("disabled",true);
	    		var $checkedRadio=$("input:radio:checked");
	    		$select.empty();
	    		$select.append("<li ><a href='javascript:;' rel='0' id='default'>请选择！</a></li>");
	    		var data="opr=listAllWithClues&clue1=type&clueNumber=1";
	    		if($checkedRadio.val()==2){
	    			data+="&clueValue1=1";
	    			$.getJSON("categorycontrol",data,fillOptions);
	    		}else if($checkedRadio.val()==3){
	    			data+="&clueValue1=1";
	    			$.getJSON("categorycontrol",data,fillOptions);
	    		}else{
	    			$showBtn.attr("disabled",true);
	    			$select.addClass("disabled",true);
	    			$select.empty();
	    			$("#parentId").val("0");//将0作为所有一级分类的父分类！
	    			$("#saveCategoryBtn").attr("disabled",false);
	    			$("#parentName").val("none");
	    		}
	    		
	    	}
	    	
	    	function fillOptions(data){
	    		var $checkedRadio=$("input:radio:checked");
	    		var entity=data[1];
	    		if($.isEmptyObject(entity)){
	    			$("#result").removeClass("alert-info");
	    			$("#result").addClass("alert-danger");
	    			$("#result").html("所选分类无父分类！").fadeIn(1000).fadeOut(5000);
	    			}else{
	    				if($checkedRadio.val()==2){
	    					$select.empty();//请选择一条会被清除
	    					for(var i=0;i<entity.length;i++){
	    					var $temp=$("<li></li>");
	    					var $temp1=$("<a href='javascript:;' rel='"+entity[i].id+"'>"+entity[i].name+"</a>").click(function(){$("#parentId").val($(this).attr("rel"));$("#saveCategoryBtn").attr("disabled",false);$("#parentName").val($(this).text());});
	    					$temp.append($temp1);
			    			$select.append($temp);
	    				}
	    				$showBtn.attr("disabled",false);
	    				}else if($checkedRadio.val()==3){//如果选择了三级分类，那么二级分类的结果要以子菜单的形式附在一级的结果下面！
	    					$select.empty();//请选择一条会被清除
	    					//先将二级菜单拼接！
	    					for(var i=0;i<entity.length;i++){
	    					var $temp=$("<li></li>");
	    					var $temp1=$("<a href='javascript:;' tabindex='-1' rel='"+entity[i].id+"'>"+entity[i].name+"</a>");
	    					$temp.append($temp1);
			    			$select.append($temp);
	    					}
	    					for(var i=0;i<entity.length;i++){
	    						var $parent=entity[i];
	    						var $clueValue2=$parent.id;
	    						var data1="opr=listAllWithClues&clueNumber=2&clue1=type&clue2=parentId&clueValue1=2&clueValue2="+$clueValue2;
	    						//$.ajaxSettings.async = false;
	    						$.getJSON("categorycontrol",data1,fillSubMenu);
	    						
	    						function fillSubMenu(data2){
	    							var entity2=data2[1];
	    							if($.isEmptyObject(entity2)){//如果该一级下不存在二级商品
										//不进行任何操作！
	    							}else{//如果该一级下存在二级商品
	    								var $parentContainer1=$("#select").find("a[rel='"+entity2[0].parentId+"']");
	    								$parentContainer2=$parentContainer1.parent();
	    								$parentContainer2.addClass("dropdown-submenu");
	    								//var $parentContainer3=$("<li class='dropdown-submenu'></li>");
	    								//var $parentContainer4=$("<a tabindex='-1' href='javascript:;'>"+$parent.name+"</a>");
	    								//$parentContainer3.append($parentContainer4);
	    								var $parentContainer5=$("<ul class='dropdown-menu'></ul>");
	    								for(var j=0;j<entity2.length;j++){
	    									var $sonContainer=$("<li></li>");
	    									var $son=$("<a tabindex='-1' href='javascript:;' rel='"+entity2[j].id+"'>"+entity2[j].name+"</a>").click(function(){$("#parentId").val($(this).attr("rel"));$("#saveCategoryBtn").attr("disabled",false);$("#parentName").val($(this).text());});
	    									$sonContainer.append($son);
	    									$parentContainer5.append($sonContainer);
	    								}
	    								$parentContainer2.append($parentContainer5);
	    								$select.append($parentContainer2);
	    							}
	    						}
	    					}
	    					$showBtn.attr("disabled",false);
	    				}//
	    		}
	    	}
	    	
	    	
	    	
	    	initParentCategory();
   	});
   	
    
    </script>
  </body>
</html>


