<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>T萌</title>
    <script src="/static/jquery-3.3.1.min.js"></script>
    <!--demo文件中的-->
    <link rel="stylesheet" href="/static/jquery-confirm/demo/libs/bundled.css" />
    <!--demo文件中的-->
    <!--dist文件夹中的-->
    <link rel="stylesheet" href="/static/jquery-confirm/dist/jquery-confirm.min.css" />
    <script src="/static/jquery-confirm/dist/jquery-confirm.min.js"></script>
    <!--dist文件夹中的-->

    <!--bootstrape外部依赖-->
    <link rel="stylesheet" href="../../../static/bootstrap-3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript" src="../../../static/bootstrap-3.3.7/js/bootstrap.js" ></script>
    <style type="text/css">
        body{
            padding: 0px;
            margin: 0px;
            background-color: #E4E4E2;
        }
        #headle{
            background-color: #202020;
            height: 72px;
            width: 20%;
            color: white;
            text-align: center;
            font-weight: 600;
            font-size: 22px;
            line-height: 60px;
        }
        #headri{
            background: black;
            height:72px;
            width: 80%;
            text-align: right;
            line-height: 30px;
            color: white;
        }
        #pad1{
            height: 15px;
        }
        .col-md-1{
            background-color: black;
            width: 2%;
            height: auto;
            margin-top:35px ;
        }
        #maincontext{
            height: 500px;
            width: 96%;
            margin-top:35px ;

        }
        .titlstyle{
            background-color: lightgray;
            font-family: "微软雅黑";
            font-weight: 500;
            font-size: 16px;
        }
        th{
            text-align: center;
        }
        tr{
            font-family: "微软雅黑";
            font-size: 14px;
            font-weight: 400;
            text-align: center;
        }
    </style>
    <%--自定义动画相关样式--%>
    <style type="text/css">
        .jconfirm .jconfirm-box.hilight.jconfirm-hilight-random {
            /*the animation name is bob*/
            transform: translate3d(0,0,0);
            animation: random 2s;
        }
        @keyframes random{
            10%, 90% {
                transform: rotate(-2deg);
            }
            20%, 80% {
                transform: rotate(4deg);
            }
            30%, 50%, 70% {
                transform: rotate(-8deg);
            }
            40%, 60% {
                transform: rotate(8deg);
            }
        }
    </style>

    <script type="text/javascript">
       function delet(dq){
           $.confirm({
               icon:'glyphicon glyphicon-map-marker',
               title: '',
               type:'green',
               content: '你是认真的吗,确定删除这条信息？',
               animation: 'rotateRX',//这里是设置模态框的出现时的动画
               closeAnimation: 'rotateYR',//这里是模态框关闭时候的动画
               autoClose: '取消|5000',//这里设置的是5秒后自动关闭，如果没进行任何操作就调用自动关闭
               theme: 'dark',
               animationBounce: 3.0,//这是设置动画出现时候的幅度
               animationSpeed: 1200,//这是设置动画出现和消失的速度
               backgroundDismissAnimation: 'random',
               buttons: {
                   确定: {//这里确认
                       text: '删除',
                       btnClass: 'btn-success',//这里可以通过改变btn后面的颜色达到改变按钮的颜色
                       action: function () {
                           location.href="/articles/delbyid?did="+dq
                       }
                   },
                   取消: function () {
                       $.alert('已经自动取消删除！');
                   }
               }
           });
       }
    </script>
</head>
<body>
</div>
<div class="row">
    <div class="col-md-2" id="headle">
        全栈工程师
    </div>
    <div class="col-md-10"id="headri">
        <div class="row" id="pad1"></div>
        ~@_@已登录！<a href="#" class="btn btn-info btn-lg" title="已登录"><i class="glyphicon glyphicon-star"></i></a>
        <a href="/index" class="btn btn-info btn-lg " title="返回首页"><b></b><i class="glyphicon glyphicon-home"></i></a>
        <a href="/articles/toarticlelist" class="btn btn-info btn-lg" title="文章列表页"><b></b><i class="glyphicon glyphicon-book"></i></a>
        <a href="#" class="btn btn-info btn-lg"><i class="glyphicon glyphicon-comment"></i></a>
        <a href="/logout" class="btn btn-info btn-lg"><i class="glyphicon glyphicon-log-out"></i></a>
    </div>
</div>
<!--<div class="row">
    <div class="col-md-12" id="">
    </div>
</div>-->
<%--<c:if test="${not empty msg}">--%>
    <%----%>
<%--</c:if>--%>

<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="maincontext">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">《${article.smalltitle}》&nbsp;&nbsp;&nbsp;
                    |点赞数&nbsp;&nbsp;<i class="glyphicon glyphicon-thumbs-up">${article.fabulous}</i>&nbsp;&nbsp;|&nbsp;&nbsp;上传时间&nbsp;&nbsp;<i class="glyphicon glyphicon-time">${article.uoloadtime}</i>|
                    &nbsp;&nbsp;&nbsp;&nbsp;<a title="删除文章" onclick="delet(${article.id})"><i class="glyphicon glyphicon-trash" style="font-weight: 800;font-size: 23px;color: orangered"></i></a></h3>
            </div>
            <div class="panel-body">
                <textarea style="width: 100%;height: 100%;resize:none ">${article.textarea}</textarea>
            </div>
        </div>

    </div>
    <div class="col-md-1"></div>
</div>
</body>
</html>
