<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--head引入外部文件--%>
    <jsp:include page="../includes/headinclude.jsp"></jsp:include>
    <%--head引入外部文件--%>
        <script src="/static/BackStage/assets/jquery-3.3.1.min.js"></script>
    <%--表单验证--%>

        <script type="text/javascript">
            $(function () {
                var flag1=false;
                var flag2=false;
                var flag4=false;
                var flag5=false;
                $("#tijioa").click(function () {
                    if (flag1 && flag2 && flag4 && flag5){
                        $("#forms").submit()
                    }
                })
                //用户名的验证
                $("#rusername").blur(function () {
                    if ($.trim($("#rusername").val())==""){
                        $("#div1").html("<i style='background-color: lightgray;color: red;font-size: 15px;font-family: 微软雅黑'>用户名不能为空！</i><br>");
                        flag1=false;
                    }else{
                        var  uname = $("#rusername").val()
                        $.get("/user/chekname",{"username":uname},function (data){
                            if (data=="用户名可以使用!"){
                                $("#div1").html("<i style='background-color: lightgray;color: green;font-size: 15px;font-family: 微软雅黑'>√</i><br>");
                                flag1=true;

                            }else {
                                $("#div1").html("<i style='background-color: lightgray;color: red;font-size: 15px;font-family: 微软雅黑'>用户名已被使用=_=!</i><br>");
                                flag1=false;

                            }
                        })
                    }
                })
                //密码验证
                $("#rpassword").blur(function () {
                    if ($.trim($("#rpassword").val())==""){
                        $("#div2").html("<i style='background-color: lightgray;color: red;font-size: 15px;font-family: 微软雅黑'>密码不能为空！</i><br>");
                        flag2 = false;
                    }else{
                        $("#div2").html("<i style='background-color: lightgray;color: green;font-size: 15px;font-family: 微软雅黑'>√</i><br>");
                        flag2 = true;
                    }
                })
                //邮箱的验证
                $(":input[name='email']").blur(function(){
                    var email = $(this).val();
                    var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
//                    var reg = /^([\w\.\-]+)\@(\w+)(\.([\w^\_]+)){1,2}$/;
                    if(reg.test(email)){
                        $("#div5").html("<i style='background-color: lightgray;color: green;font-size: 15px;font-family: 微软雅黑'>√</i><br>");
                        flag5 = true;
                    }else{
                        $("#div5").html("<i style='background-color: lightgray;color: red;font-size: 15px;font-family: 微软雅黑'>邮箱格式不正确-_-!</i><br>");
                        flag5 = false;
                    }
                });
                //电话号码的验证
                $(":input[name='phone']").blur(function(){
                    var email = $(this).val();
                    var reg = /^1[34578]\d{9}$/;
                    if(reg.test(email)){
                        $("#div4").html("<i style='background-color: lightgray;color: green;font-size: 15px;font-family: 微软雅黑'>√</i><br>");
                        flag4 = true;
                    }else{
                        $("#div4").html("<i style='background-color: lightgray;color: red;font-size: 15px;font-family: 微软雅黑'>电话号码格式不正确-_-!</i><br>");
                        flag4 = false;
                    }
                });
            })
        </script>

    <%--表单验证--%>
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
                    <h1 class="page-head-line" style="background-color: #428BCA;color: black;text-align: center;padding-top: 6px">添加新用户</h1>
                    <h1 class="page-subhead-line"><span style="font-weight: 700;font-size: 16px">特别提示 :</span>   请确认好添加内容的真实有效性在进行添加！</h1>
                </div>
            </div>
        <%--添加用户--%>
            <div class="row">
                <br><br><br><br>
                <div class="col-md-2 col-sm-2 col-xs-1"></div>
                <div class="col-md-8 col-sm-8 col-xs-10">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <span>添加新用户</span>
                        </div>
                        <div class="panel-body">
                            <form action="user/adduser" method="post" id="forms">
                                <div class="form-group">
                                    <label id="div1">新用户名:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input type="text" class="form-control" placeholder="用戶名" id="rusername" name="username" maxlength="6">
                                    </div>
                                    <label id="div2">新密码:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input type="text" class="form-control" placeholder="密码" name="password" maxlength="8" id="rpassword">
                                    </div>
                                    <label id="div4">联系方式:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                        <input type="text" class="form-control" placeholder="手机号" name="phone" id="phone" maxlength="11">
                                    </div>
                                    <label id="div5">邮箱地址:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input type="text" class="form-control" placeholder="邮箱" name="email" id="email" maxlength="20">
                                    </div>
                                    <br />
                                </div>
                            </form>
                            <input type="submit" class="btn btn-info btn-sm btn-block" value="添加" id="tijioa"/>
                            <hr>
                        </div>
                    </div>
                </div>

                <div class="col-md-2 col-sm-2 col-xs-1"></div>
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
