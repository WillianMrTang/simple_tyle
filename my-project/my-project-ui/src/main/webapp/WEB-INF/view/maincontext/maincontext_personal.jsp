<%@ page contentType='text/html;charset=UTF-8' language='java' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset='utf-8'>
    <title>简约风</title>
    <link rel="stylesheet" href="/static/jquery-confirm/demo/libs/bundled.css" />
    <link rel="stylesheet" href="/static/jquery-confirm/dist/jquery-confirm.min.css" />
    <link rel='stylesheet' type='text/css' href='../../../static/MainContain/css/bootstrap.min.css'>
    <link rel='stylesheet' type='text/css' href='../../../static/MainContain/css/nprogress.css'>
    <link rel='stylesheet' type='text/css' href='../../../static/MainContain/css/style.css'>
    <link rel='stylesheet' type='text/css' href='../../../static/MainContain/css/font-awesome.min.css'>
    <%--弹出框--%>
    <link rel="stylesheet" href="/static/jquery-confirm/demo/libs/bundled.css" />
    <link rel="stylesheet" href="/static/jquery-confirm/dist/jquery-confirm.min.css" />
<%--弹出框--%>
    <script src='../../../static/MainContain/js/jquery-2.1.4.min.js'></script>
    <script src='../../../static/MainContain/js/nprogress.js'></script>
    <script src='../../../static/MainContain/js/jquery.lazyload.min.js'></script>
    <!--[if gte IE 9]>
    <script src='../../static/MainContain/js/jquery-1.11.1.min.js' type='text/javascript'></script>
    <script src='../../static/MainContain/js/html5shiv.min.js' type='text/javascript'></script>
    <script src='../../static/MainContain/js/selectivizr-min.js' type='text/javascript'></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
    <style>
        #leftidear{
            width: 350px;
            height: 460px;
            background-image: linear-gradient(225deg, #FF3CAC 0%, #784BA0 50%, #2B86C5 100%);
        }
        #touxiang{
            padding-top: 14px;
            margin-left: 90px;
        }
        #imgt{
            border-radius: 100px;
            width: 150px;
            height: 150px;
        }
        #uli{
        }
        #uli li{
            background-image: linear-gradient(225deg, #FF3CAC 0%, #784BA0 50%, #2B86C5 100%);
            width: 350px;
            height: 45px;
            float: left;
            margin-left: 2px;
            margin-top: 16px;
            box-shadow: 5px 7px 4px #888888;
            text-align: center;
            font-family: 微软雅黑;
            font-weight: 500;
            font-size: 18px;
            padding-top: 5px;
            color: #A9A9A8;
        }
        #uli li:hover{
            background-image: linear-gradient(225deg, #2B86C5 0%, #784BA0 50%, #FF3CAC 100%);
            color: white;
            font-weight: 600;
            font-size: 19px;
        }
        #yh{
            border-radius: 0px 60px 0px 60px;
            /*background-image: linear-gradient(225deg, #2B86C5 0%, #784BA0 50%, #FF3CAC 100%);*/
            border-color:#2B86C5;
            color: white;
        }
        #yh:hover{
            border-radius: 0px;
            border-color:#FF3CAC;
            color: white;
        }
        h2{
            text-align: center;
            color: #2B86C5;
            font-family: 楷体;
        }
        h3{
            color: forestgreen;
        }
        .style_title{
            text-align: center;
        }
        #honour{
            font-family: 楷体;
            font-size: 20px;
            color: #F43DAB;
        }
        a{
            text-decoration: none;
        }
    </style>
    <%--注销弹出框提取--%>
    <script src="/static/common_js/mainContextPersonalJS/confirm.js"></script>
    <%--隐藏特效--%>
    <script src="/static/common_js/mainContextPersonalJS/hidde.js"></script>
</head>
<body class='user-select single'>
<header class='header'>
    <nav class='navbar navbar-default' id='navbar'>
        <div class='container'>
            <div class='header-topbar hidden-xs link-border'>
            </div>
            <div class='navbar-header'>
                <button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#header-navbar' aria-expanded='false'> <span class='sr-only'></span> <span class='icon-bar'></span> <span class='icon-bar'></span> <span class='icon-bar'></span> </button>
                <img src='../../../static/atricleimgs/LOGO.jpg' alt='TWG' style='width: 180px; height: 56px;' id='borderR'>
            </div>
            <div class='collapse navbar-collapse' id='header-navbar'>
                <form class='navbar-form visible-xs' action='/search' method='post'>
                    <div class='input-group'>
                        <input type='text' name='keyword' class='form-control' placeholder='请输入关键字' maxlength='20' autocomplete='off'>
                        <span class='input-group-btn'>
		<button class='btn btn-default btn-search' name='search' type='submit'>搜索</button>
		</span> </div>
                </form>
                <%@include file='../include/maincontext_daohang.jsp'%>
            </div>
        </div>
    </nav>
</header>
<section class='container'>
    <div class='content-wrap'>
        <div class='content'>
            <c:if test="${not empty message}">
                <h3>${message}重新加载个人中心<a href="/percenter/topersonal?userid=${userinfo.id}" class="fa fa-refresh fa-spin"></a></h3>
            </c:if>
            <header class='article-header'>
                <%--<div class='article-meta'>--%>
                <h2 id="a">已发表</h2><i class="fa fa-toggle-on fa-3x" id="moving1" style="color: deepskyblue"></i>
                <%--</div>--%>
            </header>
            <div id="fabiao">
            <c:forEach items="${articleslist}" var="articles" varStatus="xuh">
                <p style="font-size: 18px;color: hotpink">作品${xuh.index+1}发表于:${articles.uoloadtime}</p>
                <article class="excerpt excerpt-1" id="yh">
                <a class="focus" target="_blank" draggable="false"><img class="thumb" src="${articles.artieimg}" alt="文章插图" style="display: inline;width: 220px;height: 150px" draggable="false"></a>
                <header><a class="cat" draggable="false">小标题 <i></i></a><h2><a href="/selectsinglessay?essayid=${articles.id}" target="_blank" draggable="false">${articles.smalltitle}</a></h2></header>
                <p class="meta"><span class="views" style="color: hotpink"><i class="fa fa-heartbeat fa-3x"></i>${articles.fabulous}</span>
                    &nbsp;&nbsp;&nbsp;<a href="/article/selectsinglessay?essayid=${articles.id}"><i class="fa fa-link fa-3x"></i>查看原文</a>
                </p>
                <p class="note">${articles.firstartic}</p>
                </article>
            </c:forEach>
            <br>
            <hr>
            </div>
            <div class="style_title"><h2 id="b">已收藏</h2><i class="fa fa-toggle-on fa-3x" style="color: deepskyblue" id="moving2"></i></div>
            <div id="shoucang">
            <br>
            <c:forEach items="${collections}" var="collection" varStatus="xuh">
                <article class="excerpt excerpt-1"><a class="focus" target="_blank" draggable="false"><img class="thumb" src="${collection.artieimg}" alt="文章插图" style="display: inline;width: 220px;height: 150px" draggable="false"></a>
                    <header><a class="cat" draggable="false">小标题 <i></i></a><h2><a href="/selectsinglessay?essayid=${collection.articleid}" target="_blank" draggable="false">${collection.smalltitle}</a></h2></header>
                    <p class="meta"><time class="time"><i class="glyphicon glyphicon-time">${collection.uoloadtime}</i></time><span class="views" style="color: pink"><i class="fa fa-heart fa-2x"></i>${collection.fabulous}</span>已收藏
                        &nbsp;&nbsp;<a href="/percenter/remvoe?essayid=${collection.articleid}&userid=${userinfo.id}"><i class="fa fa-trash fa-2x"></i>移出收藏夹</a>
                        &nbsp;&nbsp;<a href="/article/selectsinglessay?essayid=${collection.articleid}"><i class="fa fa-link fa-2x"></i>查看原文</a>
                    </p>
                    <p class="note">${collection.firstartic}</p></article>
            </c:forEach>
            </div>
            <hr>
                <div class="style_title"><h2 id="c">荣誉墙</h2><i class="fa fa-toggle-off fa-3x" id="moving3"></i>
                </div>
            <br>
            <div id="honour" style="display: none">
            <p><button class="btn btn-primary btn-info btn-block btn-sm">获赞详情</button></p>
                <c:forEach items="${articleslist}" var="article" varStatus="count">
                    <%--${count.index+1}--%>
                    <%--<i class="fa fa-bookmark-o"></i>${article.smalltitle}&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-heart"></i>&nbsp;${article.fabulous}<br>--%>
                    <div class="row">
                    <div class="col-md-2">${count.index+1}</div>
                    <div class="col-md-4"><i class="fa fa-bookmark-o"></i>${article.smalltitle}</div>
                    <div class="col-md-4"><i class="fa fa-calendar-check-o"></i>${article.uoloadtime}</div>
                    <div class="col-md-2"><i class="fa fa-heart"></i>&nbsp;${article.fabulous}</div>
                    </div>
                </c:forEach>
                发表总量:${fn:length(articleslist)}
            </div>
        </div>
    </div>
    <aside class='sidebar'>
        <div class='fixed'>

            <div class='widget widget_search' id="leftidear">
                <%--个人中心导航--%>
                <div id="touxiang">
                    <img src="/static/atricleimgs/author.jpg" id="imgt">
                </div>
                <hr>
                    &nbsp;<i class="fa fa-user fa-3x" style="color: white;padding-left: 40px">:&nbsp;${userinfo.username}</i><hr>
                    &nbsp;<i class="fa fa-phone fa-2x" style="color: white;padding-left: 40px">:&nbsp;${userinfo.phone}</i><hr>
                    &nbsp;<i class="fa fa-envelope fa-1x" style="color: white;padding-left:40px">:&nbsp;${userinfo.email}</i><hr>&nbsp;&nbsp;
                    <i class="fa fa-battery-0 fa-2x" style="color: red">&nbsp;&nbsp;</i>
                    <i class="fa fa-battery-1 fa-2x" style="color: orangered">&nbsp;&nbsp;</i>
                    <i class="fa fa-battery-2 fa-2x" style="color: palegreen">&nbsp;&nbsp;</i>
                    <i class="fa fa-battery-3 fa-2x" style="color: greenyellow">&nbsp;&nbsp;</i>
                    <i class="fa fa-battery-4 fa-2x" style="color:#32CD32">&nbsp;&nbsp;</i>
                    <i class="fa fa-gear fa-2x fa-spin" style="color: white"></i>
            </div>
            <ul role='tablist' id="uli">
                <a href="#a"><li>已发表</li></a>
                <a href="#b"><li>收藏</li></a>
                <a href="#c"><li>荣誉墙</li></a>
            </ul>
            </div>
    </aside>
</section>
<script src="/static/jquery-confirm/dist/jquery-confirm.min.js"></script>
<jsp:include page='../include/maincontext_footer.jsp'></jsp:include>
</body>
</html>
