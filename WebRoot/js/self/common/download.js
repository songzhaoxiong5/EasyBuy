$(".download").on("click",function(){
	var filePath=$(this).attr("src");
	var fileName=filePath.substring(filePath.lastIndexOf("\\")+1);
	location.href="download?filePath="+filePath+"&fileName="+fileName;
});