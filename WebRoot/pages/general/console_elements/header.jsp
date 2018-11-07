<%
	EasyBuy_User user=(EasyBuy_User)session.getAttribute("login");//判断是否进行了登录！
	String accountURL="#";
	if(user!=null){//如果登录了
		pageContext.setAttribute("loginUser", user);
		if(user.getType()==1){
			accountURL="pages/general/user_console/user_info.jsp";
		}else if(user.getType()==0){
			accountURL="pages/general/user_console/user_info.jsp";
		}else{
			accountURL="pages/general/register.jsp";
		}
	}else{//如果未登录，如果点击账户按钮会跳转到登录页面
		accountURL="pages/general/login.jsp";
	}
	pageContext.setAttribute("accountURL",accountURL);

 %>
<header>
			<input type="hidden" id="clientInfo" name="clientInfo" isLogin="${!empty pageScope.loginUser}" loginName="${!empty pageScope.loginUser?pageScope.loginUser.userName:'Visitor'}">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-12">
                        <div class="logo">
                            <a href="#"><img src="img/logo/logo.png" alt="SynixMall"></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-12 hidden-xs">
                        <div class="search-form">
                            <form id="search-form" action="">
                                <input type="search" placeholder="What do you want to search  . ." name="searchClue" id="searchBox" value="${pageScope.searchString}"/>
                                <ul id="hintContainer">
                                	
                                </ul>
                                <button type="button" id="searchButton"><i class="fa fa-search"></i>Search</button>
                            </form>                                
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5 col-sm-12">     
                        <div class="header-right-menu">
                            <!-- 购物车图标部分包括下拉部分-->
                            <ul class="header-r-cart">
                                <li><a class="cart" href="pages/general/cart.jsp"><i class="fa fa-shopping-cart"></i>Shopcart</a>
                                    <div class="mini-cart-content">
                                        <div class="mini-bottom-sec">
                                            <p class="total-amount">Subtotal: <span>$0</span></p>
                                            <div class="button"><a href="ordercontrol?opr=checkIdentity&position=outside">CHECKOUT</a></div>
                                            <div class="button"><a href="pages/general/cart.jsp">View Cart</a></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <ul class="header-r-account header-menu">
                                <li><a href="#"><i class="fa fa-user"></i>MY ACCOUNT<i class="fa fa-angle-down"></i></a>
                                    <ul class="header-dropdown" id="accountList">
                                        <li><a href="${pageScope.basePath}pages/general/login.jsp">Login</a></li>
                                        <li><a href="${pageScope.basePath}pages/general/register.jsp">Register</a></li>
                                        <c:if test="${! empty pageScope.loginUser}">
                                        	<li><a href="${pageScope.accountURL}" id="accountBtn">Account</a></li>
                                        </c:if>
                                        <c:if test="${pageScope.loginUser.type ==0 }">
                                        	<li><a href="${pageScope.basePath}pages/admin/index.jsp">Administration</a></li>
                                        </c:if>
                                        <c:if test="${! empty pageScope.loginUser}">
                                        	<li><a href="${pageScope.basePath}login?opr=logout">Log Out</a></li>
                                        </c:if>
                                        
                                    </ul>
                                </li>
                            </ul>
                            <ul class="settings header-menu">
                                <li><a href="#"><i class="fa fa-cog"></i></a>
                                    <ul class="header-dropdown">
                                        <li><a href="javascript:;" class="title"><i class="fa fa-globe"></i>Language</a></li>
                                        <li><a href="javascript:;">Chinese</a></li>
                                        <li><a href="javascript:;">English</a></li>
                                        <li><a href="javascript:;">Japanese</a></li>
                                        <li><a href="javascript:;" class="title"><i class="fa fa-money"></i>Currency</a></li>
                                        <li><a href="javascript:;">RMB</a></li>
                                        <li><a href="javascript:;">US Dollar</a></li>
                                        <li><a href="javascript:;">Yen</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
