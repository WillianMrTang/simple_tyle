<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--head引入外部文件--%>
    <jsp:include page="../includes/headinclude.jsp"></jsp:include>
    <%--head引入外部文件--%>
        <script src="/static/BackStage/assets/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            /*修改用户信息*/
            $("#modefy").click(function () {
                if ($.trim($(":input[name='editId']").val()) != ""){
                $("#forms2").submit();
                }else{
                $("#span2").html("<span style='color: red'>用户名不允许为空，否则无法进行修改=_=</span>")
                }
            })
            /*删除用户*/
            $("#delted").click(function () {
                if ($.trim($(":input[name='idorname']").val()) != ""){
                    $("#forms1").submit();
                }else{
                    $("#span1").html("<span style='color: red'>用户名不允许为空，否则无法进行删除=_=</span>")
                }
            })
            /*搜索用户*/
            $("#serarch").click(function () {
                if ($.trim($(":input[name='searchfild']").val()) != ""){
                    $("#forms3").submit();
                }else{
                    $("#span3").html("<span style='color: red'>这事很难办啊=_=。。。。关键字为空无法进行搜索</span>")
                }
            })

        })
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
                    <h1 class="page-head-line" style="background-color: #DFDFDF;color: black;text-align: center;padding-top: 6px">删除用户和编辑用户</h1>
                    <h1 class="page-subhead-line"><span style="font-weight: 700;font-size: 16px">特别提示 :</span>   请确认好添加内容的真实有效性在进行删除和编辑！</h1>
                </div>
            </div>
        <%--删除编辑用户--%>
            <div class="row">
                <br><br><br><br>
                <div class="col-md-1 col-sm-1 col-xs-1"></div>
                <div class="col-md-10 col-sm-10 col-xs-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <c:choose>
                            <c:when test="${not empty msg}">
                                <span style="color: red">${msg}</span>
                            </c:when>
                            <c:otherwise>
                                <span>请在输入框里输入用户名</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="panel-body">
                        <span id="span1">请在下列输入框里输入要删除的用户名:</span>
                        <hr>
                            <form  action="/user/deluser" method="post" id="forms1">
                            <div class="input-group">
                            <input type="text" name="idorname" class="form-control" maxlength="6">
                            <span class="form-group input-group-btn">
                                    <button class="btn btn-primary glyphicon glyphicon-remove" type="button" id="delted">删除用户</button>
                                </span>
                        </div>
                            </form>
                        <span id="span2">请在下列输入框里输入要修改的用户名:</span>
                        <hr>
                            <form action="/user/edituser" method="post" id="forms2">
                            <div class="input-group">
                                <input type="text" name="editId" class="form-control" maxlength="6">
                                <span class="form-group input-group-btn">
                                    <button class="btn btn-primary glyphicon glyphicon-pencil" type="button" id="modefy">信息修改</button>
                                </span>
                            </div>
                            </form>
                        <span id="span3">请输入你要搜索用户的相关字段信息:</span>
                        <hr>
                        <form action="/user/searchsuser" method="post" id="forms3">
                            <div class="input-group">
                                <input type="text" name="searchfild" class="form-control" maxlength="11">
                                <span class="form-group input-group-btn">
                                    <button class="btn btn-primary glyphicon glyphicon-search" type="button" id="serarch">搜索用户</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                <div class="col-md-1 col-sm-1 col-xs-1"></div>
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
