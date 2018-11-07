//首页脚本文件

//加载时初始化三级联动菜单！>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
var $leftNavigation=$("ul#category");//三级联动菜单的父容器
var $currentCategory=$("#currentCategory");//当前选择的类型标识.html
var $currentCategoryContainer=$("#currentCategory").closest("div");
var $news1=$("#news1");//下部新闻区
var $news2=$("#news2");//右部新闻区
var $showArea1=$("#showArea1");//上侧滚动栏的父容器
var $showArea2=$("#showArea2");//中间滚动栏的父容器
var $showArea3=$("#showArea3");//中部第二页
var $showArea4=$("#showArea4");//中部第三页






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
					var $temp1=$("<a parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"<i class='fa fa-angle-right'></i></a>").click(function(){$currentCategory.html($(this).text());$currentCategory.closest("div").attr("currentId",$(this).attr("selfId"));$currentCategory.closest("div").attr("type","categoryLevel1");getSpecific($(this).attr("selfId"),1);}).appendTo($firstCategoryContainer);
					currentIndexForLevel1++;
					formFirstLevel();//相当于for循环中的continue
					return;//此次一层循环结束
				}
				$firstCategoryContainer=$("<li></li>").appendTo($leftNavigation);
				var $temp2=$("<a parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"<i class='fa fa-angle-right'></i></a>").click(function(){$currentCategory.html($(this).text());$currentCategory.closest("div").attr("currentId",$(this).attr("selfId"));$currentCategory.closest("div").attr("type","categoryLevel1");getSpecific($(this).attr("selfId"),1);}).appendTo($firstCategoryContainer);
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
								var $temp6=$("<a parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' class='title'  href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.closest("div").attr("currentId",$(this).attr("selfId"));$currentCategory.closest("div").attr("type","categoryLevel2");getSpecific($(this).attr("selfId"),1);}).appendTo($secondCategoryContainer);
								currentIndexForLevel2++;
								formSecondLevel();
								return;
							}
							$secondCategoryContainer=$("<li></li>").appendTo($temp5);
							var $temp7=$("<a parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' class='title'  href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.closest("div").attr("currentId",$(this).attr("selfId"));$currentCategory.closest("div").attr("type","categoryLevel2");getSpecific($(this).attr("selfId"),1);}).appendTo($secondCategoryContainer);
							var $thirdCategory=null;//遍历的三级分类
							var $thirdCategoryContainer=null;//三级分类的容器
							var numberOfThird=$thirdLevelCategories.length;
							for(var i=0;i<numberOfThird;i++){
								$thirdCategory=$thirdLevelCategories[i];
								var $temp8=$("<li></li>").appendTo($temp5);
								var $temp9=$("<a  parentId='"+$thirdCategory.parentId+"' selfId='"+$thirdCategory.id+"' href='javascript:;'>"+$thirdCategory.name+"</a>").click(function(){$currentCategory.html($(this).text());$currentCategory.closest("div").attr("currentId",$(this).attr("selfId"));$currentCategory.closest("div").attr("type","categoryLevel3");getSpecific($(this).attr("selfId"),1);}).appendTo($temp8);
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
function getProducts(pageIndex){
	$("#currentCategory").html("Welcome!");
	var sent="opr=listWithClues&clueNumber=1&clue1=isDelete&clueValue1=0";
	if(pageIndex&&pageIndex>0){
		sent+="&pageIndex="+pageIndex;
	$.getJSON("productcontrol",sent,getPagi);
	}
}



function getSpecific(currentId,pageIndex){
	var sent="opr=listWithClues&clueNumber=2&clue1=isDelete&clueValue1=0&clue2="+$currentCategoryContainer.attr("type")+"&clueValue2="+currentId;
	if(pageIndex&&pageIndex>0){
		sent+="&pageIndex="+pageIndex;
	$.getJSON("productcontrol",sent,getPagi);
	}
}

function getPagi(data){
	clear($showArea1);
	clear($showArea2);
	clear($showArea3);
	clear($showArea4);
	var $productList=data[1].list;
	if(!$.isEmptyObject($productList)){
		fillArea($productList,$("#showArea1"));
		fillArea($productList,$("#showArea2"));
	}
}

function clear(parentContainer){
	for(var i=0;i<12;i++){
		var $container=parentContainer.find("#owl"+(i+1));
		$container.html("");
	}
}

//填充静态的容器不再自动拼接
function fillArea(list,parentContainer){
	for(var i=0;i<list.length;i++){
		var $container=parentContainer.find("#owl"+(i+1));
		var $owlImg=$("<a href='javascript:;' class='footprint' productId='"+list[i].id+"' id='owl"+(i+1)+"img'></a>").appendTo($container);
		var $img1=$("<img class='primary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($owlImg);
		var $img2=$("<img class='secondary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($owlImg);
		var $i1=$("<i class='fa fa-expand'></i>").appendTo($owlImg);
		var $productInfo=$("<div class='product-info'></div>").appendTo($container);
		var $owlNameContainer=$("<h4></h4>").appendTo($productInfo);
		var $owlName=$("<a href='javascript:;' class='footprint' productId='"+list[i].id+"' id='owl"+(i+1)+"name'>"+list[i].name+"</a>").appendTo($owlNameContainer);
		var $rating=$("<div class='rating'><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></div>").appendTo($productInfo);
		var $owlprice=$("<h5 id='owl"+(i+1)+"price'>$"+list[i].price+"</h5>").appendTo($productInfo);
		var $cartBtn=$("<button class='n-a-btn shopcart' productId='"+list[i].id+"' ></button>").appendTo($productInfo);
		var $cart1=$("<i class='fa fa-shopping-cart'>").appendTo($cartBtn);
		var $cart2=$("<span>Add to cart</span>").appendTo($cartBtn);
		var $wishList=$("<a class='wishlist' href='#'><i class='fa fa-heart'></i></a>").appendTo($productInfo);
		var $signal=$("<a class='signal' href='#'><i class='fa fa-signal'></i></a>").appendTo($productInfo);
	}
}


$("#page1Btn").click(function(){
	if($currentCategoryContainer.attr("currentId")){
		var sent="opr=listWithClues&pageIndex=1&clueNumber=2&clue1=isDelete&clueValue1=0&clue2="+$currentCategoryContainer.attr("type")+"&clueValue2="+$currentCategoryContainer.attr("currentId");
		$.getJSON("productcontrol",sent,function(data){
			clear($showArea2);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea2"));
			}
		});
	}else{
		var sent2="opr=listWithClues&clueNumber=1&clue1=isDelete&clueValue1=0&pageIndex=1";
		$.getJSON("productcontrol",sent2,function(data){
			clear($showArea2);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea2"));
			}
		});
		
	}
});

$("#page2Btn").click(function(){
	if($currentCategoryContainer.attr("currentId")){
		var sent="opr=listWithClues&pageIndex=2&clueNumber=2&clue1=isDelete&clueValue1=0&clue2="+$currentCategoryContainer.attr("type")+"&clueValue2="+$currentCategoryContainer.attr("currentId");
		$.getJSON("productcontrol",sent,function(data){
			clear($showArea3);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea3"));
			}
		});
	}else{
		var sent2="opr=listWithClues&clueNumber=1&clue1=isDelete&clueValue1=0&pageIndex=2";
		$.getJSON("productcontrol",sent2,function(data){
			clear($showArea3);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea3"));
			}
		});
		
	}
});

$("#page3Btn").click(function(){
	if($currentCategoryContainer.attr("currentId")){
		var sent="opr=listWithClues&pageIndex=3&clueNumber=2&clue1=isDelete&clueValue1=0&clue2="+$currentCategoryContainer.attr("type")+"&clueValue2="+$currentCategoryContainer.attr("currentId");
		$.getJSON("productcontrol",sent,function(data){
			clear($showArea4);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea4"));
			}
		});
	}else{
		var sent2="opr=listWithClues&clueNumber=1&clue1=isDelete&clueValue1=0&pageIndex=3";
		$.getJSON("productcontrol",sent2,function(data){
			clear($showArea4);
			var $productList=data[1].list;
			if(!$.isEmptyObject($productList)){
				fillArea($productList,$("#showArea4"));
			}
		});
		
	}
});

