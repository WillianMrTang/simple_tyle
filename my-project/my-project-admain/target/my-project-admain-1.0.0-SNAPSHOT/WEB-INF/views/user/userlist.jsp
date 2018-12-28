<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--head引入外部文件--%>
    <jsp:include page="../includes/headinclude.jsp"></jsp:include>
    <%--head引入外部文件--%>
        <script src="/static/BackStage/assets/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        /*根据id修改用户*/
        function edit(id){
            location.href="/user/edituser?editId="+id;
        }
        /*根据id删除用户*/
        function dele(id){
            location.href="/user/deluser?idorname="+id;
        }
    </script>
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
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-head-line" style="background-color: #00CA79;color: black;text-align: center;padding-top: 6px">用户列表</h1>
                    <h1 class="page-subhead-line"><span style="font-weight: 700;font-size: 16px">特别提示 :</span>以下是用户的相关信息展示！请仔细审查过后再进行相关操作</h1>

                    <h1 class="page-subhead-line"><span style="font-weight: 700;font-size: 16px;color: #00CA79">${msg}</span></h1>
                </div>
            </div>
        <%--用户--%>
            <div class="row">
                <div class="col-md-12">
                    <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           高举旗帜你 管理员  @ V @ ?......
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead align="center">
                                    <tr>
                                        <th style="text-align: center">序号</th>
                                        <th style="text-align: center">用户名</th>
                                        <th style="text-align: center">邮箱</th>
                                        <th style="text-align: center">联系方式</th>
                                        <th style="text-align: center">编辑用户</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userlist}" var="user" varStatus="xuhao">
                                    <tr>
                                        <td  style="text-align: center;vertical-align:middle">${xuhao.index+1}</td>
                                        <td  style="text-align: center;vertical-align:middle">${user.username}</td>
                                        <td style="text-align: left;vertical-align:middle">${user.email}</td>
                                        <td style="text-align: left;vertical-align:middle">${user.phone}</td>
                                        <td style="text-align: left;vertical-align:middle">
                                            <button type="button" class="btn btn-success btn-block btn-sm glyphicon glyphicon-pencil" id="edi${user.id}" onclick="edit(${user.id})">编辑</button>
                                            <button type="button" class="btn btn-warning btn-block btn-sm glyphicon glyphicon-remove" id="del${user.id}" onclick="dele(${user.id})">删除</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <ul class="pager">
                                    <c:choose>
                                        <c:when test="${page == 1}">
                                    <li class="previous disabled" style="background-color: gray"><a href="#">←NO</a></li>
                                        </c:when>
                                        <c:otherwise>
                                    <li class="previous"><a href="/user/userlist?currentPages=${page-1}">←上一页</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                    <li class="active"><a href="/user/userlist?currentPages=1">首页</a></li>
                                    <li class="active"><a href="/user/userlist?currentPages=${totalpage}">尾页</a></li>
                                    <c:choose>
                                        <c:when test="${page == totalpage}">
                                    <li class="next disabled"><a href="#">NO→</a></li>
                                        </c:when>
                                        <c:otherwise>
                                    <li class="next"><a href="/user/userlist?currentPages=${page+1}">下一页→</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End  Kitchen Sink -->
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
