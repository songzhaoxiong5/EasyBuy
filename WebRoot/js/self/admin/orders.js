var $mainArea=$("div.well");//包含订单的主容器
var $filter=$("#filterBtn");//用于过滤的按钮


//默认的分页方法,entity为pageObj即可
function showPagi(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getOrder($(this).children().text(),url)});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getOrder(1,url);});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getOrder(entity.currentPageNo-1,url);});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getOrder($(this).children().text(),url)});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getOrder(entity.currentPageNo+1,url);});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getOrder(entity.totalPageCount,url);});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}

//默认的获取订单的方法
function getOrder(pageIndex,url){
	var data="opr=list";
	if(pageIndex&&pageIndex>0){
		data+="&pageIndex="+pageIndex;
		$.getJSON(url,data,orderPagi);
	}
}
//默认拼接页面的方法
function orderPagi(data){
	var $pageObj=data.pageObj;
	$("#totalNum").html($pageObj.totalCount);
	$("#totalPages").html($pageObj.totalPageCount);
	$mainArea.html("");//清除工作区
	$("div.pagination").remove();//清除页码
	if($pageObj.list==null){
		$mainArea.html("");
		$mainArea.text("出现错误，请稍后再试或与管理员联系");
	}else if($pageObj.list.length==0){
		$mainArea.html("");
		$mainArea.text("当前没有相关信息！");
	}else{
		var $wrapperList=data.wrapperList;//订单封装体
		//开始拼接
		for(var i=0;i<$pageObj.list.length;i++){
			var $order=$wrapperList[i].order;
			var $table=$("<table class='table'></table>").appendTo($mainArea);
			var $thead1=$("<thead>"+
			    		"<tr>"+
			    			"<th>UserName:<span>"+$order.userName+"</span></th>"+
			    			"<th>SerialNumber:<span>"+$order.serialNumber+"</span></th>"+
			    			"<th>Address:<span>"+$order.userAddress+"</span></th>"+
			    			"<th>Cost:<span>"+$order.cost+"</span></th>"+
			    			"<th><a href='pages/admin/order_edit.jsp?id="+$order.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>&nbsp;&nbsp;"+
			    			"<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+$order.id+"'><i class='icon-remove'></i></a>"+
			    			"</th>"+
				          	"<th style='width: 26px;'></th>"+
				          	"</tr>"+
			    			"</thead>").appendTo($table);
			var $thead2=$("<thead>"+
				        "<tr>"+
				          "<th>Product Name</th>"+
				          "<th>Product Imgage</th>"+
				          "<th>Quantity</th>"+
				          "<th>Cost</th>"+
				        "</tr>"+
				      "</thead>").appendTo($table);
			var $tbody=$("<tbody></tbody>").appendTo($table);
			var $detailList=$wrapperList[i].detailList;
			if($.isEmptyObject($detailList)){
				continue;
			}//空订单正常是不应该存在的，前台就应该限定死！
			for(var j=0;j<$detailList.length;j++){
				var $detailContainer=$("<tr></tr>").appendTo($tbody);
				var $container1=$("<td>"+$detailList[j].productName+"</td>").appendTo($detailContainer);
				var $imgTd=$("<td><img src='"+parsePath($detailList[j].img)+"' class='img-polaroid' height='78.63' width='79.4'></td>").appendTo($detailContainer);//请配合util.js这个文件
				var $container2=$("<td>"+$detailList[j].orderDetail.quantity+"</td><td>"+$detailList[j].orderDetail.cost+"</td>").appendTo($detailContainer);
			}
			$table.append("<thead></thead>");
		}//拼接结束
		
		showPagi($pageObj,"ordercontrol");
	}
}


$("div.span9").on("click","#removeBtn",function(){
	var delId=$(this).attr("rel");
	$("#delId").val(delId);
});
$("div.span9").on("click","i.icon-remove",function(){
	var delId=$(this).parent().attr("rel");
	$("#delId").val(delId);
});

