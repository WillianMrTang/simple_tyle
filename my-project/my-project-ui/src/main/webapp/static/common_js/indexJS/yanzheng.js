//这里是注册验证
$(function () {
    var flag1=false;
    var flag2=false;
    var flag3=false;
    var flag4=false;
    var flag5=false;
    var flag6=false;
    $("#tijioa").click(function () {
        if (flag1 && flag2 && flag3 && flag4 && flag5 && flag6){
            $("#forms").submit()
        }
    })
    //用户名的验证
    $("#rusername").blur(function () {
        if ($.trim($("#rusername").val())==""){
            $("#div1").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>用户名不能为空！</i>");
            flag1=false;
        }else{
            var  uname = $("#rusername").val()
            $.get("/logregist/chekname",{"username":uname},function (data){
                if (data=="用户名可以使用!"){
                    $("#div1").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
                    flag1=true;

                }else {
                    $("#div1").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>用户名已被使用=_=!</i>");
                    flag1=false;
                }
            })
        }
    })
    //密码验证
    $("#rpassword").blur(function () {
        if ($.trim($("#rpassword").val())==""){
            $("#div2").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>密码不能为空！</i>");
            flag2 = false;
        }else{
            $("#div2").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
            flag2 = true;
        }
    })
    //确认密码验证，验证两次密码的一直性
    $("#apassword").blur(function () {
        if ($.trim($("#apassword").val())!="" && $.trim($("#apassword").val())==$.trim($("#rpassword").val())){
            $("#div3").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>")
            flag3 = true;
        }else{
            $("#div3").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>两次输入不一致！</i>");
            flag3 = false;
        }
    })
    //邮箱的验证
    $(":input[name='email']").blur(function(){
        var email = $(this).val();
        var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(reg.test(email)){
            $("#div5").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
            flag5 = true;
        }else{
            $("#div5").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>邮箱格式不正确-_-!</i>");
            flag5 = false;
        }
    });
    //电话号码的验证
    $(":input[name='phone']").blur(function(){
        var email = $(this).val();
        var reg = /^1[34578]\d{9}$/;
        if(reg.test(email)){
            $("#div4").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
            flag4 = true;
        }else{
            $("#div4").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>电话号码格式不正确-_-!</i>");
            flag4 = false;
        }
    });
    $("#checking").click(function () {
        if($("#checking").attr("checked",true)){
            flag6=true;
        }else{
            flag6=false;
        }
    })
})
//这里是登录验证
    $(function () {
        var lflag1=false;
        var lflag2=false;

        //用户名的验证
        $("#Lusername").blur(function () {
            if ($.trim($("#Lusername").val())==""){
                $("#Ldiv1").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>用户名不能为空！</i>");
                lflag1=false;

            }else{
                $("#Ldiv1").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
                lflag1=true;
            }
        })
        //密码验证
        $("#Lpassword").blur(function () {
            if ($.trim($("#Lpassword").val())==""){
                $("#Ldiv2").html("<i style='background-color: lightgray;color: red;font-size: 18px;font-family: 微软雅黑'>密码不能为空！</i>");
                lflag2 = false;

            }else{
                $("#Ldiv2").html("<i style='background-color: lightgray;color: green;font-size: 18px;font-family: 微软雅黑'>√正确</i>");
                lflag2 = true;

            }
        })
        $("#denglu").click(function () {
            if(lflag1 && lflag2){
                $("#forms0").submit();
            }
        })
    })