var $hintContainer=$("#hintContainer");//智能查询提示窗(ul元素)
var $searchBox=$("#searchBox");//输入窗口
var $searchButton=$("#searchButton");//搜索按钮
//输入窗口的按键事件
$searchBox.keyup(function(){
	getSearchPages(1,12,formHintContainer);
});


//获取商品页面的通用方法
function getSearchPages(pageIndex,pageSize,fn){
	if(pageIndex&&pageIndex>0){
		var sent="opr=searchWithClues&pageIndex="+pageIndex+"&pageSize="+pageSize+"&clueNumber=3&target1=name&target2=description&searchString="+$searchBox.val();
		$.getJSON("productcontrol",sent,fn);
	}
}


function clearHintContainer(){
	$hintContainer.html("");
}

//生成智能提示窗的方法
function formHintContainer(data){
	clearHintContainer();
	var entity=data[1].list;
	if(entity.length>0){
		for(var i=0;i<entity.length;i++){
			var $searchResultContainer=$("<li class='searchResultContainer'></li>").appendTo($hintContainer);
			var $searchResultLink=$("<a class='searchResultLink' href='pages/general/product-details.jsp?productId="+entity[i].id+"'>"+entity[i].name+"</a>").click(function(){
				$searchBox.val($(this).text());//将当前搜索结果的内容输入到搜索窗格中！
				$hintContainer.hide();//将智能提示窗关闭！
			}).appendTo($searchResultContainer);
		}//搜索结果拼接完毕
	//拼接页面的分页部分
	
	var $pagiContainer=$("<li class='pagination'></li>").appendTo($hintContainer);
	var $prev=$("<a class='pagiprev'>Previous&nbsp;&nbsp;</a>").click(function(){getSearchPages(data[1].currentPageNo-1,12,formHintContainer)}).appendTo($pagiContainer);
	var $next=$("<a class='paginext'>Next&nbsp;&nbsp;</a>").click(function(){getSearchPages(data[1].currentPageNo+1,12,formHintContainer)}).appendTo($pagiContainer);
	var $close=$("<a class='pagiclose'>Close&nbsp;&nbsp;</a>").click(function(){$hintContainer.hide();}).appendTo($pagiContainer);
	
	if(data[1].currentPageNo==1){
		$prev.attr("disabled",true);
	}
	if(data[1].currentPageNo==data[1].totalPageCount){
		$next.attr("disabled",true);
	}
	$hintContainer.show();//拼接完毕后显示窗口！
	}else{
		$("hintContainer").hide();//如果查询结果数量为0，不显示提示窗
	}
}

//搜索按钮点击事件
$searchButton.click(function(){
	if($searchBox.val()==""){
		alert("The search string cannot be empty!");
	}else{
		location.href="pages/general/search-results.jsp?searchString="+$searchBox.val();
	}
});
