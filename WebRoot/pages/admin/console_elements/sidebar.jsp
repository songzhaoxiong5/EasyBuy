<div class="span3">
                <div class="sidebar-nav">
                  <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu"><i class="icon-dashboard"></i>Dashboard</div>
                    <ul id="dashboard-menu" class="nav nav-list collapse in">
                        <li><a href="${pageScope.basePath}pages/admin/index.jsp">Home</a></li>            
                    </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#user-menu"><i class="icon-briefcase"></i>User Management</div>
                <ul id="user-menu" class="nav nav-list collapse in">
                	<li><a href="${pageScope.basePath}pages/admin/users.jsp">User List</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/user_add.jsp">Add User</a></li>
                </ul>

                <div class="nav-header" data-toggle="collapse" data-target="#news-menu"><i class="icon-bullhorn"></i>News Management</div>
                <ul id="news-menu" class="nav nav-list collapse in">
                 	<li><a href="${pageScope.basePath}pages/admin/news.jsp">News List</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/news_add.jsp">Add News</a></li>
                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#product-menu"><i class="icon-gift"></i>Product Management</div>
                <ul id="product-menu" class="nav nav-list collapse in">
                  	<li><a href="${pageScope.basePath}pages/admin/products.jsp">Product List</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/product_add.jsp">Add Product</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/categories.jsp">Category List</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/category_add.jsp">Add Category</a></li>
                </ul>
                <div class="nav-header" data-toggle="collapse" data-target="#order-menu"><i class="icon-shopping-cart"></i>Order Management</div>
                <ul id="order-menu" class="nav nav-list collapse in">
                  	<li><a href="${pageScope.basePath}pages/admin/orders.jsp">Order List</a></li>
                  	<li><a href="${pageScope.basePath}pages/admin/order_add.jsp">Add Order</a></li>
                </ul>
            </div>
</div>