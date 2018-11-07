//各个页面上的购物车按钮的点击方法：只有button.shopcart才能生效，注意需要动态绑定
$(document).on("click","button.shopcart",function(){
	var sent="opr=add&cartQuantity=1&cartId="+$(this).attr("productId");
	$.getJSON("shopcart",sent,function(data){
		if(data.success=="yes"){
			initUpperShopcart();
			alert("You have successfully added the product!");//操作正确的信息
		}else{
			alert(data.error);//错误信息
		}
	});
});

//对应商品详情页上的购物车按钮必须配合数量框中的数量
$(document).on("click","button.shopcart2",function(){
	if($("#quantityBtn").val()>0){
		var sent="opr=add&cartId="+$(this).attr("productId")+"&cartQuantity="+$("#quantityBtn").val();
		$.getJSON("shopcart",sent,function(data){
			if(data.success=="yes"){
				initUpperShopcart();
				alert("You have sucessfully added the product!");
			}else{
				alert(data.error);
			}
		});
	}else{
		alert("Please enter the quantity!");
	}
	
});

