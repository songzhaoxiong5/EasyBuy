var $select1=$("#select1");
var $select2=$("#select2");
var $select3=$("#select3");
var $categoryForm=$("#productAddForm");

function initFirstCategory(){
	$select2.attr("disabled",true);
	$select3.attr("disabled",true);
	var sent1="opr=listAllWithClues&clueNumber=1&clue1=type&clueValue1=1";
	$.getJSON("categorycontrol",sent1,fillSelect1);
}




function fillSelect1(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		var $temp=null;
		var $category1=null;
		for(var i=0;i<data[1].length;i++){
			$category1=data[1][i];
			$temp=$("<option value='"+$category1.id+"' parentId='"+$category1.parentId+"'>"+$category1.name+"</option>").appendTo($select1);
		}
	}
}

function initSecondCategory(parentId){
	var sent2="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=2&clue2=parentId&clueValue2="+parentId;
	$.getJSON("categorycontrol",sent2,fillSelect2);
}

function fillSelect2(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		$("#default2").text("Please Select!")
		var $temp=null;
		var $category2=null;
		for(var i=0;i<data[1].length;i++){
			$category2=data[1][i];
			$temp=$("<option value='"+$category2.id+"' parentId='"+$category2.parentId+"'>"+$category2.name+"</option>").appendTo($select2);
		}
		$(select2).attr("disabled",false);
	}else{
		$("#default2").text("No applicable!");
		$("#default3").text("No applicable!");
		$select2.attr("disabled",true);
		$select3.attr("disabled",true);
	}
}

function initThirdCategory(parentId){
	var sent3="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=3&clue2=parentId&clueValue2="+parentId;
	$.getJSON("categorycontrol",sent3,fillSelect3);
}

function fillSelect3(data){
	if(data!=null&&data!=undefined&&!$.isEmptyObject(data[1])){
		$("#default3").text("Please Select!");
		var $temp=null;
		var $category3=null;
		for(var i=0;i<data[1].length;i++){
			$category3=data[1][i];
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
		initSecondCategory($("option:selected",this).val());
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
		initThirdCategory($("option:selected",this).val());
	}
});