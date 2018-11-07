var $footPrintContainer=$("#footprint");

//点击事件产生footprint的商品触发事件为增加footprint
$(document).on("click","a.footprint",function(){
	var sent="opr=addfootprint&footprint="+$(this).attr("productId");
	var clicked=$(this);
	$.getJSON("productcontrol",sent,function(data){
		location.href="pages/general/product-details.jsp?productId="+clicked.attr("productId");
	});
});
//显示footprint的事件
function initFootprint(){
	var sent="opr=showfootprint";
	$.getJSON("productcontrol",sent,function(data){
		showFootprint(data,$footPrintContainer);
	});
}


function showFootprint(list,parentContainer){
	for(var i=0;i<list.length;i++){
		var $container=parentContainer.find("#owl"+(i+1));
		$container.html("");//每次重新拼接的时候先清除容器中的内容！
		var $owlImg=$("<a href='javascript:;' class='footprint' productId='"+list[i].id+"' id='owl"+(i+1)+"img'></a>").appendTo($container);
		var $img1=$("<img class='primary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($owlImg);
		var $img2=$("<img class='secondary-img' src='"+parsePath(list[i].img)+"' alt=''>").appendTo($owlImg);
		var $i1=$("<i class='fa fa-expand'></i>").appendTo($owlImg);
		var $productInfo=$("<div class='product-info'></div>").appendTo($container);
		var $owlNameContainer=$("<h4></h4>").appendTo($productInfo);
		var $owlName=$("<a href='javascript:;' class='footprint' productId='"+list[i].id+"' id='owl"+(i+1)+"name'>"+list[i].name+"</a>").appendTo($owlNameContainer);
		var $rating=$("<div class='rating'><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i></div>").appendTo($productInfo);
		var $owlprice=$("<h5 id='owl"+(i+1)+"price'>$"+list[i].price+"</h5>").appendTo($productInfo);
		var $cartBtn=$("<button class='n-a-btn shopcart' productId='"+list[i].id+"'></button>").appendTo($productInfo);
		var $cart1=$("<i class='fa fa-shopping-cart'>").appendTo($cartBtn);
		var $cart2=$("<span>Add to cart</span>").appendTo($cartBtn);
//		var $wishList=$("<a class='wishlist' href='#'><i class='fa fa-heart'></i></a>").appendTo($productInfo);
//		var $signal=$("<a class='signal' href='#'><i class='fa fa-signal'></i></a>").appendTo($productInfo);
	}
}