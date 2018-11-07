/**
 * Created by songzhaoxiong on 2017/9/22.
 * Updated by songzhaoxiong on 2017/12/16 
 * util.js must be incorporated when using this javascript!
 */

var $shopcartTable=$("tbody");//订单信息的容器
var $cartTotal=$("div.amount-totals");//总价的容器
var $totalAmount=$("#totalAmount");//显示总价格的span
var $clearBtn=$("#clearBtn");//清空的按钮
var $updateBtn=$("#updateBtn");//更新的按钮
var $checkoutBtn=$("#checkoutBtn");//结算的按钮

function initShopcart(){//进入购物车页面时进行加载
	var sent="opr=fetch";
	$.getJSON("shopcart",sent,function(data){
		formShopcart(data);
	});
}

//拼接购物车的方法！
function formShopcart(entity){
	$totalAmount.html("$0");
	$shopcartTable.html("");//先清空原有容器，有底部
	if(entity.wrapperList!=null&&entity.wrapperList!=undefined){
		//返回的是登录用户信息,该对象是一个wrapperList对象
		
		if(!$.isEmptyObject(entity.wrapperList)){
			total1=entity.wrapperList[0].order.cost;
			var detailList=entity.wrapperList[0].detailList;//拿到详情的的一个数组
			if(!$.isEmptyObject(detailList)){
//				<tr>
//                <td class="p-action"><a href="#"><i class="fa fa-times"></i></a></td>
//                <td class="p-image">
//                    <a href="product-details.html"><img alt="" src="img/product/cart.jpg"></a>
//                </td>
//                <td class="p-name"><a href="product-details.html">Duis autem vel eum iriure</a></td>
//                <td class="edit"><a href="product-details.html">Edit</a></td>
//                <td class="p-amount"><span class="amount">$156.87</span></td>
//                <td class="p-quantity"><input type="text" value="1"></td>
//                <td class="p-total">$156.87</td>
//                </tr>
				for(var i=0;i<detailList.length;i++){
					var $rowContainer=$("<tr productId='"+detailList[i].orderDetail.productId+"'></tr>").appendTo($shopcartTable);
					var $deleteTd=$("<td class='p-action'></td>").appendTo($rowContainer);
					var $deleteLink=$("<a href='javascript:;' productId='"+detailList[i].orderDetail.productId+"'><i class='fa fa-times'></i></a>").click(function(){deleteSpecific($(this).attr("productId"),$(this).parent().parent());}).appendTo($deleteTd);
					var $imgTd=$("<td class='p-image'></td>").appendTo($rowContainer);
					var $imgLink=$("<a href='pages/general/product-details.jsp?productId="+detailList[i].orderDetail.productId+"' class='footprint'></a>").appendTo($imgTd);
					var $img=$("<img alt='' src='"+parsePath(detailList[i].img)+"'>").appendTo($imgLink);
					var $nameTd=$("<td class='p-name'></td>").appendTo($rowContainer);
					var $nameLink=$("<a href='pages/general/product-details.jsp?productId="+detailList[i].orderDetail.productId+"' class='footprint'>"+detailList[i].productName+"</a>").appendTo($nameTd);
					var $editTd=$("<td class='edit'></td>").appendTo($rowContainer);
					var $editLink=$("<a href='pages/general/product-details.jsp?productId="+detailList[i].orderDetail.productId+"' class='footprint'>Edit</a>").appendTo($editTd);
					var $amountTd=$("<td class='p-amount'></td>").appendTo($rowContainer);
					var $amountSpan=$("<span class='amount'>$"+detailList[i].unitPrice+"</span>").appendTo($amountTd);
					var $quantityTd=$("<td class='p-quantity'></td>").appendTo($rowContainer);
					var $quantityInput=$("<input type='text' value='"+detailList[i].orderDetail.quantity+"' unitprice='"+detailList[i].unitPrice+"'>").appendTo($quantityTd);
					var $totalTd=$("<td class='p-total'>"+detailList[i].orderDetail.cost+"</td>").appendTo($rowContainer);
				}
			
			}
		}	
		//更新底部的价格栏
		$totalAmount.html("$"+total1);
		

	}else{//返回的是一个游客购物车对象
		var total2=0.0;
		if(!$.isEmptyObject(entity)){
			//返回的是游客信息，该对象是一个数组
			var detailList1=entity;
			for(var j=0;j<entity.length;j++){
				var $rowContainer1=$("<tr productId='"+detailList1[j].cartId+"'></tr>").appendTo($shopcartTable);
				var $deleteTd1=$("<td class='p-action'></td>").appendTo($rowContainer1);
				var $deleteLink1=$("<a href='javascript:;' productId='"+detailList1[j].cartId+"'><i class='fa fa-times'></i></a>").click(function(){deleteSpecific($(this).attr("productId"),$(this).parent().parent());}).appendTo($deleteTd1);
				var $imgTd1=$("<td class='p-image'></td>").appendTo($rowContainer1);
				var $imgLink1=$("<a href='pages/general/product-details.jsp?productId="+detailList1[j].cartId+"' class='footprint'></a>").appendTo($imgTd1);
				var $img1=$("<img alt='' src='"+parsePath(detailList1[j].img)+"'>").appendTo($imgLink1);
				var $nameTd1=$("<td class='p-name'></td>").appendTo($rowContainer1);
				var $nameLink1=$("<a href='pages/general/product-details.jsp?productId="+detailList1[j].cartId+"' class='footprint'>"+detailList1[j].productName+"</a>").appendTo($nameTd1);
				var $editTd1=$("<td class='edit'></td>").appendTo($rowContainer1);
				var $editLink1=$("<a href='pages/general/product-details.jsp?productId="+detailList1[j].cartId+"' class='footprint'>Edit</a>").appendTo($editTd1);
				var $amountTd1=$("<td class='p-amount'></td>").appendTo($rowContainer1);
				var $amountSpan1=$("<span class='amount'>$"+detailList1[j].unitPrice+"</span>").appendTo($amountTd1);
				var $quantityTd1=$("<td class='p-quantity'></td>").appendTo($rowContainer1);
				var $quantityInput1=$("<input type='text' value='"+detailList1[j].cartQuantity+"' unitprice='"+detailList1[j].unitPrice+"'>").appendTo($quantityTd1);
				var $totalTd1=$("<td class='p-total'>"+detailList1[j].subTotal+"</td>").appendTo($rowContainer1);
				total2=total2+detailList1[j].subTotal;
			}	
		}
			//拼接下部的总价
		$totalAmount.html("$"+total2);
	}
}




//动态计算总价！
function calculateTotal(){
    var $grandTotal=$("div[class='amount-totals']").children("p[class='total']").children("span");
    var totalMoney=0.0;
    $("tbody").find("td.p-quantity>input").each(function(){
        totalMoney=parseFloat(totalMoney)+parseFloat($(this).attr("unitprice")*$(this).val());
    });
    $grandTotal.text("$"+totalMoney);
}



//删除某一商品！
function deleteSpecific(cartId,deletedRow){
	var sent="opr=del&cartId="+cartId;
	$.getJSON("shopcart",sent,function(data){
		if(data.success=="yes"){
			initUpperShopcart();
			deletedRow.remove();
			calculateTotal();
			alert("The product has been moved out!");
			location.reload();
		}else{
			alert("Error when update the cart!");
		}
	});
}

//修改某一个商品！
function updateSpecific(cartId,cartQuantity){
	var sent="opr=update&cartId="+cartId+"&cartQuantity="+cartQuantity;
	$.getJSON("shopcart",sent,function(data){
		if(data.success=="yes"){
			initUpperShopcart();
			calculateTotal();
			alert("The product has been updated!");
			
		}else{
			alert("Error when update the cart!");
		}
	});
}


//    //delete the commodity in the pop-box in the index page
//    $("div[class='product-cancel']").click(function(){
//        var $subTotal=$("div[class='mini-bottom-sec']").find("p").find("span");
//        var $onPageTotal=$("ul[class='header-r-cart']").find("li").find("a[class='cart']");
//        var $onPageSpan=$("ul[class='header-r-cart']").find("li").find("a[class='cart']").find("span");
//      
//        $subTotal.text("?"+(parseInt($subTotal.text().substring(1))-parseInt($(this).prev().find("h5").text().substring(1))));
//        
//        $onPageTotal.html("<i class='fa fa-shopping-cart'></i>Cart : "+$subTotal.text()+"<span>"+(parseInt($onPageSpan.text())-1)+"</span>");
//        $(this).parent().remove();
//    });



    //modifying the shopping cart contents




    //change the amount of the commodity should be bound dynamically
	$shopcartTable.on("change","td.p-quantity>input",function(){
		if($(this).val()==""){
			alert("A number larger or equals 0 should be entered!");
		}else if($(this).val()=="0"){
			deleteSpecific($(this).parent().parent().attr("productId"),$(this).parent().parent());
		}else{
			updateSpecific($(this).parent().parent().attr("productId"),$(this).val());
		}
	});
	
	
	
	
    //clear the shopcart,确认删除所有信息后再进行删除,点击clear时的事件
    $("div[class='all-cart-buttons']").find("div").find("a:eq(1)").click(function(){
    	if($shopcartTable.find("tr").length<1){
    		alert("Already Cleared!");
    	}else{
    		if(confirm("Are you sure you want to clear the shopping cart?")){
        		var sent="opr=clear";
        		$.getJSON("shopcart",sent,function(data){
        			if(data.success=="yes"){
        				location.reload();
        				$shopcartTable.html("");
        		    	$totalAmount.html("$0");
        			}
        		});
        	}
    	}
    	
    });
    //点击更新购物车时
    $("#updateBtn").click(function(){
    	window.location.reload();
    });
    //点击结算按钮时
    $("#checkoutBtn").click(function(){
    	if($shopcartTable.find("tr").length<1||$totalAmount.text=="$0"){
    		alert("Your cart is empty!");
    	}
    });
