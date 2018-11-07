var $table=$("tbody");
var $mainArea=$("div.span9");
var $categoryBtn=$("#showBtn");
function showPagi(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getPagi($(this).children().text(),url)});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getPagi(1,url);});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getPagi(entity.currentPageNo-1,url);});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getPagi($(this).children().text(),url)});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getPagi(entity.currentPageNo+1,url);});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getPagi(entity.totalPageCount,url);});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}

//适用于有页面替换的情形！
function showPagi2(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getPagi2($(this).children().text(),url,$categoryBtn.attr("rel"))});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getPagi2(1,url,$categoryBtn.attr("rel"));});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getPagi2(entity.currentPageNo-1,url,$categoryBtn.attr("rel"));});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getPagi2($(this).children().text(),url,$categoryBtn.attr("rel"))});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getPagi2(entity.currentPageNo+1,url,$categoryBtn.attr("rel"));});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getPagi2(entity.totalPageCount,url,$categoryBtn.attr("rel"));});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}



//

//
function getPagi2(pageIndex,url,clicked){
	var data="opr=listWithClues&clueNumber=1&clue1=type&clueValue1="+clicked;
	if(pageIndex&&pageIndex>0){
		data+="&pageIndex="+pageIndex;
	$.getJSON(url,data,pagi2);
	}
}
//



function pagi2(data){
	var type=data[0].type;
	var entity=data[1];
	$("#totalNum").html(entity.totalCount);
	$("#totalPages").html(entity.totalPageCount);
	$table.html("");
	$("div.pagination").remove();
	if(entity.list==null){
		$mainArea.html("");
		$mainArea.text("出现错误，请稍后再试或与管理员联系");
	}else if(entity.list.length==0){
		$mainArea.html("");
		$mainArea.text("当前没有相关信息！");
	}else{
		//
		var category;
		var currentIndex=0;
		function appendCategory(){
			if(currentIndex>=entity.list.length){
				return;
			}
			category=entity.list[currentIndex];
			var data1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+category.parentId;
			$.getJSON("categorycontrol",data1,replaceCategory2);
			function replaceCategory2(data){
				currentIndex++;
				var $parent=data[1][0];
				var $parentName;
				if($.isEmptyObject($parent)){
					$parentName="none";
				}else{
					$parentName=$parent.name;
				}
				var $temp=$("<tr><td>"+category.name+"</td><td>"+category.type+"</td><td>"+$parentName+"</td></tr>");
				var $lastTd=$("<td></td>");
				var $modifyButton=$("<a href='pages/admin/category_edit.jsp?id="+category.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
				var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+category.id+"'><i class='icon-remove'></i></a>");
				$lastTd.append($modifyButton);
				$lastTd.append($removeBtn);
				$temp.append($lastTd);
				$table.append($temp);
				appendCategory();
			}
			
		}//当前页面展示完毕
		appendCategory();
		showPagi2(entity,"categorycontrol");						
		
	}
}



function getPagi(pageIndex,url){
    		var data="opr=list";
    		if(pageIndex&&pageIndex>0){
    			data+="&pageIndex="+pageIndex;
    			$.getJSON(url,data,pagi);
    		}
    		
}
    	//callback
function pagi(data){
		var type=data[0].type;
		var entity=data[1];
		$("#totalNum").html(entity.totalCount);
		$("#totalPages").html(entity.totalPageCount);
		$table.html("");
		$("div.pagination").remove();
		if(entity.list==null){
			$mainArea.html("");
			$mainArea.text("出现错误，请稍后再试或与管理员联系");
		}else if(entity.list.length==0){
			$mainArea.html("");
			$mainArea.text("当前没有相关信息！");
		}else{
			if(type=="EasyBuy_User"){
				var user;
			for(var i=0;i<entity.list.length;i++){
				user=entity.list[i];
				var $temp=$("<tr><td>"+user.userName+"</td><td>"+user.realName+"</td><td>"+user.password+"</td>"+
				"<td>"+user.identityCode+"</td>"+"<td>"+user.email+"</td><td>"+user.mobile+"</td></tr>");
				var $lastTd=$("<td></td>");
				var $modifyButton=$("<a href='pages/admin/user_edit.jsp?id="+user.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
				var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+user.id+"'><i class='icon-remove'></i></a>");
				$lastTd.append($modifyButton);
				$lastTd.append($removeBtn);
				$temp.append($lastTd);
				$table.append($temp);
			}//当前页面的内容展示完毕
			showPagi(entity,"usercontrol");
			
			}else if(type=="EasyBuy_News"){
				var news;
				for(var i=0;i<entity.list.length;i++){
					news=entity.list[i];
					var $temp=$("<tr><td>"+news.title+"</td><td>"+news.content+"</td><td>"+news.createTime+"</td></tr>");
					var $imgTd=$("<td><img src='"+parsePath(news.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
					$temp.append($imgTd);
					var $lastTd=$("<td></td>");
					var $modifyButton=$("<a href='pages/admin/news_edit.jsp?id="+news.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
					var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+news.id+"'><i class='icon-remove'></i></a>");
					$lastTd.append($modifyButton);
					$lastTd.append($removeBtn);
					$temp.append($lastTd);
					$table.append($temp);
				}//当前页面的内容展示完毕
				showPagi(entity,"newscontrol");
			}else if(type=="EasyBuy_Product"){//当页面初始化时的回调方法！
				var product;
				//parseDisplay(entity.list);
				for(var i=0;i<entity.list.length;i++){
					product=entity.list[i];
					var $temp=$("<tr><td>"+product.name+"</td><td>"+product.description+"</td><td>"+product.price+"</td><td>"+product.stock+"</td><td>"+product.categoryLevel1+"</td><td>"+product.categoryLevel2+"</td><td>"+product.categoryLevel3+"</td><td>"+product.isDelete+"</td></tr>");
					var $imgTd=$("<td><img src='"+parsePath(product.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
					$temp.append($imgTd);
					var $lastTd=$("<td></td>");
					var $modifyButton=$("<a href='pages/admin/product_edit.jsp?id="+product.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
					var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+product.id+"'><i class='icon-remove'></i></a>");
					var $sellBtn=$("<a href='javascript:;' data-target='#myModal2' role='button' data-toggle='modal' id='sellBtn' rel='"+product.id+"'><i class='icon-shopping-cart'></i></a>");
					$lastTd.append($modifyButton);
					$lastTd.append($removeBtn);
					$lastTd.append($sellBtn);
					$temp.append($lastTd);
					$table.append($temp);
				}//当前页面的内容展示完毕
				showPagi(entity,"productcontrol");
			}else if(type=="EasyBuy_ProductCategory"){
				var category;
				var currentIndex=0;
				function appendCategory(){
					if(currentIndex>=entity.list.length){
						return;
					}
					category=entity.list[currentIndex];
					var data1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+category.parentId;
					$.getJSON("categorycontrol",data1,replaceCategory2);
					function replaceCategory2(data){
						currentIndex++;
						var $parent=data[1][0];
						var $parentName;
						if($.isEmptyObject($parent)){
							$parentName="none";
						}else{
							$parentName=$parent.name;
						}
						var $temp=$("<tr><td>"+category.name+"</td><td>"+category.type+"</td><td>"+$parentName+"</td></tr>");
						var $lastTd=$("<td></td>");
						var $modifyButton=$("<a href='pages/admin/category_edit.jsp?id="+category.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
						var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+category.id+"'><i class='icon-remove'></i></a>");
						$lastTd.append($modifyButton);
						$lastTd.append($removeBtn);
						$temp.append($lastTd);
						$table.append($temp);
						appendCategory();
					}
					
				}//当前页面展示完毕
				appendCategory();
				showPagi(entity,"categorycontrol");
				}
			}
			
		}

    	
    	
//动态绑定事件,展示页面上的删除按钮的事件绑定
$("div.span9").on("click","#removeBtn",function(){
	var delId=$(this).attr("rel");
	$("#delId").val(delId);
});
$("div.span9").on("click","i.icon-remove",function(){
	var delId=$(this).parent().attr("rel");
	$("#delId").val(delId);
});
    	
    	
    	
