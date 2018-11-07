var $table=$("tbody");
var $mainArea=$("div.span9");
var $categoryBtn=$("#showBtn");
var $showBtn2=$("#product-level-info");//显示内容的按钮！

//初始化页面后的一切
//将类别id替换成类别名称的方法！包含了页面后期处理的一切！
function parseDisplay(data){//传入的data为拿到的含分页信息的对象商品列表
	$("#totalNum").html(data[1].totalCount);
	$("#totalPages").html(data[1].totalPageCount);
	$table.html("");
	$("div.pagination").remove();
	var data1=data[1].list;
	if(data1!=null&&data1!=undefined&&data1.length>0){
		var currentIndex=0;
		var times=data1.length;
		//该方法传入一个商品的信息
		
		function retrieveCategoryName(){//data1是传入的所有商品
			var current=data1[currentIndex];
			if(currentIndex>=times){
				return;
			}
			var sent1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel1;
			$.getJSON("categorycontrol",sent1,function(data2){
				if(data2!=null&&data2!=undefined&&!$.isEmptyObject(data2[1])){
					current.categoryLevel1=data2[1][0].name;
					var sent2="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel2;
					$.getJSON("categorycontrol",sent2,function(data3){
						if(data3!=null&&data!=undefined&&!$.isEmptyObject(data3[1])){
							current.categoryLevel2=data3[1][0].name;
							var sent3="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel3;
							$.getJSON("categorycontrol",sent3,function(data4){
								if(data4!=null&&data4!=undefined&&!$.isEmptyObject(data4[1])){
									current.categoryLevel3=data4[1][0].name;
									if(current.isDelete==0){
										current.isDelete="on";
									}else if(current.isDelete==1){
										current.isDelete="off";
									}else{
										current.isDelete="wrong";
									}//改变商品状态！
									//进行拼接
									showProduct(current);
									currentIndex++;
									retrieveCategoryName();
								}
							});
						}
					});
				}
			});
		}
		//改变商品类型参数！
		retrieveCategoryName();
		showPagi(data[1],"productcontrol");
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



function getProducts(pageIndex,url){
	var data="opr=list";
	if(pageIndex&&pageIndex>0){
		data+="&pageIndex="+pageIndex;
		$.getJSON(url,data,parseDisplay);
	}
		
}//初始化页面时调用的方法

function showProduct(entity){
		var product=entity;
		var $temp=$("<tr><td>"+product.name+"</td><td>"+product.description+"</td><td>"+product.price+"</td><td>"+product.stock+"</td><td>"+product.categoryLevel1+"</td><td>"+product.categoryLevel2+"</td><td>"+product.categoryLevel3+"</td><td>"+product.isDelete+"</td></tr>");
		var $imgTd=$("<td><img src='"+parsePath(product.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
		$temp.append($imgTd);
		var $lastTd=$("<td></td>");
		var $modifyButton=$("<a href='pages/admin/product_edit.jsp?id="+product.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
		var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+product.id+"'><i class='icon-remove'></i></a>");
		var $sellBtn=$("<a href='javascript:;' data-target='#myModal2' role='button' data-toggle='modal' sell='"+product.isDelete+"' id='sellBtn' rel='"+product.id+"'><i class='icon-shopping-cart'></i></a>");
		$lastTd.append($modifyButton);
		$lastTd.append($removeBtn);
		$lastTd.append($sellBtn);
		$temp.append($lastTd);
		$table.append($temp);
}

function showPagi(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getProducts($(this).children().text(),url)});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getProducts(1,url);});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getProducts(entity.currentPageNo-1,url);});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getProducts($(this).children().text(),url)});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getProducts(entity.currentPageNo+1,url);});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getProducts(entity.totalPageCount,url);});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}











//选择了一级以后！
function getFirstLevelProducts(pageIndex,id){
	var sent="opr=listWithClues&pageIndex="+pageIndex+"&clueNumber=1&clue1=categoryLevel1&clueValue1="+id;
	$.getJSON("productcontrol",sent,parseDisplay1);
}


function parseDisplay1(data){//传入的data为拿到的含分页信息的对象商品列表
	$("#totalNum").html(data[1].totalCount);
	$("#totalPages").html(data[1].totalPageCount);
	$table.html("");
	$("div.pagination").remove();
	var data1=data[1].list;
	if(data1!=null&&data1!=undefined&&data1.length>0){
		var currentIndex=0;
		var times=data1.length;
		//该方法传入一个商品的信息
		
		function retrieveCategoryName(){//data1是传入的所有商品
			var current=data1[currentIndex];
			if(currentIndex>=times){
				return;
			}
			var sent1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel1;
			$.getJSON("categorycontrol",sent1,function(data2){
				if(data2!=null&&data2!=undefined&&!$.isEmptyObject(data2[1])){
					current.categoryLevel1=data2[1][0].name;
					var sent2="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel2;
					$.getJSON("categorycontrol",sent2,function(data3){
						if(data3!=null&&data!=undefined&&!$.isEmptyObject(data3[1])){
							current.categoryLevel2=data3[1][0].name;
							var sent3="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel3;
							$.getJSON("categorycontrol",sent3,function(data4){
								if(data4!=null&&data4!=undefined&&!$.isEmptyObject(data4[1])){
									current.categoryLevel3=data4[1][0].name;
									if(current.isDelete==0){
										current.isDelete="on";
									}else if(current.isDelete==1){
										current.isDelete="off";
									}else{
										current.isDelete="wrong";
									}//改变商品状态！
									//进行拼接
									showProduct1(current);
									currentIndex++;
									retrieveCategoryName();
								}
							});
						}
					});
				}
			});
		}
		//改变商品类型参数！
		retrieveCategoryName();
		
}
	showPagi1(data[1],"productcontrol");
}


function showProduct1(entity){
	//拼接页面商品的方法，主要是点击页码的操作有所不同
	var product=entity;
	var $temp=$("<tr><td>"+product.name+"</td><td>"+product.description+"</td><td>"+product.price+"</td><td>"+product.stock+"</td><td>"+product.categoryLevel1+"</td><td>"+product.categoryLevel2+"</td><td>"+product.categoryLevel3+"</td><td>"+product.isDelete+"</td></tr>");
	var $imgTd=$("<td><img src='"+parsePath(product.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
	$temp.append($imgTd);
	var $lastTd=$("<td></td>");
	var $modifyButton=$("<a href='pages/admin/product_edit.jsp?id="+product.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
	var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+product.id+"'><i class='icon-remove'></i></a>");
	var $sellBtn=$("<a href='javascript:;' data-target='#myModal2' role='button' sell='"+product.isDelete+"' data-toggle='modal' id='sellBtn' rel='"+product.id+"'><i class='icon-shopping-cart'></i></a>");
	$lastTd.append($modifyButton);
	$lastTd.append($removeBtn);
	$lastTd.append($sellBtn);
	$temp.append($lastTd);
	$table.append($temp);
}


function showPagi1(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getFirstLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getFirstLevelProducts(1,$showBtn2.attr("currentId"));});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getFirstLevelProducts(entity.currentPageNo-1,$showBtn2.attr("currentId"));});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getFirstLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getFirstLevelProducts(entity.currentPageNo+1,$showBtn2.attr("currentId"));});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getFirstLevelProducts(entity.totalPageCount,$showBtn2.attr("currentId"));});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}








//展示第二级产品的系列方法
function getSecondLevelProducts(pageIndex,id){
	var sent="opr=listWithClues&pageIndex="+pageIndex+"&clueNumber=1&clue1=categoryLevel2&clueValue1="+id;
	$.getJSON("productcontrol",sent,parseDisplay2);
}


function parseDisplay2(data){//传入的data为拿到的含分页信息的对象商品列表
	$("#totalNum").html(data[1].totalCount);
	$("#totalPages").html(data[1].totalPageCount);
	$table.html("");
	$("div.pagination").remove();
	var data1=data[1].list;
	if(data1!=null&&data1!=undefined&&data1.length>0){
		var currentIndex=0;
		var times=data1.length;
		//该方法传入一个商品的信息
		
		function retrieveCategoryName(){//data1是传入的所有商品
			var current=data1[currentIndex];
			if(currentIndex>=times){
				return;
			}
			var sent1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel1;
			$.getJSON("categorycontrol",sent1,function(data2){
				if(data2!=null&&data2!=undefined&&!$.isEmptyObject(data2[1])){
					current.categoryLevel1=data2[1][0].name;
					var sent2="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel2;
					$.getJSON("categorycontrol",sent2,function(data3){
						if(data3!=null&&data!=undefined&&!$.isEmptyObject(data3[1])){
							current.categoryLevel2=data3[1][0].name;
							var sent3="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel3;
							$.getJSON("categorycontrol",sent3,function(data4){
								if(data4!=null&&data4!=undefined&&!$.isEmptyObject(data4[1])){
									current.categoryLevel3=data4[1][0].name;
									if(current.isDelete==0){
										current.isDelete="on";
									}else if(current.isDelete==1){
										current.isDelete="off";
									}else{
										current.isDelete="wrong";
									}//改变商品状态！
									//进行拼接
									showProduct2(current);
									currentIndex++;
									retrieveCategoryName();
								}
							});
						}
					});
				}
			});
		}
		//改变商品类型参数！
		retrieveCategoryName();
		
}
	showPagi2(data[1],"productcontrol");
}


function showProduct2(entity){
		var product=entity;
		var $temp=$("<tr><td>"+product.name+"</td><td>"+product.description+"</td><td>"+product.price+"</td><td>"+product.stock+"</td><td>"+product.categoryLevel1+"</td><td>"+product.categoryLevel2+"</td><td>"+product.categoryLevel3+"</td><td>"+product.isDelete+"</td></tr>");
		var $imgTd=$("<td><img src='"+parsePath(product.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
		$temp.append($imgTd);
		var $lastTd=$("<td></td>");
		var $modifyButton=$("<a href='pages/admin/product_edit.jsp?id="+product.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
		var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+product.id+"'><i class='icon-remove'></i></a>");
		var $sellBtn=$("<a href='javascript:;' data-target='#myModal2' role='button' data-toggle='modal'  sell='"+product.isDelete+"'   id='sellBtn' rel='"+product.id+"'><i class='icon-shopping-cart'></i></a>");
		$lastTd.append($modifyButton);
		$lastTd.append($removeBtn);
		$lastTd.append($sellBtn);
		$temp.append($lastTd);
		$table.append($temp);	
}

function showPagi2(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getSecondLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getSecondLevelProducts(1,$showBtn2.attr("currentId"));});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getSecondLevelProducts(entity.currentPageNo-1,$showBtn2.attr("currentId"));});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getSecondLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getSecondLevelProducts(entity.currentPageNo+1,$showBtn2.attr("currentId"));});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getSecondLevelProducts(entity.totalPageCount,$showBtn2.attr("currentId"));});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}







//展示第三级商品的系列方法
function getThirdLevelProducts(pageIndex,id){
	var sent="opr=listWithClues&pageIndex="+pageIndex+"&clueNumber=1&clue1=categoryLevel3&clueValue1="+id;
	$.getJSON("productcontrol",sent,parseDisplay3);
}

function parseDisplay3(data){//传入的data为拿到的含分页信息的对象商品列表
	$("#totalNum").html(data[1].totalCount);
	$("#totalPages").html(data[1].totalPageCount);
	$table.html("");
	$("div.pagination").remove();
	var data1=data[1].list;
	if(data1!=null&&data1!=undefined&&data1.length>0){
		var currentIndex=0;
		var times=data1.length;
		//该方法传入一个商品的信息
		
		function retrieveCategoryName(){//data1是传入的所有商品
			var current=data1[currentIndex];
			if(currentIndex>=times){
				return;
			}
			var sent1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel1;
			$.getJSON("categorycontrol",sent1,function(data2){
				if(data2!=null&&data2!=undefined&&!$.isEmptyObject(data2[1])){
					current.categoryLevel1=data2[1][0].name;
					var sent2="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel2;
					$.getJSON("categorycontrol",sent2,function(data3){
						if(data3!=null&&data!=undefined&&!$.isEmptyObject(data3[1])){
							current.categoryLevel2=data3[1][0].name;
							var sent3="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+current.categoryLevel3;
							$.getJSON("categorycontrol",sent3,function(data4){
								if(data4!=null&&data4!=undefined&&!$.isEmptyObject(data4[1])){
									current.categoryLevel3=data4[1][0].name;
									if(current.isDelete==0){
										current.isDelete="on";
									}else if(current.isDelete==1){
										current.isDelete="off";
									}else{
										current.isDelete="wrong";
									}//改变商品状态！
									//进行拼接
									showProduct3(current);
									currentIndex++;
									retrieveCategoryName();
								}
							});
						}
					});
				}
			});
		}
		//改变商品类型参数！
		retrieveCategoryName();
}
	showPagi3(data[1],"productcontrol");
}



function showProduct3(entity){
		var product=entity;
		var $temp=$("<tr><td>"+product.name+"</td><td>"+product.description+"</td><td>"+product.price+"</td><td>"+product.stock+"</td><td>"+product.categoryLevel1+"</td><td>"+product.categoryLevel2+"</td><td>"+product.categoryLevel3+"</td><td>"+product.isDelete+"</td></tr>");
		var $imgTd=$("<td><img src='"+parsePath(product.img)+"' class='img-polaroid' height='78.63' width='79.4'></td>");
		$temp.append($imgTd);
		var $lastTd=$("<td></td>");
		var $modifyButton=$("<a href='pages/admin/product_edit.jsp?id="+product.id+"' id='modifyBtn'><i class='icon-pencil'></i></a>");
		var $removeBtn=$("<a href='javascript:;' data-target='#myModal' role='button' data-toggle='modal' id='removeBtn' rel='"+product.id+"'><i class='icon-remove'></i></a>");
		var $sellBtn=$("<a href='javascript:;' data-target='#myModal2' role='button' data-toggle='modal' id='sellBtn' sell='"+product.isDelete+"' rel='"+product.id+"'><i class='icon-shopping-cart'></i></a>");
		$lastTd.append($modifyButton);
		$lastTd.append($removeBtn);
		$lastTd.append($sellBtn);
		$temp.append($lastTd);
		$table.append($temp);
}



function showPagi3(entity,url){
	var $pagination=$("<div class='pagination' align='center'></div>").appendTo($mainArea);
	var $temp1=$("<ul></ul>");
	var $current=$("<li class='active'><a href='javascript:;'>["+entity.currentPageNo+"/"+entity.totalPageCount+"]</a></li>");
	var count1=0;
	for(var i=entity.currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){getThirdLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity.currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){getThirdLevelProducts(1,$showBtn2.attr("currentId"));});
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){getThirdLevelProducts(entity.currentPageNo-1,$showBtn2.attr("currentId"));});
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity.currentPageNo;j<=entity.totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){getThirdLevelProducts($(this).children().text(),$showBtn2.attr("currentId"));});
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity.currentPageNo<entity.totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){getThirdLevelProducts(entity.currentPageNo+1,$showBtn2.attr("currentId"));});
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){getThirdLevelProducts(entity.totalPageCount,$showBtn2.attr("currentId"));});
		$temp1.append($next).append($last);
	}
	$pagination.append($temp1);
}




