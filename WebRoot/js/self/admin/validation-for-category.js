/**
 * Created by songzhaoxiong on 2017/9/19.
 */
$(document).ready(function(){
    $("#categoryAddForm").validate({
            rules:{
                name:{
                    required:true
                },
                type:{
                	required:true
                }
            },
            messages:{
                name:{
                    required:"Please enter the category name!"
                },
                type:{
                    required:"Please enter the category type",
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
    
    $("#categoryModifyForm").validate({
        rules:{
            name:{
                required:true
            },
            type:{
            	required:true
            }
        },
        messages:{
            name:{
                required:"Please enter the category name!"
            },
            type:{
                required:"Please enter the category type",
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
