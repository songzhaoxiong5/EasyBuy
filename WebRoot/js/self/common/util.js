function parsePath(absolute){
	var relative=null;
	if(absolute==null||absolute==undefined){
		relative="#";
	}else{
		relative=absolute.substring(absolute.indexOf("EasyBuy")+8).replace("\\","/");
	}
	return relative;
}


function afterManipulation(data){
	if(data.message!=null&&data.message!=undefined&&data.message.length!=0){
		$("#result").removeClass("alert-info");
		$("#result").addClass("alert-danger");
		$("#result").html(data.message).fadeIn(1000).fadeOut(5000);
	}else if(data.result=="success"){
		$("#reslut").removeClass("alert-info");
		$("#result").addClass("alert-success");
		$("#result").html("操作成功！").fadeIn(1000).fadeOut(5000);
	}else if(data.result=="error"){
		$("#result").removeClass("alert-info");
		$("#result").addClass("alert-danger");
		$("#result").html("操作失败！").fadeIn(1000).fadeOut(5000);
	}else{
		$("#result").removeClass("alert-info");
		$("#result").addClass("alert-danger");
		$("#result").html("操作失败！").fadeIn(1000).fadeOut(5000);
	}
}

function showMessage(message){
	$("#result").removeClass("alert-info");
	$("#result").addClass("alert-danger");
	$("#result").html(message).fadeIn(1000).fadeOut(5000);
}
//翻译订单状态信息
	function parseStatus(status){
		if(status==1){
			return "待审核";
		}else if(status==2){
			return "审核通过";
		}else if(status==3){
			return "配货中";
		}else if(status==4){
			return "卖家已发货";
		}else if(status==5){
			return "已收货";
		}
	}