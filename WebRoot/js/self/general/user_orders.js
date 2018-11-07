var $mainOrderContainer=$("#mainContainerForOrders");//主容器
var $userInfoInput=$("#userInfo");//标识用户信息的隐藏域！
function initUserOrders(){
	var sent="opr=listAllWithClues&clueNumber=2&clue1=userId&clueValue1="+$userInfoInput.val()+"&clue2=type&clueValue2=1";
	$.getJSON("ordercontrol",sent,formUserOrders);
}

function formUserOrders(data){
	$mainOrderContainer.html("");//先清空主容器
	if(!$.isEmptyObject(data.wrapperList)){//order数目不为零
		for(var i=0;i<data.wrapperList.length;i++){
			var detailList=data.wrapperList[i].detailList;
			if(!$.isEmptyObject(detailList)){//详情数目不为0
				var $orderTable=$("<table class='cart-table'></table>").appendTo($mainOrderContainer);
				var $thead1=$("<thead></thead>").appendTo($orderTable);
				var $tr1=$("<tr></tr>").appendTo($thead1);
				var $th1=$("<th class='p-name'>Order Number:<span>"+data.wrapperList[i].order.serialNumber+"</span></th>").appendTo($tr1);
				var $th2=$("<th class='p-name'>Create Time:<span>"+data.wrapperList[i].order.createTime+"</span></th>").appendTo($tr1);
				var $th3=$("<th class='p-name'>Status:<span>"+parseStatus(data.wrapperList[i].order.status)+"</span></th>").appendTo($tr1);
				var $th4=$("<th class='p-total'>Cost:<span>"+data.wrapperList[i].order.cost+"</span></th>").appendTo($tr1);
				var $thead2=$("<tr><th class='p-name'>Product Name</th><th class='p-amount'>Price</th><th class='p-amount'>Quantity</th><th class='p-total'>SubTotal</th></tr>").appendTo($orderTable);
				var $tbody1=$("<tbody></tbody>").appendTo($orderTable);
				for(var j=0;j<detailList.length;j++){
					var $reviweContainer=$("<tr></tr>").appendTo($tbody1);
					var $td_p_name=$("<td class='p-name'>"+detailList[j].productName+"</td>").appendTo($reviweContainer);
					var $td_p_amount=$("<td class='p-amount text-center'></td>").appendTo($reviweContainer);
					var $td_p_amount_span=$("<span class='amount'>$"+detailList[j].unitPrice+"</span>").appendTo($td_p_amount);
					var $td_p_quantity=$("<td class='p-quantity text-center'>"+detailList[j].orderDetail.quantity+"</td>").appendTo($reviweContainer);
					var $td_p_total=$("<td class='p-total'>$"+detailList[j].orderDetail.cost+"</td>").appendTo($reviweContainer);
				}
			}
		}
		
	}
}


//if(!$.isEmptyObject(detailList)){
//	total=data.wrapperList[0].order.cost;
//	for(var i=0;i<detailList.length;i++){
//		var $reviweContainer=$("<tr></tr>").appendTo($orderReviewTable);
//		var $td_p_name=$("<td class='p-name'>"+detailList[i].productName+"</td>").appendTo($reviweContainer);
//		var $td_p_amount=$("<td class='p-amount text-center'></td>").appendTo($reviweContainer);
//		var $td_p_amount_span=$("<span class='amount'>$"+detailList[i].unitPrice+"</span>").appendTo($td_p_amount);
//		var $td_p_quantity=$("<td class='p-quantity text-center'>"+detailList[i].orderDetail.quantity+"</td>").appendTo($reviweContainer);
//		var $td_p_total=$("<td class='p-total'>$"+detailList[i].orderDetail.cost+"</td>").appendTo($reviweContainer);
//	}
//}



//<div class="table-responsive" id="mainContainerForOrders">
//<table class="cart-table">
//	<thead>
//	<tr>
//            <th class="p-name">Order Number:<span>1</span></th>
//            <th class="p-name">Create Time:<span>123</span></th>
//            <th class="p-amount">Status:<span>1</span></th>
//            <th class="p-total">Cost:<span>1</span></th>
//     </tr>
//	</thead>
//	<thead>
//        <tr>
//            <th class="p-name">Product Name</th>
//            <th class="p-amount">Price</th>
//            <th class="p-amount">Quantity</th>
//            <th class="p-total">SubTotal</th>
//        </tr>
//    </thead>
//    <tbody>
//    
//    </tbody>
//</table>
//</div>