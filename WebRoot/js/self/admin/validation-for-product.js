/**
 * Created by songzhaoxiong on 2017/9/19.
 */
$(document).ready(function(){
    $("#productAddForm").validate({
            rules:{
                name:{
                    required:true
                },
                price:{
                	required:true
                },
                stock:{
                	required:true
                },
                categoryLevel1:{
                	required:true
                },
                categoryLevel2:{
                	required:true
                },
                categoryLevel3:{
                	required:true
                },
                isDelete:{
                	required:true
                }
            },
            messages:{
                name:{
                    required:"Please enter the product name!"
                },
                price:{
                	required:"Please enter the price!"
                },
                stock:{
                	required:"Please enter the stock!"
                },
                categoryLevel1:{
                	required:"Please enter the Category Level 1"
                },
                categoryLevel2:{
                	required:"Please enter the Category Level 2"
                },
                categoryLevel3:{
                	required:"Please enter the Category Level 3"
                },
                isDelete:{
                	required:"Please select the status of the product!"
                }
            },
            onfocusout:function(element){
                $(element).valid();
            },
            errorPlacement: function (error, element) {
                if ($(element).is(":checkbox")) {
                    error.appendTo($(element).parents("div[class='controls']"));
                } else {
                    $(element).after(error);
                }
            },
            errorElement: "div"
        }
    );
    
    $("#productModifyForm").validate({
        rules:{
            name:{
                required:true
            },
            price:{
            	required:true
            },
            stock:{
            	required:true
            },
            categoryLevel1:{
            	required:true
            },
            categoryLevel2:{
            	required:true
            },
            categoryLevel3:{
            	required:true
            },
            isDelete:{
            	required:true
            }
        },
        messages:{
            name:{
                required:"Please enter the product name!"
            },
            price:{
            	required:"Please enter the price!"
            },
            stock:{
            	required:"Please enter the stock!"
            },
            categoryLevel1:{
            	required:"Please enter the Category Level 1"
            },
            categoryLevel2:{
            	required:"Please enter the Category Level 2"
            },
            categoryLevel3:{
            	required:"Please enter the Category Level 3"
            },
            isDelete:{
            	required:"Please select the status of the product!"
            }
        },
        onfocusout:function(element){
            $(element).valid();
        },
        errorPlacement: function (error, element) {
            if ($(element).is(":checkbox")) {
                error.appendTo($(element).parents("div[class='controls']"));
            } else {
                $(element).after(error);
            }
        },
        errorElement: "div"
    }
);
    
    
});
