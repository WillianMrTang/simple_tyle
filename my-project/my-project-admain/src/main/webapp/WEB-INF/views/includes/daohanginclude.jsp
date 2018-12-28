<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <div class="user-img-div">
                    <img src="../../static/BackStage/assets/img/user.png" class="img-thumbnail" />
                    <div class="inner-text">
                        <span>Willian_Tang</span>&nbsp;&nbsp;
                        <c:choose>
                            <c:when test="${empty sessionScope.admain}">
                        离线:<small style="color: red"> OFFline</small>
                            </c:when>
                            <c:otherwise>
                        在线:<small style="color: green"> ONline</small>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>

            </li>


            <li>
                <a class="active-menu"><i class="glyphicon glyphicon-flag"></i>
                    You are good enough, and difficulties will make way for you
                </a>
            </li>
            <%--第一部分导航--%>
            <li>
                <a href="#"><i class="glyphicon glyphicon-user"></i>用户管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/user/userlist"><i class="glyphicon glyphicon-th-list "></i>用户信息</a>
                    </li>
                    <li>
                        <a href="/user/delandchange"><i class="glyphicon glyphicon-remove "></i>删除用户</a>
                    </li>
                    <li>
                        <a href="/user/delandchange"><i class="glyphicon glyphicon-pencil"></i>编辑用户</a>
                    </li>
                    <li>
                        <a href="/user/addnewuser"><i class="glyphicon glyphicon-plus "></i>添加用户</a>
                    </li>
                    <li>
                        <a href="/user/delandchange"><i class="glyphicon glyphicon-search"></i>用户搜索</a>
                    </li>
                </ul>

            </li>
            <%--第二部分导航--%>
            <li>
                <a href="#"><i class="glyphicon glyphicon-comment"></i>评论管理 <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse in">
                    <li>
                        <a href="/comment/tocomment"><i class="glyphicon glyphicon-list-alt"></i>评论列表</a>
                    </li>
                </ul>
            </li>
            <%--第三部分--%>
            <li>
                <a class="active-menu-top" href="#"><i class="glyphicon glyphicon-book"></i>文章管理<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse in">
                    <li>
                        <a href="/articles/toarticlelist"><i class="glyphicon glyphicon-folder-open"></i>文章列表</a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>

</nav>
