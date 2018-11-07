var $addProductBtn=$("#addProductBtn"); 
var $mainArea=$("div.well"); 
var $orderAddForm=$("#orderAddForm");
var $inputs=$orderAddForm.find(":input");
var $appendedArea=$("#appendedContainer");
//拼接商品详情！
$addProductBtn.click(function(){
	var $title=$("<label><strong>Order Detail</strong></label>").appendTo($appendedArea);
	var $productContainer=$("<form class='appendedDetail'></form>").appendTo($appendedArea);
	var $opr=$("<input type='hidden' name='opr' value='add' class='appendedInput'>").appendTo($productContainer);
	var $orderId=$("<input type='hidden' name='orderId' class='appendedInput'>").appendTo($productContainer);
	var $productName1=$("<label>Product Name</label>").appendTo($productContainer);
	var $productName2=$("<input type='text'  class='input-xlarge appendedInput' name='productName'>").appendTo($productContainer);
	var $productId=$("<input type='hidden' name='productId'>").appendTo($productContainer);
	var $productImg=$("<img src='#' class='img-polaroid appendedImg' align='center'>").appendTo($productContainer);
	var $quantity1=$("<label>Quantity</label>").appendTo($productContainer);
	var $quantity2=$("<input type='text' class='input-xlarge appendedInput' name='quantity'>").appendTo($productContainer);
	//var $cost1=$("<label>Cost</label>").appendTo($productContainer);
	var $cost2=$("<input type='hidden' class='input-xlarge appendedInput' name='cost'>").appendTo($productContainer);
});

//点击保存订单按钮
$("#saveOrderBtn").click(function(){
	if(verify()){
		showMessage("进入了该方法！");
		if(autoFillTotalCost()){
			var serialized=$inputs.serialize();
			$.getJSON("ordercontrol",serialized,getOrderId);
		}
	}
	
});

//这个方法检查价钱有没有填好！
function autoFillTotalCost(){
	var $costList=$("input[name='cost']",$appendedArea);
	var flag=true;
	var totalCost=0.0;
	$costList.each(function(){
		if($(this).val()==""){
			flag=false;//当前有空白域
			showMessage("False cost initialization!");
		}else{
			totalCost=totalCost+parseFloat($(this).val());
		}
	});
	$("#totalCost").val(totalCost);
	if(totalCost==0.0){
		flag=false;
	}
	return flag;
}

//回调方法，填充每个订单详情的订单编号
function getOrderId(data){
	if((data.message==null||data.message==undefined)&&data.result=="success"){
		var sent="opr=listAllWithClues&clueNumber=1&clue1=serialNumber&clueValue1="+$("#serialNumber").val();
		$.getJSON("ordercontrol",sent,saveOrderDetail);
	}
}

//递归将所有详情表的数据发送出去！
function saveOrderDetail(data){//将所有的详情表的数据发送出去！
	if(!$.isEmptyObject(data[1][0])){
		$("input[name='orderId']").val(data[1][0].id);
		var times=$mainArea.find("form.appendedDetail").size();
		var currentIndex=0;
		var $currentForm=null;
		function beginSend(data){
			afterManipulation(data);
			if(currentIndex>=times){
				return;
			}
			 $currentForm=$mainArea.find("form.appendedDetail").eq(currentIndex);
			 var sent=$currentForm.find(":input").serialize();
			 currentIndex++;
			 $.getJSON("orderdetailcontrol",sent,beginSend);
			
		}
		beginSend(JSON.parse("{\"message\":\"Begin parsing details\"}"));
	}
}

//进行文本域的表单验证！
function verify(){
	var flag=true;
	if($("form.appendedDetail").size()>=1){
		$(".appendedInput").each(function(){
		   
			
			var name = $(this).attr("name");
		    if($(this).attr("type")=="text"){
		    	 if($(this).val()==""){
		 	    	showMessage("Unfilled Exists");
		 	    	flag=false;
		 	    }
		    }
//		    if($(this).attr("type")=="hidden"){
//		    	if($(this).val()==""){
//		    		showMessage("Uninitialized!");
//		    		return false;
//		    	}
//		    }
		    if($(this).attr("type")=="radio"){ 
		      if ($("input[name='"+name+"']:checked").size()< 1){ 
		    	showMessage("Unfilled Exists!");
		    	flag=false;
		      } 
		    }
		    if($(this).attr("type")=="checkbox"){ 
		      if ($("input[name='"+name+"']:checked").size()< 1){ 
		        showMessage("Unfilled Exists!"); 
		        flag=false;
		      } 
		    }
		   
		  }); 
	}else{
		showMessage("Please add the order details!");
		return false;
	}
	return flag;
	
}

//初始化订单编号
function initSerialNumber(){
	$("#serialNumber").val(new Date().getTime());
}

//输入商品名称时商品详情的自动填充方法
$("div.well").on("blur","input[name='productName']",function(){
	if($(this).val()!=""){
		var count=0;
		for(var i=0;i<$("input[name='productName']").length;i++){
			if($("input[name='productName']").eq(i).val()==$(this).val()){
				count++;
			}
		}
		if(count>1){
			showMessage("This Product has been selected!");
		}else{
			var current=$(this);
			var sent="opr=listAllWithClues&clueNumber=1&clue1=name&clueValue1="+$(this).val();
			$.getJSON("productcontrol",sent,function(data){
				fillId(current,data);
			});
		}
		
	}
});


//根据商品名称填充商品详情信息！
function fillId(current,data){
	if(!$.isEmptyObject(data[1][0])){
		current.next().next().attr("src",data[1][0].img.substring(data[1][0].img.indexOf("EasyBuy")+8));
		current.next().val(data[1][0].id);
		current.next().next().next().next().removeClass("disabled");//去除数量一栏的不可用状态！
	}else{
		showMessage("the product name you added does not exists!");
	}
}

//输入商品数量时，商品合计的自动填充方法！
$("div.well").on("blur","input[name='quantity']",function(){
	if($(this).val()!=""){
		if($(this).val()=="0"){
			showMessage("You must enter a number larger than 0!");
		}else{
			var quantity=$(this);
			var sent="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+$(this).prev().prev().prev().val();
			$.getJSON("productcontrol",sent,function(data){
				fillCost(quantity,data);
			});
		}
		
	}
});

//根据商品详情中的数量，填充各个详情中的各个商品的总价格
function fillCost(quantity,data){
	if(!$.isEmptyObject(data[1][0])){
		var cost=(parseFloat(data[1][0].price))*(parseInt(quantity.val()));
		quantity.next().val(cost);
	}else{
		showMessage("Unable to get the cost of your order! Please check the product name you input!");
	}
}


//ajax判断用户是否存在
$("#userName").blur(function(){
	var $userName=$(this);
	if($userName.val()!=""){
		var sent="opr=listAllWithClues&clueNumber=1&clue1=userName&clueValue1="+$userName.val();
		$.getJSON("usercontrol",sent,showUserMessage);
		function showUserMessage(data){
			if(!$.isEmptyObject(data[1][0])){
				showMessage("The user exists!");
			}else{
				showMessage("Invalid user name!");
			}
		}
	}
}); 


//获取默认收货地址：
$("#userAddressBtn").click(function(){
	var $addressBtn=$(this);
	if($("#userName").val()==""){
		showMessage("Please enter the userName first!");
	}else{
		var sent="opr=listAllWithClues&clueNumber=1&clue1=userName&clueValue1="+$("#userName").val();
		$.getJSON("usercontrol",sent,autoAddress);
		function autoAddress(data){
			if($.isEmptyObject(data[1][0])){
				showMessage("Invalid userName, please change the user name first!");
			}else if(data[1][0].address==null||data[1][0].address==undefined||data[1][0].address.length==0){
				showMessage("You have no set default address!");
			}else{
				$("#userAddress").val(data[1][0].address);
			}
		}
	}
	
});