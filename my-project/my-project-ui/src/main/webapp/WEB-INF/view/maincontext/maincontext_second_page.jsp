<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType='text/html;charset=UTF-8' language='java' %>
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
    <script src='../../../static/MainContain/js/jquery-2.1.4.min.js'></script>
    <script src='../../../static/MainContain/js/nprogress.js'></script>
    <script src='../../../static/MainContain/js/jquery.lazyload.min.js'></script>
    <!--[if gte IE 9]>
    <script src='../../../static/MainContain/js/jquery-1.11.1.min.js' type='text/javascript'></script>
    <script src='../../../static/MainContain/js/html5shiv.min.js' type='text/javascript'></script>
    <script src='../../../static/MainContain/js/respond.min.js' type='text/javascript'></script>
    <script src='../../../static/MainContain/js/selectivizr-min.js' type='text/javascript'></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
    <style>
    #text1{
        width: 100%;
        height: 100%;
        resize: none;
        overflow-x:hidden ;
        border-bottom: 1px solid black;
        border: none;
        border-radius: 10px 0px 0px 0px;
    }
    #text1::-webkit-scrollbar {
        width: 8px;
    }
    #text1::-webkit-scrollbar-track {
        background-color:white;
        -webkit-border-radius: 2em;
        -moz-border-radius: 2em;
    }
    #text1::-webkit-scrollbar-thumb {
        background-color:#5BC0DE;
        -webkit-border-radius: 2em;
        -moz-border-radius: 2em;
        border-radius:2em;
    }
</style>
    <style type='text/css'>
        #borderR{
            border-radius: 5px;
        }
        #rep2:hover{
            font-size: 26px;
            color: #00bcd4;
        }
    </style>
    <%--异步评论提交--%>
    <script type='text/javascript'>
        $(function () {
            $('#tijioa').click(function () {
                if ($.trim($('#comment-textarea').val())){
                 var articleid = ${essay.id}
                 var username = $('#username').val();
                 var commention = $('#comment-textarea').val();
                 var url = '/article/commontmsg'
                 //提交评论
                    $.post(url,{'articleid':articleid,'username':username,'commention':commention},function (data) {
                       var jsonObj = $.parseJSON(data);
                            $("#tijioa").replaceWith(
                                "<button type='button' class='btn btn-success btn-block glyphicon glyphicon-ok-circle'>已发表</button>"
                            )

                        //查询总的评论数量
                        $.get("/other/selectbyarticleid",{'articleid':articleid},function (count) {
                            $("#commentchange").replaceWith(
                                "<span style='color: #00bcd4;font-size: 16px' class='item article-meta-comment' data-toggle='tooltip' data-original-title='评论数'><i class='glyphicon glyphicon-comment'></i>"+count+"</span> </div>"
                            )
                        })
                        $('#comment_list').prepend(
                           "<li class='comment-content'><span class='comment-f'>评论时间:<span>"+jsonObj.commenttime+"</span>"+
                           "</span><div class='comment-main' id='commentbox'>"+
                               "<p class='glyphicon glyphicon-send'><a class='address' rel='nofollow' target='_blank'><span style='color: darkred;font-family: 微软雅黑;font-size: 18px'>&nbsp;&nbsp;"+jsonObj.username+"</span><span>的评论:</span></a>"+
                           "<br><br><span>"+jsonObj.commention+"</span></p></div></li> "
                           )
                           //评论完成后就将值文本框中的值变为空
                        $('#comment-textarea').val("");
                    });
                }else {
                   alert('评论不能为空')
                }
            })

        })
    </script>
    <%--点赞功能的实现--%>
    <script type="text/javascript">

$(function () {
            $("#dianzan").click(function () {
                    var url ="/other/dianzan";
                    var articleid = ${essay.id};
                    var fabulous = ${essay.fabulous};
                        $.get(url,{'articleid':articleid,'fabulous':fabulous},function (data) {
                            //查询到了之后再进行数据的覆盖
                            $("#heartchange").replaceWith(
                                "<span class='item article-meta-views' style='color: hotpink;font-size: 16px' title='' data-original-title='获赞数:"+data+"'><i class='glyphicon glyphicon-heart'></i>"+data+"</span>"
                            )
                        })
                    $("#rep").replaceWith("<i style='color: hotpink;font-size: 32px;font-weight: 600' class='glyphicon glyphicon-heart'></i>已赞")
            })
        })
    </script>
    <%--提取过后的弹窗功能--%>
    <script src="/static/common_js/mainContextSecondpageJS/confirm.js"></script>
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
                <form class='navbar-form visible-xs' action='/search/search' method='post'>
                    <div class='input-group'>
                        <input type='text' name='keyword' class='form-control' placeholder='请输入关键字' maxlength='20' autocomplete='off'>
                        <span class='input-group-btn'>
		<button class='btn btn-default btn-search' name='search' type='submit'>搜索</button>
		</span> </div>
                </form>
                <%--<jsp:include page='include/maincontext_head.jsp'></jsp:include>--%>
                <%@include file='../include/maincontext_daohang.jsp'%>
            </div>
        </div>
    </nav>
</header>
<section class='container'>
    <div class='content-wrap'>
        <div class='content'>
            <header class='article-header'>
                <h1 class='article-title'>${essay.smalltitle}</h1>
                <div class='article-meta'>
		<span class='item article-meta-time'>
	  <time class='time' data-toggle='tooltip' data-placement='bottom' title='' data-original-title='发表时间:${essay.uoloadtime}'><i class='glyphicon glyphicon-time'></i>${essay.uoloadtime}</time>
	  </span>
                    <span id="heartchange">
                    <span class='item article-meta-views' data-toggle='tooltip' data-placement='bottom' title='' data-original-title='获赞数:${essay.fabulous}'><i class='glyphicon glyphicon-heart'></i>${essay.fabulous}</span>
                    </span>
                    <span id="commentchange">
                    <span class='item article-meta-comment' data-toggle='tooltip' data-original-title='评论数'><i class='glyphicon glyphicon-comment'></i>评论后才能查看总数</span>
                    </span>
                </div>
            </header>
            <article class='article-content'>
                <p><img src='../../static/MainContain/images/Title1.jpg' alt='文章插图'/></p>
                <hr />
                <br>
                <%--这是原来的文章展示页面--%>
                <%--<pre class='prettyprint lang-cs' id="layouts">--%>
		            <%--${essay.textarea}--%>
	            <%--</pre>--%>
                <%--通过替换的方式来防止再次点击--%>
                <%--<input type="text" value="${essay.textarea}" style="width: 100%;height: 100%">--%>
                <textarea id="text1" readonly>${essay.textarea}</textarea>
                <div id="rep">
                <span id="dianzan" style="font-weight: 600">
                 <span id="repl"><i id="rep2" class='fa fa-thumbs-up'></i>.......赞</span>
                </span>
                <div>
                    <br><br>
                <div class='bdsharebuttonbox'>
                    <a href='#' class='bds_more' data-cmd='more'></a>
                    <a href='#' class='bds_qzone' data-cmd='qzone' title='分享到QQ空间'></a>
                    <a href='#' class='bds_tsina' data-cmd='tsina' title='分享到新浪微博'></a>
                    <a href='#' class='bds_tqq' data-cmd='tqq' title='分享到腾讯微博'></a>
                    <a href='#' class='bds_weixin' data-cmd='weixin' title='分享到微信'></a>
                    <a href='#' class='bds_tieba' data-cmd='tieba' title='分享到百度贴吧'></a>
                    <a href='#' class='bds_sqq' data-cmd='sqq' title='分享到QQ好友'></a>
                </div>
                <script>window._bd_share_config = { 'common': { 'bdSnsKey': {}, 'bdText': '', 'bdMini': '2', 'bdMiniList': false, 'bdPic': '', 'bdStyle': '1', 'bdSize': '32' }, 'share': {} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=0.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
            </article>
            <div class='article-tags'>
                Targs:<a href='https://www.baidu.com/' rel='tag' draggable='false'>百度</a>
                <a href='https://www.yahoo.com/' rel='tag' draggable='false'>雅虎</a>
                <a href='https://www.sina.com.cn/' rel='tag' draggable='false'>新浪</a>
            </div>
            <div class='title' id='comment'>
                <h3>评论</h3>
            </div>
            <%--评论实现框--%>
            <div id='respond'>
                <%--<form id='comment-form' name='comment-form' action='' method='POST'>--%>
                    <div class='comment'>
                        <div class='comment-box'>
                            <textarea name='comments' id='comment-textarea' cols='100%' rows='3' maxlength='150'></textarea>
                            <input type='hidden' value='${userinfo.username}' id='username'>
                            <%--<input placeholder='请在评论框里填写你想评论的内容' name='comments' id='comment-textarea' cols='100%' rows='3' maxlength='1000'></input>--%>
                            <div class='comment-ctrl'>
                                <button type='submit' id='tijioa' class='btn btn-info glyphicon glyphicon-send'>发表</button>
                            </div>
                        </div>
                    </div>
                    <br>
                <%--</form>--%>
            </div>
            <hr>
            <!--评论显示区域-->
            <div id='postcomments'>
                <ol id='comment_list' class='commentlist'>
                    <c:forEach items="${commentslist}" var="commentobj">
                        <li class='comment-content'><span class='comment-f'>
                            评论时间:<span>${commentobj.commenttime}</span></span>
                            <div class='comment-main' id='commentbox'><p class='glyphicon glyphicon-send'><a class='address' rel='nofollow' target='_blank'><span style='color: darkred;font-family: 微软雅黑;font-size: 18px'>"&nbsp;&nbsp;${commentobj.username}</span><span>的评论:</span></a>
                        <br><br><span style="color: black">${commentobj.commention}</span></p></div></li>
                    </c:forEach>
                </ol>
            </div>
            <!--评论显示区域-->
        </div>
    </div>

    <aside class='sidebar'>
        <div class='fixed'>

            <div class='widget widget_search'>
                <form class='navbar-form' action='/search/search' method='post'>
                    <div class='input-group'>
                        <input type='text' name='keyword' class='form-control' size='35' placeholder='请输入关键字' maxlength='15' autocomplete='off'>
                        <span class='input-group-btn'>
		<button class='btn btn-info btn-block ' name='search' type='submit'>搜索</button>
		</span> </div>
                </form>
            </div>
            <div class='widget widget-tabs'>
                <ul class='nav nav-tabs' role='tablist'>
                    <!--第一-->
                    <li role='presentation' class='active'><a href='#notice' aria-controls='notice' role='tab' data-toggle='tab' >创意者</a></li>
                    <!--第二-->
                    <li role='presentation'><a href='#contact' aria-controls='contact' role='tab' data-toggle='tab' >阅读建议</a></li>
                    <!--第三-->
                    <li role='presentation' class='#third'><a href='#third' aria-controls='notice' role='tab' data-toggle='tab' >暂未开放</a></li>
                    <!--第四-->
                </ul>
                <div class='tab-content'>
                    <!--第一部分-->
                    <div role='tabpanel' class='tab-pane contact active' id='notice' style='color:lightslategray'>
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
                    <div role='tabpanel' class='tab-pane contact' id='contact' style='color: lightslategray'>
                        在阅读相关文章的时候，请尊重作者的劳动成果和知识产权。不得发表辱骂，反动，污秽的言论，否则后果自负。未经过作者允许，不得对作者的作品进行转载。<br>
                        点赞也是一种传统美德，如果你觉得笔者的文章写得比较好，不如就赞一赞。互相欣赏也是一种尊重。
                    </div>
                    <!--第三部分-->
                    <!--第四部分-->
                    <div role='tabpanel' class='tab-pane contact' id='third'>
                        <h2>
                            暂未开放任何功能显示
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <!--广告栏位++++++++++右侧广告栏位-->
        <div class='widget widget_sentence'>
            <a href='#' target='_blank' rel='nofollow' title='twg' >
                <img style='width: 100%' src='../../../static/MainContain/images/Advertiserment1.jpg' alt='twg' ></a>
        </div>
        <div class='widget widget_sentence'>
            <h3 class='glyphicon glyphicon-send'>&nbsp;友情链接</h3>
            <div class='widget-sentence-link'>
                <div class='article-tags  glyphicon glyphicon-tags' > Targs:
                    <a href='https://www.baidu.com/' rel='tag' draggable='false'>百度</a>
                    <a href='https://www.yahoo.com/' rel='tag' draggable='false'>雅虎</a>
                    <a href='https://www.sina.com.cn/' rel='tag' draggable='false'>新浪</a>
                    <a href='https://mail.163.com/' rel='tag' draggable='false'>邮箱163.com</a>
                    <a href='https://mail.qq.com/cgi-bin/loginpage' rel='tag' draggable='false'>邮箱qq.com</a>
                </div>
            </div>
        </div>
        <div class='widget widget_sentence'>
            <a href='#' target='_blank' rel='nofollow' title='twg' >
                <img style='width: 100%' src='../../../static/MainContain/images/Advertiserment3.jpg' alt='twg' ></a>
        </div>
        <div class='widget widget_sentence'>
            <a href='#' target='_blank' rel='nofollow' title='twg' >
                <img style='width: 100%' src='../../../static/MainContain/images/Advertiserment2.jpg' alt='twg' ></a>
        </div>
    </aside>
</section>
<script src="/static/jquery-confirm/dist/jquery-confirm.min.js"></script>
<jsp:include page='../include/maincontext_footer.jsp'></jsp:include>
</body>
</html>