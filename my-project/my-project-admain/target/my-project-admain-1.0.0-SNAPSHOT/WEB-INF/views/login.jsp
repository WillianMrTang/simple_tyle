<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--head引入外部文件--%>
    <jsp:include page="includes/headinclude.jsp"></jsp:include>
    <%--head引入外部文件--%>
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
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line" style="background-color: #D9EDF7;color: black;text-align: center;padding-top: 6px">后台登录</h1>
                    <h1 class="page-subhead-line"><span style="font-weight: 700;font-size: 16px">特别提示 :</span>请先登录，才能有访问权限</h1>
                </div>
            </div>
        <%--登录--%>
            <div class="row">
                <br><br><br><br><br>
                <div class="col-md-3"></div>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <c:choose>
                            <c:when test="${not empty msg}">
                                <span style="color: red">${msg}</span>
                            </c:when>
                            <c:otherwise>
                                欢 迎 登 录！
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="panel-body">
                        <form action="/login" method="post">
                            <div class="form-group">
                                <label class="glyphicon glyphicon-user">:&nbsp;管理员</label>
                                <input class="form-control glyphicon glyphicon-user" type="text" placeholder="请输入管理名" name="admin">
                            </div>
                            <div class="form-group">
                                <label class="glyphicon glyphicon-lock">:&nbsp;密码</label>
                                <input class="form-control" type="text" placeholder="请输入密码" name="pwd">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-info btn-block">登录</button>
                        </form>
                    </div>
                </div>
            </div>
                <div class="col-md-3"></div>
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
