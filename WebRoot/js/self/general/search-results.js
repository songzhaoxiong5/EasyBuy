//created by Song Zhaoxiong
//must be incorporated with searchbox.js,and should not be incorporated with shop-grid.js because many methods are the same!
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
	getSearchPages(pageIndex,12,getPagi1);
}

//list页码点击的方法
function click2(pageIndex){
	getSearchPages(pageIndex,4,getPagi2);
}