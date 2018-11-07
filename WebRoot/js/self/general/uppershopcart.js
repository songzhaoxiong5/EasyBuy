/**
 * Created by songzhaoxiong on 2017/9/21
 * Updated by songzhaoxiong on 2017/12/16
 * must incorporated with util.js
 */
var $outerCartContainer=$("ul.header-r-cart");//最外侧容器
var $cartLink=$outerCartContainer.find("a.cart");
var $directCartContainer=$("div.mini-cart-content");//显示后的小容器

//购物车刷新方法
function initUpperShopcart(){
	var sent="opr=fetch";
	$.getJSON("shopcart",sent,function(data){
		formUpperCart(data);
	});
}

//鼠标移入时的方法
$cartLink.mouseover(function(){
//	var sent="opr=fetch";
//	$.getJSON("shopcart",sent,function(data){
//		formUpperCart(data);
//	});
});

//拼接右上角购物车的方法
function formUpperCart(entity){
	if(entity.wrapperList!=null&&entity.wrapperList!=undefined){
		//返回的是登录用户信息,该对象是一个wrapperList对象
		var subTotal1=0.0;
		$directCartContainer.html("");//先清空原有容器，没有底部价格栏了
		if(!$.isEmptyObject(entity.wrapperList)){
			var detailList=entity.wrapperList[0].detailList;//拿到详情的的一个数组
			if(!$.isEmptyObject(detailList)){
				subTotal1=entity.wrapperList[0].order.cost;
				for(var i=0;i<detailList.length;i++){
					var $mini_top_sec=$("<div class='mini-top-sec'></div>").appendTo($directCartContainer);
					var $cart_image=$("<div class='cart-image'></div>").appendTo($mini_top_sec);
					var $cart_image_a=$("<a href='pages/general/product-details.jsp?productId='"+detailList[i].orderDetail.productId+" class='footprint' productId='"+detailList[i].orderDetail.productId+"'></a>").appendTo($cart_image);
					var $cart_image_img=$("<img alt='' src='"+parsePath(detailList[i].img)+"'>").appendTo($cart_image_a);
					var $cart_info=$("<div class='cart-info'></div>").appendTo($mini_top_sec);
					var $cart_info_a=$("<a href='pages/general/product-details.jsp?productId='"+detailList[i].orderDetail.productId+" class='footprint' productId='"+detailList[i].orderDetail.productId+"'></a>").appendTo($cart_info);
					var $cart_info_h4=$("<h4>"+detailList[i].productName+"</h4>").appendTo($cart_info_a);
					var $cart_info_h5=$("<h5>$"+detailList[i].unitPrice+"</h5>").appendTo($cart_info);
					var $cart_info_span=$("<span class='quantity'><i class='fa fa-times'></i>"+detailList[i].orderDetail.quantity+"</span>").appendTo($cart_info);
					var $product_cancel=$("<div class='product-cancel'></div>").appendTo($mini_top_sec);
					var $product_cancel_a=$("<a href='javascript:;' class='clearsinglecart' productId='"+detailList[i].orderDetail.productId+"'><i class='fa fa-times'></i></a>").appendTo($product_cancel);
				}
			
			}
		}	
		//生成底部总价栏
		var $mini_bottom_sec=$("<div class='mini-bottom-sec'></div>").appendTo($directCartContainer);
		var $total_amount_p=$("<p class='total-amount'>Subtotal:</p>").appendTo($mini_bottom_sec);
		var $total_amount_p_span=$("<span>$"+subTotal1+"</span>").appendTo($total_amount_p);
		var $total_amount_button1=$("<div class='button'></div>").appendTo($mini_bottom_sec);
		var $total_amount_button1_a=$("<a href='pages/general/checkout.jsp'>CHECKOUT</a>").appendTo($total_amount_button1);
		var $total_amount_button2=$("<div class='button'></div>").appendTo($mini_bottom_sec);
		var $total_amount_button2_a=$("<a href='pages/general/cart.jsp'>View Cart</a>").appendTo($total_amount_button2);
		

	}else{//返回的是一个游客购物车对象
		var subTotal2=0.0;
		$directCartContainer.html("");//先清空原有容器，没有底部价格栏了
		if(!$.isEmptyObject(entity)){
			//返回的是游客信息，该对象是一个数组
			var detailList1=entity;
			for(var j=0;j<entity.length;j++){
				var $mini_top_sec1=$("<div class='mini-top-sec'></div>").appendTo($directCartContainer);
				var $cart_image1=$("<div class='cart-image'></div>").appendTo($mini_top_sec1);
				var $cart_image_a1=$("<a href='pages/general/product-details.jsp?productId='"+detailList1[j].cartId+" class='footprint' productId='"+detailList1[j].cartId+"'></a>").appendTo($cart_image1);
				var $cart_image_img1=$("<img alt='' src='"+parsePath(detailList1[j].img)+"'>").appendTo($cart_image_a1);
				var $cart_info1=$("<div class='cart-info'></div>").appendTo($mini_top_sec1);
				var $cart_info_a1=$("<a href='pages/general/product-details.jsp?productId='"+detailList1[j].cartId+" class='footprint' productId='"+detailList1[j].cartId+"'></a>").appendTo($cart_info1);
				var $cart_info_h41=$("<h4>"+detailList1[j].productName+"</h4>").appendTo($cart_info_a1);
				var $cart_info_h51=$("<h5>$"+detailList1[j].unitPrice+"</h5>").appendTo($cart_info1);
				var $cart_info_span1=$("<span class='quantity'><i class='fa fa-times'></i>"+detailList1[j].cartQuantity+"</span>").appendTo($cart_info1);
				var $product_cancel1=$("<div class='product-cancel'></div>").appendTo($mini_top_sec1);
				var $product_cancel_a1=$("<a href='javascript:;' class='clearsinglecart' productId='"+detailList1[j].cartId+"'><i class='fa fa-times'></i></a>").appendTo($product_cancel1);
				subTotal2=subTotal2+detailList1[j].subTotal;
			}	
		}
			//拼接下部的总价
			var $mini_bottom_sec1=$("<div class='mini-bottom-sec'></div>").appendTo($directCartContainer);
			var $total_amount_p1=$("<p class='total-amount'>Subtotal:</p>").appendTo($mini_bottom_sec1);
			var $total_amount_p_span1=$("<span>$"+subTotal2+"</span>").appendTo($total_amount_p1);
			var $total_amount_button11=$("<div class='button'></div>").appendTo($mini_bottom_sec1);
			var $total_amount_button1_a1=$("<a href='pages/general/checkout.jsp'>CHECKOUT</a>").appendTo($total_amount_button11);
			var $total_amount_button21=$("<div class='button'></div>").appendTo($mini_bottom_sec1);
			var $total_amount_button2_a1=$("<a href='pages/general/cart.jsp'>View Cart</a>").appendTo($total_amount_button21);
	}
}

//绑定顶部购物车清空一件商品的方法
$(document).on("click","a.clearsinglecart",function(){
	var sent="opr=del&cartId="+$(this).attr("productId");
	var $clicked=$(this);
	$.getJSON("shopcart",sent,function(data){
		if(data.success!=undefined&&data.success!=null){//正确删除
			$clicked.parent().parent().remove();//显示效果上整个父容器消失！
			window.location.reload();
			initUpperShopcart();
		}
	});
});



//$(document).ready(function(){
//    //delete the commodity in the pop-box in the index page
//    $("div[class='product-cancel']").click(function(){
//        var $subTotal=$("div[class='mini-bottom-sec']").find("p").find("span");
//        var $onPageTotal=$("ul[class='header-r-cart']").find("li").find("a[class='cart']");
//        var $onPageSpan=$("ul[class='header-r-cart']").find("li").find("a[class='cart']").find("span");
//        //改变弹出窗上的价格总计
//        $subTotal.text("$"+(parseInt($subTotal.text().substring(1))-parseInt($(this).prev().find("h5").text().substring(1))));
//        //改变显示在页面上的总价格和商品总数
//        $onPageTotal.html("<i class='fa fa-shopping-cart'></i>Cart : "+$subTotal.text()+"<span>"+(parseInt($onPageSpan.text())-1)+"</span>");
//        $(this).parent().remove();
//    });
//});