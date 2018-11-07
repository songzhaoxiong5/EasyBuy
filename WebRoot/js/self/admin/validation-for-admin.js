/**
 * Created by songzhaoxiong on 2017/9/19.
 */
$(document).ready(function(){
    $("#userAddForm").validate({
            rules:{
                userName:{
                    required:true
                },
                password:{
                    required:true,
                    maxlength:10000,
                    minlength:6
                },
                rePassword:{
                    required:true,
                    maxlength:10000,
                    minlength:6,
                    equalTo:"#password"
                },
                email:{
                    required:true,
                    email:true
                },
                phone:{
                    required:true,
                    checkPhone:true
                },
                realName:{
                    required:true
                },
                PID:{
                    required:true,
                    checkID:true
                },
                law:{
                    required:true
                },
                mobile:{
                	required:true,
                    checkPhone:true
                },
                identityCode:{
                	required:true,
                    checkID:true
                },
                type:{
                	required:true
                }
            },
            messages:{
                userName:{
                    required:"Please enter your user name"
                },
                password:{
                    required:"Password is required",
                    maxlength:"The maximum length of the password is 10000",
                    minlength:"The minimum length of the password is 6"
                },
                rePassword:{
                    required:"This blank is required",
                    maxlength:"Maximum length restricted to 10000",
                    minlength:"Minimum length restricted to 6",
                    equalTo:"The password re-entered does not coincide "
                },
                email:{
                    required:"An e-mail address is required",
                    email:"The pattern is wrong"
                },
                phone:{
                    required:"An cell phone number is required",
                    checkPhone:"The pattern is wrong"
                },
                law:{
                    required:"You must read and agree with the contract"
                },
                realName:{
                    required:"Please enter your real name"
                },
                PID:{
                    required:"Please enter your PID number",
                    checkID:"The pattern is wrong"
                },
                identityCode:{
                	required:"Please enter your identity code"
                },
                mobile:{
                	required:"An cell phone number is required",
                    checkPhone:"The pattern is wrong"
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
    jQuery.validator.addMethod("checkPhone",function(value,element){
        //Only phone numbers with the first two numbers being 13,15 and 18.
        var tel = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
        return this.optional(element) || (tel.test(value));
    },"The pattern is wrong");
    jQuery.validator.addMethod("checkID",function(value,element){
        var ID=/^1{1}[0-9]{17}$/
        return this.optional(element)||(ID.test(value));
    },"The pattern is wrong");
});
