<div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <ul class="nav pull-right">
                    
                    <li id="fat-menu" class="dropdown">
                        <a href="#" id="drop3" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> ${sessionScope.login.userName}
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">Settings</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="${pageScope.basePath}login?opr=logout">Logout</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <a class="brand" href="${pageScope.basePath}pages/general/index.jsp"><span class="first">Your</span> <span class="second">Company</span></a>
            </div>
        </div>
    </div>