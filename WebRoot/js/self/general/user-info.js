

$(document).on("click","a.editable",function(){
	$(this).parent().parent().find("input").attr("readonly",false);
});
$("#updateInfoBtn").click(function(){
	var flag=true;
	$("#infoTable").find("input").each(function(){
		if($(this).val()==""){
			flag=false;
		}
	});
	if(flag){
		$("#infoTable").find("input").attr("readonly",false);
		var sent=$("#infoForm").serialize();
		$.getJSON("usercontrol",sent,function(data){
			if(data.result=="success"){
				alert("用户信息修改成功！");
			}else{
				alert("用户信息修改失败，请稍后再试，或者联系系统管理员！");
			}
		});
	}else{
		alert("No field should be left empty!");
	}
});