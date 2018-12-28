<%@ page contentType='text/html;charset=UTF-8' language='java' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset='utf-8'>
    <title>简约风</title>
    <link rel='stylesheet' type='text/css' href='../../static/MainContain/css/bootstrap.min.css'>
    <link rel='stylesheet' type='text/css' href='../../static/MainContain/css/nprogress.css'>
    <link rel='stylesheet' type='text/css' href='../../static/MainContain/css/style.css'>
    <link rel='stylesheet' type='text/css' href='../../static/MainContain/css/font-awesome.min.css'>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="../../static/dropzone/dropzone.min.css" rel="stylesheet">
    <link href="../../static/dropzone/basic.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src='../../static/MainContain/js/nprogress.js'></script>
    <script src='../../static/MainContain/js/jquery.lazyload.min.js'></script>
    <!--[if gte IE 9]>
    <script src='../../static/MainContain/js/jquery-1.11.1.min.js' type='text/javascript'></script>
    <script src='../../static/MainContain/js/html5shiv.min.js' type='text/javascript'></script>
    <script src='../../static/MainContain/js/respond.min.js' type='text/javascript'></script>
    <script src='../../static/MainContain/js/selectivizr-min.js' type='text/javascript'></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
    <style type="text/css">
        body{
            background-color: white;
        }
        /*设置文本区域不可以移动*/
        textarea{
            resize: none;
        }
        /*设置滚动条的样式*/
        textarea::-webkit-scrollbar {
            width: 12px;
        }
        textarea::-webkit-scrollbar-track {
            background-color:white;
            -webkit-border-radius: 2em;
            -moz-border-radius: 2em;
        }
        textarea::-webkit-scrollbar-thumb {
            background-color:#5BC0DE;
            -webkit-border-radius: 2em;
            -moz-border-radius: 2em;
            border-radius:2em;
        }
        #image{
            width: 100%;
        }
        .panel-body{
            background-color: #F8F8FF	;
        }
        .panel-heading{
            text-align: center;
            height: 60px;
            padding-top: 20px;
        }
        #my-dropzone{
            background-color: #F8F8FF;
            border-radius: 5px;
            border: 1px dotted deepskyblue;
            text-align: center;
            color: black;
        }
        .begin{
            color: black;
            text-align: center;
            margin-top: 200px;
            border: 2px dashed deepskyblue;
            border-radius: 100px;
            color: deepskyblue;
            /*padding-top: 200px;*/
        }
    </style>
<script src="/static/jquery-3.3.1.min.js"></script>
    <script>
        $(function () {
            $(".begin").click(function () {
                $(this).hide()
                $("#create").show()
                $("#contexts").slideDown(1500);
            })
        })
    </script>
</head>
<body class='user-select single'>
<header class='header'>
    <nav class='navbar navbar-default' id='navbar'>
        <div class='container'>
            <div class='header-topbar hidden-xs link-border'>
            </div>
            <div class='navbar-header'>
                <button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#header-navbar' aria-expanded='false'> <span class='sr-only'></span> <span class='icon-bar'></span> <span class='icon-bar'></span> <span class='icon-bar'></span> </button>
                <img src='../../static/atricleimgs/LOGO.jpg' alt='TWG' style='width: 180px; height: 56px;' id='borderR'>
            </div>
            <div class='collapse navbar-collapse' id='header-navbar'>
                <%@include file='include/maincontext_daohang.jsp'%>
            </div>
        </div>
    </nav>
</header>
<section class='container'>
    <div class='content-wrap'>
       <div class="row">
           <%--<h5 id="create">点我</h5>--%>
           <div class="col-md-12" id="col-md-12">
               <%--<c:if test="${fn:contains("str2")}">--%>
                   <c:choose>
                       <c:when test="${not empty msg}">
                          <div class="begin">
                              <i class="fa fa-smile-o fa-5x"></i><br>
                                  <h4>${msg}</h4>
                          </div>
                       </c:when>
                       <c:otherwise>
                           <div class="begin">
                               <i class="fa fa-book fa-5x"></i><br>
                               <h4>点击我开始创作</h4>
                           </div>
                       </c:otherwise>
                   </c:choose>
                   <button class="fa fa-cog fa-1x fa-spin btn btn-primary btn-sm btn-block" id="create" style="background: #D9EDF7;border: none;display: none"></button>
                   <div class="panel panel-info" id="contexts" style="display: none">
                   <div class="panel-heading">
                       <h3 class="panel-title">生活不止眼前的苟且，还有读不懂的诗和远方</h3>
                   </div>
                   <div class="panel-body">
                       <div class="forms">
                           <div class="form-grids widget-shadow" data-example-id="basic-forms">
                               <div class="form-body" id="controllerhiden">
                                   <form method="post" action="/article/uploadarticle" enctype="multipart/form-data">
                                       <div class="form-group">
                                           <label for="smalltitle" class="fa fa-warning" style="color: orangered"></label>&nbsp;请输入小标题（必填）:
                                           <input type="text" name="smalltitle" class="form-control" id="smalltitle" placeholder="小标题" maxlength="20"> </div>
                                       <label for="firstartic" class="fa fa-warning"  style="color: orangered"></label>&nbsp;请填写第一段的内容，最多为200个字符（必填）
                                       <div class="form-group">
                                           <textarea name="firstartic" id="firstartic" class="form-control" style="margin: 0px 35.5938px 0px 0px; width: 100%; height: 110px;" maxlength="50"></textarea>
                                       </div>
                                       <i class="fa fa-warning" style="color: orangered"></i>为了图像显示效果建议文件图片大小220px X 150px（选填）
                                       <input type="text" id="image" name="artieimg">
                                       <br>
                                       <div class="dropzone dropzone-file-area" id="my-dropzone">
                                           <h4 class="sbold">拖动文件到这里或点击上传</h4><i class="fa fa-cloud-upload fa-5x"></i><p></p>
                                       </div>
                                       <br>
                                       <label for="textarea"class="fa fa-warning"  style="color: orangered"></label>&nbsp;请在下面填写短篇文章正文内容
                                       <div class="form-group">
                                           <textarea name="textarea" id="textarea" required="true" class="form-control" style="margin: 0px 35.5938px 0px 0px; width: 100%; height: 400px;" maxlength="3000"></textarea>
                                       </div>
                                       <input type="hidden" name="userid" value="${userinfo.id}">
                                       <button type="submit" class="btn btn-info btn-block">上传</button>
                                   </form>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>
</section>
<script src="../../static/dropzone/dropzone.min.js"></script>
<jsp:include page='include/maincontext_footer.jsp'></jsp:include>
<script>
    Dropzone.options.myDropzone = {
        url: "/article/upload",
        dictDefaultMessage: "",
        paramName: "dropFile",
        maxFilesize: 2,
        init: function () {
            this.on("success", function (file, data) {
                $("#image").val(data.filePath);
            });
        }
    }
</script>
</body>
</html>
