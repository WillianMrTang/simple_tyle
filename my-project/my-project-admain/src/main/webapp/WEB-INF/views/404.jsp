<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--head引入外部文件--%>
    <jsp:include page="includes/headinclude.jsp"></jsp:include>
    <%--head引入外部文件--%>
    <style type="text/css">
        body
    </style>
</head>
<body>
<div id="wrapper">
    <%--center外部文件引入--%>
    <jsp:include page="includes/topinclude.jsp"></jsp:include>
    <%--center外部文件引入--%>

    <!-- daohang外部文件引入 -->
   <jsp:include page="includes/daohanginclude.jsp"></jsp:include>
    <!-- daohang外部文件引入-->
    <div id="page-wrapper">
        <div id="page-inner" style="background-color: lightgray">
            <img src="/static/BackStage/assets/img/404.jpg">

                <%--<h1 class="page-head-line" style="color: black;text-align: center;padding-top: 6px">哎呀!~~ 页面好像走丢了。。。。。。</h1>--%>
                <h1 style="color: black;text-align: center;padding-top: 6px">哎呀!~~ 页面好像走丢了。。。。。。</h1>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<%--footerInclude引入外部文件--%>
<jsp:include page="includes/footinclude.jsp"></jsp:include>
<%--footerInclude引入外部文件--%>
</body>
</html>
