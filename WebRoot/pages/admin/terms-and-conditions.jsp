<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>SynixMall Admin</title>
    <meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0"> 
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}lib/admin/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="${pageScope.basePath}css/admin/theme.css">
    <link rel="stylesheet" href="${pageScope.basePath}lib/admin/font-awesome/css/font-awesome.css">

    <script src="lib/admin/jquery-1.8.1.min.js" type="text/javascript"></script>

    <!-- Demo page code -->
    
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7"> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8"> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9"> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body> 
  <!--<![endif]-->
    
   <%@ include file="console_elements/navbar.jsp" %>
    

    <div class="container-fluid">
        
        <div class="row-fluid">
            <%@ include file="console_elements/sidebar.jsp" %>
        <div class="span9">
            <h1 class="page-title">Terms and Conditions</h1>
<div class="well">
    <h2>Terms of Use</h2>
    These Terms and Conditions constitute an agreement (“Agreement”) between you (“you”, “your”, “user”, “Customer”) and the Company.Avocado gumbo artichoke ricebean groundnut tigernut. Daikon kakadu plum water spinach garbanzo eggplant fava bean chard rock melon carrot rutabaga water chestnut broccoli courgette onion. 

    <h2>Eligibility and Identity.</h2>
    To be eligible to use our Services, you must be at least 13 years old. Sorrel jícama tomato silver beet wattle seed black-eyed pea garlic fennel tigernut okra beetroot shallot. Soko shallot melon dandelion bamboo shoot chickpea soybean pumpkin kakadu plum parsley ricebean grape courgette courgette jícama tatsoi. Black-eyed pea gourd tomatillo arugula cucumber celery mustard black-eyed pea cauliflower soybean rutabaga turnip groundnut.

    <h2>Termination</h2>
    You may terminate this Agreement at any time by ceasing all use of the Services and by notifying us. The Company may terminate this Agreement, at any time, without notice to you, if it believes, in its sole judgment, that you have breached or may breach any term or condition of this Agreement. Fennel garlic melon broccoli kohlrabi dulse black-eyed pea chicory watercress shallot bamboo shoot cucumber rutabaga ricebean gourd chickweed gumbo. Burdock fennel sorrel cress collard greens tomato tigernut salad chickweed yarrow water spinach catsear earthnut pea cabbage dulse potato. Onion courgette bitterleaf rutabaga tomatillo tigernut groundnut courgette water spinach tomato. Celery ricebean cabbage salsify caulie watercress cress collard greens potato chard gourd pea sprouts cucumber dulse gram. Leek summer purslane tatsoi catsear celtuce broccoli rabe onion zucchini.

    <h2>Use of Services & Account</h2>
    You represent and warrant that you possess the legal right and ability to enter into this Agreement. You agree not to use the Materials, Content, Services, and your Account for any unlawful or abusive purpose or in any way which interferes with our ability to provide Services to our customers, or which damages our property. Chickpea gourd coriander daikon zucchini lettuce tomatillo sierra leone bologi maize parsnip grape melon kohlrabi welsh onion. Celery wakame corn garlic courgette silver beet cabbage gram amaranth jícama bitterleaf. Ricebean bunya nuts prairie turnip water chestnut artichoke cauliflower watercress gourd cabbage okra broccoli rabe. Burdock leek sorrel radicchio azuki bean collard greens winter purslane broccoli rabe gourd water chestnut pumpkin gumbo. Azuki bean green bean kohlrabi kombu aubergine salsify lotus root turnip lentil radicchio nori eggplant sorrel. 

    <h2>Modification to Service</h2>
    The Company may change, suspend, or discontinue all or any part of the Service at any time, with or without reason. You acknowledge that the operation of the Service may from time to time encounter technical or other problems and may not necessarily continue uninterrupted or without technical or other errors and The Company shall not be responsible to you or others for any such interruptions, errors or problems or an outright discontinuance of the Service. 

    <h2>Intellectual Property Ownership</h2>
    All Materials, Services, Accounts, and content, including, but not limited to, policy information, text, software, music, sound, photographs, video, graphics, the arrangement of text and images, commercially produced information, and other material contained on the Site or through the Services (“Content”), are provided by The Company unless indicated otherwise. Welsh onion tigernut broccoli asparagus brussels sprout jícama eggplant earthnut pea cress chickpea gourd zucchini. Radicchio lentil cucumber groundnut endive kohlrabi winter purslane. Seakale plantain quandong celtuce shallot fennel seakale epazote groundnut dandelion.

    <h2>Privacy</h2>
    Please see our <a href="${pageScope.basePath}pages/admin/privacy-policy.jsp">Privacy Policy</a> as set forth on the site.

    <h2>About These Terms</h2>
    <p>These Terms and Conditions are just a sample and are not legally binding. Real Terms of Services do not (usually) contain vegetables...</p>
</div>


        </div>
    </div>
    

    
    <%@ include file="console_elements/footbar.jsp" %>
   </div>

    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageScope.basePath}lib/admin/bootstrap/js/bootstrap.js"></script>
    
    
    
    
    
    
    
    
    
    
    
    

  </body>
</html>


