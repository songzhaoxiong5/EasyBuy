//商品展示页面脚本文件
//加载时初始化三级联动菜单！>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

var $leftNavigation=$("ul#category");//三级联动菜单的父容器
var $currentCategory=$("#currentCategory");//当前选择的类型标识.html
var $showArea1=$("#showArea1");//grid展示区
var $showArea2=$("#showArea2");//list展示区
var $productsArea=$("#productsArea");//整个商品区
var $pagination=$("div.pagination");//页码区（静态）
var $status=$("#pagiStatus");//页码状态区（静态）
var $numFrom=$("#numFrom");//开始span
var $numTo=$("#numTo");//结束span
var $numTotal=$("#numTotal");//总数量
var $temp1=$("#pagiUl");//页码外侧ul
var $gridBtn=$("#gridBtn");//切换grid按钮
var $listBtn=$("#listBtn");//切换list按钮


function initProductCategories(){
	var sent1="opr=listAllWithClues&clueNumber=1&clue1=type&clueValue1=1";
	$.getJSON("categorycontrol",sent1,getFirstLevel);
}

function getFirstLevel(data1){
	var $firstLevelCategories=null;//获取的一级商品分类！
	if(data1[1]!=undefined&&data1[1]!=null)
	$firstLevelCategories=data1[1];
	if($.isEmptyObject($firstLevelCategories)){
		var $noParents=$("<li><a href='#'>No Categories For Now<i class='fa fa-angle-right'></i></a></li>");
		$leftNavigation.append($noParents);
		return;
	}
	var $firstCategory=null;//每一次遍历的一级分类
	var $firstCategoryContainer=null;//一级的DOM容器！
	var numberOfFirst=$firstLevelCategories.length;
	var currentIndexForLevel1=0;//第一层递归开始
	function formFirstLevel(){
		if(currentIndexForLevel1>=numberOfFirst){
			return;
		}
		$firstCategory=$firstLevelCategories[currentIndexForLevel1];
		var sent2="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=2&clue2=parentId&clueValue2="+$firstCategory.id;//获取当前一级下的二级分类
		$.getJSON("categorycontrol",sent2,getSecondLevel);
		function getSecondLevel(data2){ 
			var $secondLevelCategories=null;//获取的二级商品分类
			if(data2[1]!=undefined&&data2[1]!=null){
				$secondLevelCategories=data2[1];
				if($.isEmptyObject($secondLevelCategories)){
					$firstCategoryContainer=$("<li></li>").appendTo($leftNavigation);
					var $temp1=$("<a parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"<i class='fa fa-angle-right'></i></a>").click(function(){$currentCategory.html($(this).text());$currentCategory.attr("currentId",$(this).attr("selfId"));$currentCategory.attr("type","categoryLevel1");$gridBtn.tab("show");getSpecific($(this).attr("selfId"),1,12,getPagi1);}).appendTo($firstCategoryContainer);
					currentIndexForLevel1++;
					formFirstLevel();//相当于for循环中的continue
					return;//此次一层循环结束
				}
				$firstCategoryContainer=$("<li></li>").appendTo($leftNavigation);
				var $temp2=$("<a parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"<i class='fa fa-angle-right'></i></a>").click(function(){$currentCategory.html($(this).text());$currentCategory.attr("currentId",$(this).attr("selfId"));$currentCategory.attr("type","categoryLevel1");$gridBtn.tab("show");getSpecific($(this).attr("selfId"),1,12,getPagi1);}).appendTo($firstCategoryContainer);
				var $temp3=$("<ul class='sub-menu clearfix'></ul>").appendTo($firstCategoryContainer);
				var $temp4=$("<li class='sub-sec col-lg-6 col-md-6'></li>").appendTo($temp3);
				var $temp5=$("<ul></ul>").appendTo($temp4);
				var $secondCategory=null;//遍历的二级分类！
				var $secondCategoryContainer=null;//二级的DOM容器
				var numberOfSecond=$secondLevelCategories.length;
				var currentIndexForLevel2=0;
				function formSecondLevel(){
					if(currentIndexForLevel2>=numberOfSecond){
						return;
					}
					$secondCategory=$secondLevelCategories[currentIndexForLevel2];
					var sent3="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=3&clue2=parentId&clueValue2="+$secondCategory.id;//获取当前二级下的三级分类
					$.getJSON("categorycontrol",sent3,getThirdLevel);
					function getThirdLevel(data3){
						var $thirdLevelCategories=null;//获取三级商品分类！
						if(data3[1]!=undefined&&data3[1]!=null){
							$thirdLevelCategories=data3[1];
							if($.isEmptyObject($thirdLevelCategories)){
								$secondCategoryContainer=$("<li></li>").appendTo($temp5);
								var $temp6=$("<a parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' class='title'  href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.attr("currentId",$(this).attr("selfId"));$currentCategory.attr("type","categoryLevel2");$gridBtn.tab("show");getSpecific($(this).attr("selfId"),1,12,getPagi1);}).appendTo($secondCategoryContainer);
								currentIndexForLevel2++;
								formSecondLevel();
								return;
							}
							$secondCategoryContainer=$("<li></li>").appendTo($temp5);
							var $temp7=$("<a parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' class='title'  href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.attr("currentId",$(this).attr("selfId"));$currentCategory.attr("type","categoryLevel2");$gridBtn.tab("show");getSpecific($(this).attr("selfId"),1,12,getPagi1);}).appendTo($secondCategoryContainer);
							var $thirdCategory=null;//遍历的三级分类
							var $thirdCategoryContainer=null;//三级分类的容器
							var numberOfThird=$thirdLevelCategories.length;
							for(var i=0;i<numberOfThird;i++){
								$thirdCategory=$thirdLevelCategories[i];
								var $temp8=$("<li></li>").appendTo($temp5);
								var $temp9=$("<a  parentId='"+$thirdCategory.parentId+"' selfId='"+$thirdCategory.id+"' href='javascript:;'>"+$thirdCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.attr("currentId",$(this).attr("selfId"));$currentCategory.attr("type","categoryLevel3");$gridBtn.tab("show");getSpecific($(this).attr("selfId"),1,12,getPagi1);}).appendTo($temp8);
								//<li><a href="#">Apple Mobiles</a></li>
							}
				}
						currentIndexForLevel2++;
						formSecondLevel();
				
			}
		}
				formSecondLevel();//第二层递归的入口！
	}
		currentIndexForLevel1++;
		formFirstLevel();//为了保证数据的正确性，一定是在回调函数的结尾调用另外一次的外部函数
}

}
	formFirstLevel();//第一层递归的入口！
}



//显示商品的各种方法！>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getProducts(pageIndex,pageSize,fn){
	$("#currentCategory").html("Welcome!");
	var sent="opr=listWithClues&clueNumber=1&clue1=isDelete&clueValue1=0&pageSize="+pageSize;
	if(pageIndex&&pageIndex>0){
		sent+="&pageIndex="+pageIndex;
	$.getJSON("productcontrol",sent,fn);
	}
}

function getSpecific(currentId,pageIndex,pageSize,fn){
	var sent="opr=listWithClues&clueNumber=2&clue1=isDelete&clueValue1=0&clue2="+$currentCategory.attr("type")+"&clueValue2="+currentId+"&pageSize="+pageSize;
	if(pageIndex&&pageIndex>0){
		sent+="&pageIndex="+pageIndex;
	$.getJSON("productcontrol",sent,fn);
	}
}

//未点击list时回调方法
function getPagi1(data){
	clear($showArea1);//grid模式
	clear($temp1);//清除页码
	var $productList=data[1].list;
	if(!$.isEmptyObject($productList)){
		fillArea1(data);
	}
}
//点击list时的回调方法
function getPagi2(data){
	clear($showArea2);
	clear($temp1);
	var $productList=data[1].list;
	if(!$.isEmptyObject($productList)){
		fillArea2(data);
	}
}

$gridBtn.click(function(){
	click1(1);
});

$listBtn.click(function(){
	click2(1);
});



//清除相关容器的方法
function clear(parentContainer){
	parentContainer.html("");
}

//拼接grid的方法
function fillArea1(entity){
	var list=entity[1].list;
	for(var i=0;i<list.length;i++){
		var $outerContainer=$("<div class='col-lg-3 col-md-4 col-sm-4 col-xs-12'>").appendTo($showArea1);
		var $productContainer=$("<div class='single-product'></div>").appendTo($outerContainer);
		var $imgContainer=$("<a href='javascript:;' productId='"+list[i].id+"' class='gridImg footprint'></a>").appendTo($productContainer);
		var $img1=$("<img class='primary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($imgContainer);
		var $img2=$("<img class='secondary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($imgContainer);
		var $i1=$("<i class='fa fa-expand'></i>").appendTo($imgContainer);
		var $productInfo=$("<div class='product-info'></div>").appendTo($productContainer);
		var $gridNameContainer=$("<h4></h4>").appendTo($productInfo);
		var $gridName=$("<a href='javascript:;'  productId='"+list[i].id+"' class='gridName footprint'>"+list[i].name+"</a>").appendTo($gridNameContainer);
		var $rating=$("<div class='rating'><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></div>").appendTo($productInfo);
		var $gridprice=$("<h5 class='gridPrice'>$"+list[i].price+"</h5>").appendTo($productInfo);
		var $cartBtn=$("<button class='n-a-btn shopcart' productId='"+list[i].id+"' ></button>").appendTo($productInfo);
		var $cart1=$("<i class='fa fa-shopping-cart'>").appendTo($cartBtn);
		var $cart2=$("<span>Add to cart</span>").appendTo($cartBtn);
		var $wishList=$("<a class='wishlist' href='#'><i class='fa fa-heart'></i></a>").appendTo($productInfo);
		var $signal=$("<a class='signal' href='#'><i class='fa fa-signal'></i></a>").appendTo($productInfo);
	}
	showPagi1(entity);//拼接页码
}




//拼接list的方法
function fillArea2(entity){
	var list=entity[1].list;
	for(var i=0;i<list.length;i++){
		var $productContainer=$("<div class='single-product'></div>").appendTo($showArea2);
		var $imgContainer=$("<a href='javascript:;'  productId='"+list[i].id+"' class='listImg footprint'></a>").appendTo($productContainer);
		var $img1=$("<img class='primary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($imgContainer);
		var $img2=$("<img class='secondary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($imgContainer);
		var $i1=$("<i class='fa fa-expand'></i>").appendTo($imgContainer);
		var $productInfo=$("<div class='product-info'></div>").appendTo($productContainer);
		var $listNameContainer=$("<h4></h4>").appendTo($productInfo);
		var $listName=$("<a href='javascript:;'  productId='"+list[i].id+"' class='listName footprint'>"+list[i].name+"</a>").appendTo($listNameContainer);
		var $rating=$("<div class='rating'><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></div>").appendTo($productInfo);
		var $listprice=$("<h5 class='listPrice'>$"+list[i].price+"</h5>").appendTo($productInfo);
		var $description=$("<p>"+list[i].description+"</p>").appendTo($productInfo);
		var $cartBtn=$("<button class='n-a-btn shopcart' productId='"+list[i].id+"'></button>").appendTo($productInfo);
		var $cart1=$("<i class='fa fa-shopping-cart'>").appendTo($cartBtn);
		var $cart2=$("<span>Add to cart</span>").appendTo($cartBtn);
		var $wishList=$("<a class='wishlist' href='#'><i class='fa fa-heart'></i></a>").appendTo($productInfo);
		var $signal=$("<a class='signal' href='#'><i class='fa fa-signal'></i></a>").appendTo($productInfo);
	}
	showPagi2(entity);//拼接页码
}

//grid拼接页码的方法
function showPagi1(entity){
	$numFrom.html((entity[1].currentPageNo-1)*(entity[1].pageSize)+1);
	$numTo.html((entity[1].currentPageNo)*(entity[1].pageSize));
	$numTotal.html(entity[1].totalCount);
	var $current=$("<li class='active'><a href='javascript:;'>["+entity[1].currentPageNo+"/"+entity[1].totalPageCount+"]</a></li>");
	$current.append("<span>&nbsp;&nbsp;<span>");
	var count1=0;
	for(var i=entity[1].currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){click1($(this).children("a").text());});
		$ahead.append("<span>&nbsp;&nbsp;<span>");
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity[1].currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){click1(1);});
		$first.append("<span>&nbsp;&nbsp;<span>");
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){click1(entity[1].currentPageNo-1);});
		$prev.append("<span>&nbsp;&nbsp;<span>");
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity[1].currentPageNo;j<=entity[1].totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){click1($(this).children("a").text());});
		$after.append("<span>&nbsp;&nbsp;<span>");
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity[1].currentPageNo<entity[1].totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){click1(entity[1].currentPageNo+1);});
		$next.append("<span>&nbsp;&nbsp;<span>");
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){click1(entity[1].totalPageCount);});
		$last.append("<span>&nbsp;&nbsp;<span>");
		$temp1.append($next).append($last);
	}
}


//list拼接页码的方法
function showPagi2(entity){
	$numFrom.html((entity[1].currentPageNo-1)*(entity[1].pageSize));
	$numTo.html((entity[1].currentPageNo)*(entity[1].pageSize));
	$numTotal.html(entity[1].totalCount);
	var $current=$("<li class='active'><a href='javascript:;'>["+entity[1].currentPageNo+"/"+entity[1].totalPageCount+"]</a></li>");
	$current.append("<span>&nbsp;&nbsp;<span>");
	var count1=0;
	for(var i=entity[1].currentPageNo;i>1;i--){
		var $ahead=$("<li><a href='javascript:;'>"+(i-1)+"</a></li>").click(function(){click2($(this).children("a").text());});
		$ahead.append("<span>&nbsp;&nbsp;<span>");
		$temp1.prepend($ahead);
		count1++;
		if(count1>=5){
			break;
		}
	}
	$temp1.append($current);
	if(entity[1].currentPageNo>1){
		var $first=$("<li><a href='javascript:;'>first</a></li>").click(function(){click2(1);});
		$first.append("<span>&nbsp;&nbsp;<span>");
		var $prev=$("<li><a href='javascript:;'>prev</a></li>").click(function(){click2(entity[1].currentPageNo-1);});
		$prev.append("<span>&nbsp;&nbsp;<span>");
		$temp1.prepend($prev).prepend($first);
	}
	var count2=0;
	for(var j=entity[1].currentPageNo;j<=entity[1].totalPageCount-1;j++){
		var $after=$("<li><a href='javascript:;'>"+(j+1)+"</a></li>").click(function(){click2($(this).children("a").text());});
		$after.append("<span>&nbsp;&nbsp;<span>");
		$temp1.append($after);
		count2++;
		if(count2>=5){
			break;
		}
	}
	if(entity[1].currentPageNo<entity[1].totalPageCount){
		var $next=$("<li><a href='javascript:;'>next</a></li>").click(function(){click2(entity[1].currentPageNo+1);});
		$next.append("<span>&nbsp;&nbsp;<span>");
		var $last=$("<li><a href='javascript:;'>last</a></li>").click(function(){click2(entity[1].totalPageCount);});
		$last.append("<span>&nbsp;&nbsp;<span>");
		$temp1.append($next).append($last);
	}
}




//grid页码点击的方法
function click1(pageIndex){
	if($currentCategory.attr("currentId")){
		getSpecific($currentCategory.attr("currentId"),pageIndex,12,getPagi1);
	}else{
		getProducts(pageIndex,12,getPagi1);
	}
}

//list页码点击的方法
function click2(pageIndex){
	if($currentCategory.attr("currentId")){
		getSpecific($currentCategory.attr("currentId"),pageIndex,4,getPagi2);
	}else{
		getProducts(pageIndex,4,getPagi2);
	}
}
