<%@ page language="java" import="java.util.*,com.szx.bean.*,com.szx.service.*,com.szx.service.impl.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8" />

	<title>Welcome to my E-Shop!</title>
	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="media/css/login-soft.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

	<!-- STYLES FOR FORM ERRORS-->

	<link rel="stylesheet" href="css/self/label-for-error.css"/>

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->
<%	
	request.setCharacterEncoding("UTF-8");
	String opr=request.getParameter("opr");
	String userName=!("wrong".equals(opr))?"":request.getParameter("userName");
  	String sex=!("wrong".equals(opr))?"":request.getParameter("sex");
  	String realName=!("wrong".equals(opr))?"":request.getParameter("realName");
  	String PID=!("wrong".equals(opr))?"":request.getParameter("PID");
  	String email=!("wrong".equals(opr))?"":request.getParameter("email");
  	String phone=!("wrong".equals(opr))?"":request.getParameter("phone");
  	String type=!("wrong".equals(opr))?"":request.getParameter("userType");
 %>

<body class="login">

	<!-- BEGIN LOGO -->

	<div class="logo">

		<img src="media/image/logo-big.png" alt="" /> 

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form id="myForm" class="form-vertical login-form" action="register">

			<h3 class="form-title">Register to Synix Mall</h3>

			<div class="alert alert-error hide">

				<button class="close" data-dismiss="alert"></button>

				<span>Enter any username and password.</span>

			</div>

			<div class="control-group">

				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->

				<label class="control-label visible-ie8 visible-ie9">Username</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="User name" name="userName" value="<%=userName%>"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

						<input class="m-wrap placeholder-no-fix" type="password" placeholder="Password" name="password" id="password"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Re-enter Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-key"></i>

						<input class="m-wrap placeholder-no-fix" type="password" placeholder="Re-enter password" name="rePassword"/>

					</div>

				</div>

			</div>

			<div class="control-group">

					<label class="radio">

						Male<input type="radio"  name="sex" value="1" checked/>&nbsp;

						Female<input type="radio"  name="sex" value="0"/>

					</label>


			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Real Name</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-briefcase"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Enter your real name" name="realName" value="<%=realName%>"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Personal Identification</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-reorder"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Enter your PID" name="PID" value="<%=PID%>"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Email</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Enter your Email address" name="email" value="<%=email%>"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Cell Phone</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-phone"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Enter your phone number" name="phone" value="<%=phone%>"/>

					</div>

				</div>

			</div>

		<div class="control-group">

					<label class="radio">

						
						General<input type="radio"  name="userType" value="1" checked/>&nbsp;

						Administration<input type="radio"  name="userType" value="0"/>

					</label>
					
		</div>


			<div class="control-group">

				<div class="controls">

						<input type="checkbox" name="law"/> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>

				</div>

			</div>

			<div class="form-actions">

				<button type="submit" id="register-submit-btn" class="btn blue pull-right" action="register">

					Sign Up <i class="m-icon-swapright m-icon-white"></i>

				</button>

			</div>

			<div class="forget-password">

				<h4>Forgot your password ?</h4>

				<p>

					no worries, click <a href="javascript:;" class="" id="forget-password">here</a>

					to reset your password.

				</p>

			</div>

		</form>

		<!-- END LOGIN FORM -->        

		<!-- BEGIN FORGOT PASSWORD FORM -->

		<form class="form-vertical forget-form" action="index.html">

			<h3 class="">Forget Password ?</h3>

			<p>Enter your e-mail address below to reset your password.</p>

			<div class="control-group">

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-envelope"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Email" name="email" />

					</div>

				</div>

			</div>

			<div class="form-actions">

				<button type="button" id="back-btn" class="btn">

				<i class="m-icon-swapleft"></i> Back

				</button>

				<button type="submit" class="btn blue pull-right">

				Submit <i class="m-icon-swapright m-icon-white"></i>

				</button>            

			</div>

		</form>

		<!-- END FORGOT PASSWORD FORM -->


	</div>

	<!-- END LOGIN -->

	<!-- BEGIN COPYRIGHT -->

	<div class="copyright">

		2017 &copy; Synix Mall - Synix All Rights Reserved.

	</div>

	<!-- END COPYRIGHT -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="media/js/jquery.validate.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.backstretch.min.js" type="text/javascript"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="media/js/app.js" type="text/javascript"></script>

	<script src="media/js/login-soft.js" type="text/javascript"></script>

	<!-- REGISTER VALIDATION-->

	<script type="text/javascript" src="js/self/general/register-validation.js"></script>

	<!-- END PAGE LEVEL SCRIPTS --> 

	<script type="text/javascript">

		jQuery(document).ready(function() {     

		  App.init();

		  Login.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

</body>
</html>
