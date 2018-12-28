<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--导入mainContextHead--%>
    <%@include file="../include/maincontext_head.jsp"%>
    <%--导入mainContextHead--%>
        <%--外部提取后的css文件--%>
        <link rel="stylesheet" href="/static/common_js/errorCSS/bulding_404.styl">
    <%--drop文件--%>
        <link href="../../../static/dropzone/dropzone.min.css" rel="stylesheet">
        <link href="../../../static/dropzone/basic.min.css" rel="stylesheet">
        <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        #my-dropzone{
            background-color: lightskyblue;
            border: 2px dotted black;
            text-align: center;
            font-size: 18px;
            border-radius: 20px;
            height: 70%;
            padding-top: 100px;
        }
    </style>
</head>
<body class="user-select">
<header class="header">
    <nav class="navbar navbar-default" id="navbar">
        <div class="container">
            <div class="header-topbar hidden-xs link-border">
                <img src="../../../static/atricleimgs/LOGO.jpg" alt="TWG" style="width: 180px; height: 56px;" id="borderR">
                    <%@include file="../include/maincontext_daohang.jsp"%>
            </div>
        </div>
    </nav>
</header>
<hr />
<br />
<br />
<br />
<section class="container">
    <br />
    <div class="panel">
        <input type="hidden" value="" id="image">
        <div class="dropzone dropzone-file-area" id="my-dropzone">
            <h3 class="sbold">拖动文件到这里或点击上传</h3>
            <i class="fa fa-cloud-upload fa-5x"></i>
            <p>网站正在建设中,暂不支持上传.........</p>
        </div>
    </div>
</section>

<script src="../../../static/dropzone/dropzone.min.js"></script>
<jsp:include page="../include/maincontext_footer.jsp"></jsp:include>
<script>
    Dropzone.options.myDropzone = {
        url: "/upload",
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
