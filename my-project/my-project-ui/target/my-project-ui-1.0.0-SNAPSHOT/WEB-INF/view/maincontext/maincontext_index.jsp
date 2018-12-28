<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--导入mainContextHead--%>
    <%@include file="../include/maincontext_head.jsp"%>
        <!--demo文件中的-->
        <link rel="stylesheet" href="../../../static/pagination/style/pagination.css"/>
        <link rel="stylesheet" href="/static/jquery-confirm/demo/libs/bundled.css" />
        <link rel="stylesheet" href="/static/jquery-confirm/dist/jquery-confirm.min.css" />
    <%--导入mainContextHead--%>
</head>
<body class="user-select">
<header class="header">
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
            </div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                <img src="../../../static/atricleimgs/LOGO.jpg" alt="TWG" style="width: 180px; height: 56px;" id="borderR">
            </div>
            <div class="collapse navbar-collapse" id="header-navbar">
            <%--导航--%>
                <%--<jsp:include page="include/maincontext_daohang.jsp"></jsp:include>--%>
                <%@include file='../include/maincontext_daohang.jsp'%>
            <%--导航--%>
                </div>
        </div>
    </nav>
</header>
<section class="container">
    <div class="content-wrap">
        <div class="content">
            <c:choose>
                <c:when test="${not empty message}">
                    <article class="excerpt-minic excerpt-minic-index" id="tishi">
                        <h2>
                            <span class="red">【${message}】</span>
                        </h2>
                    </article>
                </c:when>
                <c:otherwise>
                    <article class="excerpt-minic excerpt-minic-index">
                        <h2>
                            <span class="red">【推荐读本】</span>
                            <a target="_blank" href="#">${articlinfo1[0].smalltitle}</a>&nbsp;
                            <time class="time"><i class="glyphicon glyphicon-bookmark">${articlinfo1[0].uoloadtime}</i></time>
                            <span class="views" style="color: pink"><i class="fa fa-thumbs-up"></i>${articlinfo1[0].fabulous}</span>
                        </h2>
                        <p class="note">${articlinfo1[0].firstartic}</p>
                    </article>
                </c:otherwise>
            </c:choose>
               <!--这里是轮播图的点点-->
            <div id="focusslide" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#focusslide" data-slide-to="0" class="active"></li>
                    <li data-target="#focusslide" data-slide-to="1" ></li>
                    <li data-target="#focusslide" data-slide-to="2" ></li>
                </ol>
                <!--这里是轮播图的点点-->
                <div class="carousel-inner" role="listbox">
                    <!--轮播图1-->
                    <div class="item active">
                        <a href="#" target="_blank" title="1" >
                            <%--<img src="../../static/MainContain/images/201610181557196870.jpg" alt="1" class="img-responsive"></a>--%>
                            <img src="../../../static/MainContain/images/Title1.jpg" alt="甜甜私语" class="img-responsive"></a>
                    </div>
                    <!--轮播图2-->
                    <div class="item">
                        <a href="#" target="_blank" title="2" >
                            <img src="../../../static/MainContain/images/Title2.jpg" alt="甜甜私语" class="img-responsive"></a>
                    </div>
                    <!--轮播图3-->
                    <div class="item">
                        <a href="#" target="_blank" title="3" >
                            <img src="../../../static/MainContain/images/Title3.jpg" alt="甜甜私语" class="img-responsive"></a>
                    </div>
                </div>
                <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>  </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>  </a> </div>
            <div class="title">
                <h3>最 新 发 布 :</h3>
                <div class="more">
                    <a href="/">首页</a>
                    <a href="/topersonal?userid=${userinfo.id}&usernaem=${userinfo.username}">个人中心</a>
                    <a href="/upload">上传作品</a>
                    <a href="/tobulding">上传头像</a>
                </div>
            </div>
            <div id="changebom">
            <c:forEach items='${articlinfo}' var='articleInfo'>
            <article class='excerpt excerpt-1'><a class='focus' target='_blank' ><img class='thumb' src='${articleInfo.artieimg}' alt='文章插图' style='display: inline;width: 220px;height: 150px'></a><header><a class='cat' >小标题 <i></i></a><h2><a href='/article/selectsinglessay?essayid=${articleInfo.id}' target='_blank' >${articleInfo.smalltitle}</a></h2></header><p class='meta'><time class='time'><i class='glyphicon glyphicon-time'>${articleInfo.uoloadtime}</i></time><span class='views' style='color: pink'><i class='glyphicon glyphicon-heart'></i>${articleInfo.fabulous}</span>
                &nbsp;&nbsp;&nbsp;<a href="/article/selectsinglessay?essayid=${articleInfo.id}"><i class="fa fa-link fa-1x"></i>查看原文</a>&nbsp;&nbsp;&nbsp;
                <a class='comment' href='/percenter/collection?aid=${articleInfo.id}&uid=${userinfo.id}' title='收藏' target='_blank' ><i class='fa fa-bookmark fa-2x'></i></a></p><p class='note'>${articleInfo.firstartic}</p></article><br />
            </c:forEach>
            </div>
        </div>
    </div>
    <aside class="sidebar">
        <div class="fixed">
            <div class="widget widget_search">
                <form class="navbar-form" action="/search/search" method="post">
                    <div class="input-group">
                     <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入文章标题关键字" maxlength="15" autocomplete="off">
                     <span class="input-group-btn">
		            <button class="btn btn-info btn-block " name="search" type="submit">搜索</button>
		            </span> </div>
                </form>
            </div>
            <div class="widget widget-tabs">
                <ul class="nav nav-tabs" role="tablist">
                    <!--第一-->
                    <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab" >创意者</a></li>
                    <!--第二-->
                    <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab" >阅读建议</a></li>
                    <!--第三-->
                    <li role="presentation" class="#third"><a href="#third" aria-controls="notice" role="tab" data-toggle="tab" >暂未开放</a></li>
                    <!--第四-->
                </ul>
                <div class="tab-content">
                    <!--第一部分-->
                    <div role="tabpanel" class="tab-pane contact active" id="notice" style="color:lightslategray">
                            创意者 : 唐微港
                                <br>
                                EnglishName : William_Tang
                                <br>
                                Email :1109599916@qq.com
                                <br>
                                Goal : Full Stack Engineer
                                <br>
                                Gender: Sure ！ a boy
                                <br>
                    </div>
                    <!--第二部分-->
                    <div role="tabpanel" class="tab-pane contact" id="contact" style="color: lightslategray">
                        在阅读相关文章的时候，请尊重作者的劳动成果和知识产权。不得发表辱骂，反动，污秽的言论，否则后果自负。未经过作者允许，不得对作者的作品进行转载。<br>
                        点赞也是一种传统美德，如果你觉得笔者的文章写得比较好，不如就赞一赞。互相欣赏也是一种尊重。
                    </div>
                    <!--第三部分-->
                    <!--第四部分-->
                    <div role="tabpanel" class="tab-pane contact" id="third">
                        <h2>
                            暂未开放任何功能显示
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="widget widget_hot">
            <h3 class="glyphicon glyphicon-fire"> &nbsp;热门文章</h3>
            ${msg}
            <ul>
                <!--右侧边栏目------------用于循环遍历-->
                <c:forEach items="${articlinfo1}" var="articInfo1">
                <li><a href="/article/selectsinglessay?essayid=${articInfo1.id}"><span class="thumbnail"><img class="thumb" src="${articInfo1.artieimg}" alt="文章展示图片" style="display: block;"></span>
                        <span class="text">${articInfo1.smalltitle}</span><span class="muted"><i class="glyphicon glyphicon-time"></i></span>
				        上传时间：<span>${articInfo1.uoloadtime}</span>
                    <span class="muted" style="color: pink   "><i class="fa fa-thumbs-up">${articInfo1.fabulous}</i></span>
                    &nbsp;&nbsp;<a href="/article/selectsinglessay?essayid=${articInfo1.id}"><i class="fa fa-link fa-1x"></i>查看原文</a>&nbsp;
                </a>
                </li>
                </c:forEach>
                <!--右侧边栏目------------用于循环遍历-->
            </ul>
        </div>
        <!--广告栏位++++++++++右侧广告栏位-->
        <div class="widget widget_sentence">
            <a href="#" target="_blank" rel="nofollow" title="twg" >
                <img style="width: 100%" src="../../../static/MainContain/images/Advertiserment1.jpg" alt="twg" ></a>
        </div>
        <div class="widget widget_sentence">
            <h3 class="glyphicon glyphicon-send">&nbsp;友情链接</h3>
            <div class="widget-sentence-link">
                <div class="article-tags  glyphicon glyphicon-tags" > Targs:
                    <a href="https://www.baidu.com/" rel="tag" draggable="false">百度</a>
                    <a href="https://www.yahoo.com/" rel="tag" draggable="false">雅虎</a>
                    <a href="https://www.sina.com.cn/" rel="tag" draggable="false">新浪</a>
                    <a href="https://mail.163.com/" rel="tag" draggable="false">邮箱163.com</a>
                    <a href="https://mail.qq.com/cgi-bin/loginpage" rel="tag" draggable="false">邮箱qq.com</a>
                </div>
            </div>
        </div>
        <div class="widget widget_sentence">
            <a href="#" target="_blank" rel="nofollow" title="twg" >
                <img style="width: 100%" src="../../../static/MainContain/images/Advertiserment3.jpg" alt="twg" ></a>
        </div>
        <div class="widget widget_sentence">
            <a href="#" target="_blank" rel="nofollow" title="twg" >
                <img style="width: 100%" src="../../../static/MainContain/images/Advertiserment2.jpg" alt="twg" ></a>
        </div>
    </aside>
</section>
<%--这是分页的初始化--%>
<div class="M-box"></div>
<%--这是分页的script--%>
<%--这是提取后的分页--%>
<script src="/static/common_js/mainContextindexJS/pagination_fy.js"></script>
<%--这是提取后的弹出框--%>
<script src="/static/common_js/mainContextindexJS/confirm_kuang.js"></script>
<script src="../../../static/pagination/script/lib/jquery.min.js"></script>
<script src="../../../static/pagination/script/jquery.pagination.js"></script>
<%--这是分页的script--%>
<script src="/static/jquery-confirm/dist/jquery-confirm.min.js"></script>
<jsp:include page="../include/maincontext_footer.jsp"></jsp:include>
</body>
</html>