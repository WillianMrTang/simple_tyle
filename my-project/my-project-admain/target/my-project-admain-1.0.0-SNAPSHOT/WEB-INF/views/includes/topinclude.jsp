<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">全栈工程师</a>
    </div>
    <div class="header-right">
        <c:choose>
            <c:when test="${not empty sessionScope.admain}">
                <%--<button class="btn btn-success btn-lg"></button>--%>
                ~@_@已登录！<a href="#" class="btn btn-info btn-lg" title="已登录"><i class="glyphicon glyphicon-star"></i></a>
            </c:when>
            <c:otherwise>
                <a href="/" class="btn btn-info btn-lg" title="登录"><i class="glyphicon glyphicon-log-in"></i></a>
            </c:otherwise>
        </c:choose>
        <a href="/index" class="btn btn-info btn-lg " title="返回主页"><b></b><i class="glyphicon glyphicon-home"></i></a>
        <a href="/articles/toarticlelist" class="btn btn-info btn-lg" title="文章列表页"><b></b><i class="glyphicon glyphicon-book"></i></a>
        <a href="#" class="btn btn-info btn-lg" title="备忘录"><i class="glyphicon glyphicon-comment"></i></a>
        <a href="/logout" class="btn btn-info btn-lg" title="注销"><i class="glyphicon glyphicon-log-out"></i></a>
    </div>
</nav>