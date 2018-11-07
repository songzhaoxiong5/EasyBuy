var $select1=$("#select1");
var $select2=$("#select2");
var $select3=$("#select3");


//edit页面的相关方法
function initFirstCategory2(){
	$select2.attr("disabled",true);
	$select3.attr("disabled",true);
	var sent1="opr=listAllWithClues&clueNumber=1&clue1=type&clueValue1=1";
	$.getJSON("categorycontrol",sent1,changeSelect1);
}

function changeSelect1(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		var $temp=null;
		var $category1=null;
		for(var i=0;i<data[1].length;i++){
			$category1=data[1][i];
			if($category1.id==$("#prev1").val()){
				continue;
			}
			$temp=$("<option value='"+$category1.id+"' parentId='"+$category1.parentId+"'>"+$category1.name+"</option>").appendTo($select1);
		}
	}
}



function initSecondCategory2(parentId){
	var sent2="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=2&clue2=parentId&clueValue2="+parentId;
	$.getJSON("categorycontrol",sent2,changeSelect2);
}

function changeSelect2(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		$("#default2").text("Please Select!")
		var $temp=null;
		var $category2=null;
		for(var i=0;i<data[1].length;i++){
			$category2=data[1][i];
			if($category2.id==$("#prev2").val()){
				continue;
			}
			$temp=$("<option value='"+$category2.id+"' parentId='"+$category2.parentId+"'>"+$category2.name+"</option>").appendTo($select2);
		}
		$(select2).attr("disabled",false);
	}else{
		$("#default2").text("No applicable!");
		$("#default2").attr("selected",true);
		$("#default3").text("No applicable!");
		$("#default3").attr("selected",true);
		$select2.attr("disabled",true);
		$select3.attr("disabled",true);
	}
}


function initThirdCategory2(parentId){
	var sent3="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=3&clue2=parentId&clueValue2="+parentId;
	$.getJSON("categorycontrol",sent3,changeSelect3);
}

function changeSelect3(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		$("#default3").text("Please Select!");
		var $temp=null;
		var $category3=null;
		for(var i=0;i<data[1].length;i++){
			$category3=data[1][i];
			if($category3.id==$("#prev3").val()){
				continue;
			}
			$temp=$("<option value='"+$category3.id+"' parentId='"+$category3.parentId+"'>"+$category3.name+"</option>").appendTo($select3);
		}
		$select3.attr("disabled",false);
	}else{
		$("#default3").text("No applicable!");
		$select3.attr("disabled",true);
	}
}


$select1.on("change",function(){
	if ($("option:selected",this).val() == "") {
		$select2.attr("disabled",true);
		$("#default2").text("Please Select!");
		$("#default3").text("Please Select!");
		$("#default2").attr("selected",true);
		$("#default3").attr("selected",true);
		$select3.attr("disabled",true);
	}else{
		$("#select2 option:gt(0)").remove();
		initSecondCategory2($("option:selected",this).val());
	}
});

$select2.on("change",function(){
	if ($("option:selected",this).val() == "") {
		$("#default1").attr("selected",true);
		$select3.attr("disabled",true);
		$("#default3").text("Please Select");
		$("#default3").attr("selected",true);
	}else{
		$("#select3 option:gt(0)").remove();
		initThirdCategory2($("option:selected",this).val());
	}
});

function getPreviousCategoryNames(){
	var sent1="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+$("#prev1").val();
	$.getJSON("categorycontrol",sent1,function(data){
		var category1=data[1][0].name;
		$("#prev1").text(category1);
	});
	var sent2="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+$("#prev2").val();
	$.getJSON("categorycontrol",sent2,function(data){
		var category2=data[1][0].name;
		$("#prev2").text(category2);
	});
	var sent3="opr=listAllWithClues&clueNumber=1&clue1=id&clueValue1="+$("#prev3").val();
	$.getJSON("categorycontrol",sent3,function(data){
		var category3=data[1][0].name;
		$("#prev3").text(category3);
	});
}