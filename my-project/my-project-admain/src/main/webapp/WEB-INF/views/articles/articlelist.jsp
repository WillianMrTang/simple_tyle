<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--head引入外部文件--%>
    <jsp:include page="../includes/headinclude.jsp"></jsp:include>
<%--head引入外部文件--%>
</head>
<body>
<div id="wrapper">
    <%--center外部文件引入--%>
    <jsp:include page="../includes/topinclude.jsp"></jsp:include>
    <%--center外部文件引入--%>

    <!-- daohang外部文件引入 -->
   <jsp:include page="../includes/daohanginclude.jsp"></jsp:include>
    <!-- daohang外部文件引入-->
    <div id="page-wrapper">
        <div id="page-inner" style="background-color: lightgray">

            <div class="col-md-12">
                <h1 class="page-head-line" style="color: black;text-align: center;padding-top: 6px">文章列表</h1>
            </div>
            <c:if test="${ not empty msg}">
            <div class="panel-body" style="padding: 0px;">
                <div class="chat-widget-main">
                    <div class="chat-widget-right">
                        <p style="font-weight: 800;font-size: 20px;text-align: center">${msg}</p>
                    </div>
                </div>
            </div>
            </c:if>
            <div class="row">
                <br><br><br>
                <c:forEach items="${articlelist}" var="listarticle">
                <div class="col-md-12 col-sm-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            ${listarticle.smalltitle}
                        </div>
                        <div class="panel-body">
                            <p>${listarticle.firstartic}</p>
                        </div>
                        <div class="panel-footer">
                            |点赞数&nbsp;&nbsp;<i class="glyphicon glyphicon-thumbs-up" title="点赞数">${listarticle.fabulous}</i>|
                            上传时间&nbsp;&nbsp;<i class="glyphicon glyphicon-time" title="上传时间">${listarticle.uoloadtime}</i>|
                            <%--<a href="/articles/delarticle"><button type="button" class="btn btn-info">删除</button></a>--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/articles/selectbyid?id=${listarticle.id}" class="glyphicon glyphicon-fullscreen" style="color: darkred;font-size: 28px;" title="查看文章"></a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<%--footerInclude引入外部文件--%>
<jsp:include page="../includes/footinclude.jsp"></jsp:include>
<%--footerInclude引入外部文件--%>
</body>
</html>
