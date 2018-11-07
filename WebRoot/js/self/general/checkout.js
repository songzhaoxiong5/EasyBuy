var $orderReviewContainer=$("#order-review");//最外部容器
var $orderReviewTable=$orderReviewContainer.find("tbody");//订单详情容器
var $orderReviewTotal=$("#orderReviewTotal");//
var $placeOrderBtn=$("#placeOrderBtn");//下单按钮

function initOrderReview(){
	var sent="opr=fetch";
	$.getJSON("shopcart",sent,formOrderReview);
}

function formOrderReview(data){
	//此时用户一定登录了
	$orderReviewTable.html("");
	var total=0.0;
	if(!$.isEmptyObject(data.wrapperList)){
		var detailList=data.wrapperList[0].detailList;
		if(!$.isEmptyObject(detailList)){
			total=data.wrapperList[0].order.cost;
			for(var i=0;i<detailList.length;i++){
				var $reviweContainer=$("<tr></tr>").appendTo($orderReviewTable);
				var $td_p_name=$("<td class='p-name'>"+detailList[i].productName+"</td>").appendTo($reviweContainer);
				var $td_p_amount=$("<td class='p-amount text-center'></td>").appendTo($reviweContainer);
				var $td_p_amount_span=$("<span class='amount'>$"+detailList[i].unitPrice+"</span>").appendTo($td_p_amount);
				var $td_p_quantity=$("<td class='p-quantity text-center'>"+detailList[i].orderDetail.quantity+"</td>").appendTo($reviweContainer);
				var $td_p_total=$("<td class='p-total'>$"+detailList[i].orderDetail.cost+"</td>").appendTo($reviweContainer);
			}
		}
	}
	$orderReviewTotal.html("$"+total);
	
}


//<tbody>
//<tr>
//  <td class="p-name">Laoreet Congue</td>
//  <td class="p-amount text-center"><span class="amount">£156.87</span></td>
//  <td class="p-quantity text-center">1</td>
//  <td class="p-total">£156.87</td>
//</tr>
//<tr>
//  <td class="p-name">Spante Congue</td>
//  <td class="p-amount text-center"><span class="amount">£156.87</span></td>
//  <td class="p-quantity text-center">1</td>
//  <td class="p-total">£156.87</td>
//</tr>
//</tbody>

$("#placeOrderBtn").click(function(){
	if(checkEmptyOrderReview()){
		location.href="ordercontrol?opr=placeOrder";
	}else{
		alert("You have not chosen any product!");
	}
});

function checkEmptyOrderReview(){
	if($orderReviewTable.find("tr").length<=0){
		return false;
	}else{
		return true;
	}
}
