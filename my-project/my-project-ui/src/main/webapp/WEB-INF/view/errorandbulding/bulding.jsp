<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--导入mainContextHead--%>
    <%@include file="../include/maincontext_head.jsp"%>
    <%--导入mainContextHead--%>
        <%--外部提取后的css文件--%>
        <link rel="stylesheet" href="/static/common_js/errorCSS/bulding_404.styl">
    <%--drop文件--%>
        <link href="https://cdn.bootcss.com/dropzone/5.5.1/min/dropzone.min.css" rel="stylesheet">
        <link href="https://cdn.bootcss.com/dropzone/5.5.1/min/basic.min.css" rel="stylesheet">
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
    <div class="panel" style="background-image: url('/static/MainContain/images/bulding.jpg')">
        <div class="text-center">
            <h2><stong>对不起，你访问的页面不存在请重新搜索</stong></h2>
            <div class="padding-big"> <a href="/" class="btn btn-info btn-lg" >返回</a>
            </div>
        </div>
        <br><br><br><br><br><<br><br>
    </div>
</section>
<hr />
<br />
<br />
<script src="https://cdn.bootcss.com/dropzone/5.5.1/min/dropzone.min.js"></script>
<jsp:include page="../include/maincontext_footer.jsp"></jsp:include>
</body>
</html>
