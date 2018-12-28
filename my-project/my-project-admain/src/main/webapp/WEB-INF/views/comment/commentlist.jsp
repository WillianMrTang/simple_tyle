<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>T萌</title>
    <link rel="stylesheet" href="../../../static/pagination/style/common.css" />
    <link rel="stylesheet" href="../../../static/pagination/style/pagination.css"/>
    <script src="../../../static/pagination/script/lib/jquery.min.js"></script>
    <script src="../../../static/pagination/script/jquery.pagination.js"></script>

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

    <script>
        $(function () {
            $.ajax({
                url:'/comment/gettotal',
                type:'POST',
                dataType: 'JSON',
                data:{
                },
                success:function(data){
//                    alert(data+"总数量")
                    var pagesize = 20;
                    var totalpage = data%pagesize==0?data/pagesize:Math.ceil(data/pagesize);
//                    alert(totalpage+"总页数")
                    $('.M-box').pagination({
                        pageCount:totalpage,   //总页码
                        coping:true,                 //是否开启首页和末页
                        homePage:'首页',
                        endPage:'末页',
                        prevContent:'上页',
                        nextContent:'下页',
                        current:1,                    //当前页码
                        callback:function (api) {
                            var currentpage = api.getCurrent()-1;//获得当前点击页
//                            alert(currentpage+"当前页 ")
                            $.post("/comment/getTotal",{"pagesize":pagesize,"currentpage":currentpage},function (infos) {
                                var commentinfo =  $.parseJSON(infos);
                                $("#changebom").empty();
                                for (i = 0;i<commentinfo.length;i++){
                                $("#changebom").prepend(
                                    "<tr><td>"+(i+1)+"</td><td>"+commentinfo[i].username+"</td><td>"+commentinfo[i].articleid+"</td><td>"+commentinfo[i].commenttime+"</td><td style='text-align: left'>"+commentinfo[i].commention+"</td><td style='width: 3px'><button type='submit' class='btn  btn-success btn-sm glyphicon glyphicon-remove' onclick='deletion("+commentinfo[i].id+")'>删除</button></td></tr>"
                                    )
                                }
                            })
                        }
                    });
                }
            })
        })
    </script>

    <%--删除评论信息--%>
    <script type="text/javascript">
        <%--删除用户的评论，这里是通过原始js获取评论id然后进行删除--%>
       function deletion(dq){

           $.confirm({
//               icon:'fa fa-spinner fa-spin',
               icon:'fa circle-o-notch fa-spin',
               title: '',
               type:'green',
               content: '确定删除这条信息？',
               animation: 'zoom',//这里是设置模态框的出现时的动画
               closeAnimation: 'rotateYR',//这里是模态框关闭时候的动画
               autoClose: '取消|5000',//这里设置的是5秒后自动关闭，如果没进行任何操作就调用自动关闭
               theme: 'dark',
               animationBounce: 8.0,//这是设置动画出现时候的幅度
               animationSpeed: 1200,//这是设置动画出现和消失的速度
               backgroundDismissAnimation: 'random',
               buttons: {
                   确定: {//这里确认
                       text: '删除',
                       btnClass: 'btn-success',//这里可以通过改变btn后面的颜色达到改变按钮的颜色
                       action: function () {
                           location.href="/comment/delcomment?delid="+dq
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
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="maincontext">
        <table class="table table-hover table-condensed table-bordered" style="background-color: white;">
            <thead>
            <tr class="titlstyle">
                <th style="width: 5%">序号</th>
                <th style="width: 15%">评论用户</th>
                <th style="width: 10%">文章编号</th>
                <th style="width: 15%">评论时间</th>
                <th style="width: 45%">评论</th>
                <th style='width: 10%;'>删除评论</th>
            </tr>
            </thead>
            <br>
            <div class="row">
                <div class="col-md-12">
                    <div class="M-box"></div>
                </div>
            </div>
            <br>
            <tbody id="changebom">
            <c:forEach items="${commentlist}" var="comlist" varStatus="bihao">
            <tr>
                <td style='width: 30px'>${bihao.index+1}</td>
                <td>${comlist.username}</td>
                <td>${comlist.articleid}</td>
                <td>${comlist.commenttime}</td>
                <td style='text-align: left'>${comlist.commention}</td>
                <td><button type='submit' class='btn btn-success btn-sm glyphicon glyphicon-remove' onclick="deletion(${comlist.id})">删除</button></td></tr>
                <%--<input type='hidden' value='${comlist.id}' id='del${comlist.id}'>--%>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-md-1"></div>
</div>
</body>
</html>
