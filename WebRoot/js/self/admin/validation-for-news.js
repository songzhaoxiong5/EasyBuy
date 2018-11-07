/**
 * Created by songzhaoxiong on 2017/9/19.
 */
$(document).ready(function(){
    $("#newsAddForm").validate({
            rules:{
                title:{
                    required:true
                },
                createTime:{
                    checkTime:true
                },
                content:{
                	required:true
                }
            },
            messages:{
                userName:{
                    required:"Please enter the news title!"
                },
                createTime:{
                    checkTime:"The pattern should be yy-MM-dd hh:mm:ss!"
                },
                content:{
                	required:"Please enter the news content!"
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
    jQuery.validator.addMethod("checkTime",function(value,element){
        //Only phone numbers with the first two numbers being 13,15 and 18.
        var time = /^(((20[0-3][0-9]-(0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|(20[0-3][0-9]-(0[2469]|11)-(0[1-9]|[12][0-9]|30))) (20|21|22|23|[0-1][0-9]):[0-5][0-9]:[0-5][0-9])$/
        return this.optional(element) || (time.test(value));
    },"The pattern is wrong");
    
		    $("#newsModifyForm").validate({
		        rules:{
		            title:{
		                required:true
		            },
		            createTime:{
		                checkTime:true
		            },
		            content:{
		            	required:true
		            }
		        },
		        messages:{
		            userName:{
		                required:"Please enter the news title!"
		            },
		            createTime:{
		                checkTime:"The pattern should be yy-MM-dd hh:mm:ss!"
		            },
		            content:{
		            	required:"Please enter the news content!"
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
		jQuery.validator.addMethod("checkTime",function(value,element){
		    //Only phone numbers with the first two numbers being 13,15 and 18.
		    var time = /^(((20[0-3][0-9]-(0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|(20[0-3][0-9]-(0[2469]|11)-(0[1-9]|[12][0-9]|30))) (20|21|22|23|[0-1][0-9]):[0-5][0-9]:[0-5][0-9])$/
		    return this.optional(element) || (time.test(value));
		},"The pattern is wrong");
    
    
});
