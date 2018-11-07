var $showBtn2=$("#product-level-info");//显示内容的按钮！
var $outerDiv=$("#main-product-container");//最外层div容器
var $outerUl=$("#first-product-level");//最外层ul

function initProductTree(){
	var sent1="opr=listAllWithClues&clueNumber=1&clue1=type&clueValue1=1";
	$.getJSON("categorycontrol",sent1,getFirstLevel);
	//初始化结束后整体拼接！
	$outerDiv.append($outerUl);
}


function getFirstLevel(data1){
	var $firstLevelCategories=null;//获取的一级商品分类！
	if(data1[1]!=undefined&&data1[1]!=null)
	$firstLevelCategories=data1[1];
	if($.isEmptyObject($firstLevelCategories)){
		var $noParents=$("<li><a href='javascript:;' parentId='0' selfId='0'>No Category To Choose!</a></li>");
		$outerUl.append($noParents);
		return;
	}
	var $firstCategory=null;//每一次遍历的一级分类
	var $firstCategoryContainer=null;//一级的DOM容器！
	var numberOfFirst=$firstLevelCategories.length;
	var currentIndexForLevel1=0;//第一层递归开始
	function formFirstLevel(){
		if(currentIndexForLevel1>=numberOfFirst){
			return;
		}
		$firstCategory=$firstLevelCategories[currentIndexForLevel1];
		var sent2="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=2&clue2=parentId&clueValue2="+$firstCategory.id;//获取当前一级下的二级分类
		$.getJSON("categorycontrol",sent2,getSecondLevel);
		function getSecondLevel(data2){ 
			var $secondLevelCategories=null;//获取的二级商品分类
			if(data2[1]!=undefined&&data2[1]!=null){
				$secondLevelCategories=data2[1];
				if($.isEmptyObject($secondLevelCategories)){
					$firstCategoryContainer=$("<li></li>").appendTo($outerUl);
					var $temp1=$("<a tabindex='-1' parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"</a>").click(function(){$showBtn2.attr("currentId",$(this).attr("selfId"));$showBtn2.attr("type",1);getFirstLevelProducts(1,$(this).attr("selfId"));$showBtn2.html($(this).text()+"<span class='caret'></span>");}).appendTo($firstCategoryContainer);
					currentIndexForLevel1++;
					formFirstLevel();//相当于for循环中的continue
					return;//此次一层循环结束
				}
				$firstCategoryContainer=$("<li class='dropdown-submenu'></li>").appendTo($outerUl);
				var $temp2=$("<a tabindex='-1' parentId='0' selfId='"+$firstCategory.id+"' href='javascript:;'>"+$firstCategory.name+"</a>").click(function(){$showBtn2.attr("currentId",$(this).attr("selfId"));$showBtn2.attr("type",1);getFirstLevelProducts(1,$(this).attr("selfId"));$showBtn2.html($(this).text()+"<span class='caret'></span>");}).appendTo($firstCategoryContainer);
				var $temp3=$("<ul class='dropdown-menu'></ul>").appendTo($firstCategoryContainer);
				var $secondCategory=null;//遍历的二级分类！
				var $secondCategoryContainer=null;//二级的DOM容器
				var numberOfSecond=$secondLevelCategories.length;
				var currentIndexForLevel2=0;
				function formSecondLevel(){
					if(currentIndexForLevel2>=numberOfSecond){
						return;
					}
					$secondCategory=$secondLevelCategories[currentIndexForLevel2];
					var sent3="opr=listAllWithClues&clueNumber=2&clue1=type&clueValue1=3&clue2=parentId&clueValue2="+$secondCategory.id;//获取当前二级下的三级分类
					$.getJSON("categorycontrol",sent3,getThirdLevel);
					function getThirdLevel(data3){
						var $thirdLevelCategories=null;//获取三级商品分类！
						if(data3[1]!=undefined&&data3[1]!=null){
							$thirdLevelCategories=data3[1];
							if($.isEmptyObject($thirdLevelCategories)){
								$secondCategoryContainer=$("<li></li>").appendTo($temp3);
								var $temp4=$("<a tabindex='-1' parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$showBtn2.attr("currentId",$(this).attr("selfId"));$showBtn2.attr("type",2);getSecondLevelProducts(1,$(this).attr("selfId"));$showBtn2.html($(this).text()+"<span class='caret'></span>");}).appendTo($secondCategoryContainer);
								currentIndexForLevel2++;
								formSecondLevel();
								return;
							}
							$secondCategoryContainer=$("<li class='dropdown-submenu'></li>").appendTo($temp3);
							var $temp5=$("<a tabindex='-1' parentId='"+$secondCategory.parentId+"' selfId='"+$secondCategory.id+"' href='javascript:;'>"+$secondCategory.name+"</a>").click(function(){$showBtn2.attr("currentId",$(this).attr("selfId"));$showBtn2.attr("type",2);getSecondLevelProducts(1,$(this).attr("selfId"));$showBtn2.html($(this).text()+"<span class='caret'></span>");}).appendTo($secondCategoryContainer);
							var $temp6=$("<ul class='dropdown-menu'></ul>").appendTo($secondCategoryContainer);
							var $thirdCategory=null;//遍历的三级分类
							var $thirdCategoryContainer=null;//三级分类的容器
							var numberOfThird=$thirdLevelCategories.length;
							for(var i=0;i<numberOfThird;i++){
								$thirdCategory=$thirdLevelCategories[i];
								var $temp7=$("<li></li>").appendTo($temp6);
								var $temp8=$("<a tabindex='-1' parentId='"+$thirdCategory.parentId+"' selfId='"+$thirdCategory.id+"' href='javascript:;'>"+$thirdCategory.name+"</a>").click(function(){$showBtn2.attr("currentId",$(this).attr("selfId"));$showBtn2.attr("type",3);getThirdLevelProducts(1,$(this).attr("selfId"));$showBtn2.html($(this).text()+"<span class='caret'></span>");}).appendTo($temp7);
							}
							
							
						}
						currentIndexForLevel2++;
						formSecondLevel();
						
					}
				}
				formSecondLevel();//第二层递归的入口！
			}
			currentIndexForLevel1++;
			formFirstLevel();//为了保证数据的正确性，一定是在回调函数的结尾调用另外一次的外部函数
		}
		
	}
	formFirstLevel();//第一层递归的入口！
}










//<ul class="dropdown-menu" id="first-product-level">
//<li><a href="javascript:;" parentId="0" selfId="0">Please Select</a></li>
//<li class="dropdown-submenu">
//	<a tabindex="-1" href="#">A</a>
//			<!-- second grade dropdown menu links-->
//			<ul class="dropdown-menu">
//					<li class="dropdown-submenu">
//					<a tabindex="-1" href="#">B</a>
//						<!-- third-->
//					<ul class="dropdown-menu">
//							<li ><a href="javascript:;" rel="0">请选择！</a></li>
//		 				</ul>
//		 					<!-- third -->
//					</li>
//		 		</ul>
//		 		<!-- second -->
//	</li>
//</ul>