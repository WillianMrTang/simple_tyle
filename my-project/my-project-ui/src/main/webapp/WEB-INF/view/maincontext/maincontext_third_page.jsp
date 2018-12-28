<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--导入mainContextHead--%>
    <%@include file="../include/maincontext_head.jsp"%>
    <%--导入mainContextHead--%>
     <link rel="stylesheet" href="/static/common_js/errorCSS/bulding_404.styl">
</head>
<body class="user-select">
<header class="header">
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
                <img src="../../../static/atricleimgs/LOGO.jpg" alt="TWG" style="width: 180px; height: 56px;" id="borderR">
                <form class="navbar-form visible-xs" action="/Search" method="post">
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
                        <span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
                </form>
                    <%--<jsp:include page="include/maincontext_daohang.jsp"></jsp:include>--%>
                    <%@include file="../include/maincontext_daohang.jsp"%>
            </div>
        </div>
    </nav>
</header>
<hr />
<br />
<br />
<br />
<section class="container">
    <br />
    <div class="panel">
        <div class="text-center">
            <h2><stong>对不起，你访问的页面不存在请重新搜索</stong></h2>
            <div class="padding-big"> <a href="/" class="btn btn-info btn-lg" >返回</a>
            </div>
            <div class="padding-big">
                <h3>欢迎进行其他资讯</h3>
            </div>
            <div class="padding-big">
                <h4>欢迎进行其他资讯</h4>
            </div>
        </div>
        <br><br><br><br><br><<br><br>
    </div>
</section>
<hr />
<br />
<br />
<jsp:include page="../include/maincontext_footer.jsp"></jsp:include>
</body>
</html>