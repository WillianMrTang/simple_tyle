<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="/static/jquery-3.3.1.min.js"></script>
    <%--这里是二级导航条注释后就更改为另一种样式--%>
    <link rel="stylesheet" href="/static/common_js/indexCSS/two_stage_navigation.styl">
    <%--这是引入页面所需的其他样式--%>
    <link rel="stylesheet" href="/static/common_js/indexCSS/other_styles.styl">
    <%--这是font-awesome图标集--%>
    <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
    <%--这是font-awesome图标集--%>
    <!--demo文件中的-->
    <link rel="stylesheet" href="/static/jquery-confirm/demo/libs/bundled.css" />
    <link rel="stylesheet" href="/static/jquery-confirm/dist/jquery-confirm.min.css" />
    <!--dist文件夹中的-->
    <title>极致简约风</title>
    <meta charset="UTF-8">
    <!-- CSS Bootstrap & Custom -->
    <link rel="stylesheet" href="../../static/ShouYe/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/ShouYe/css/animate.css">
    <link rel="stylesheet" href="../../static/ShouYe/css/templatemo_misc.css">
    <link  rel="stylesheet" href="../../static/ShouYe/bootstrap-3.3.7/css/bootstrap.css"/>
    <link rel="stylesheet" href="../../static/ShouYe/css/templatemo_style.css">
    <link rel="stylesheet" href="../../static/ShouYe/css/font-awesome.min.css" />
<style>
    body{
        background-size: 100%;
        width:100%;
        height: auto;
    }
</style>
</head>
<body style="background-image: url('/static/ShouYe/images/bg6.gif');">
<div class="site-header">
    <div class="main-navigation">
        <div class="container">
            <div class="row">
                <div class="col-md-12 responsive-menu">
                    <a href="#" class="menu-toggle-btn">
                        <i class="fa fa-bars"></i>
                    </a>
                </div> <!-- /.col-md-12 -->
                <div class="col-md-2">
                    <img src="../../static/atricleimgs/LOGO.jpg" width="180px" height="55px" class="logoimage"/>
                </div>
                <div class="col-md-10 main_menu">
                    <ul>
                            <li><a id="toEssay" class="fa fa-gear fa-3x fa-spin"></a>
                                <ul>
                                    <li>简约风</li>
                                </ul>
                            </li>
                        <li><a class="show-3 templatemo_page3 glyphicon glyphicon-education" href=""></a>
                            <ul>
                                <li>作者</li>
                            </ul>
                        </li>
                        <c:choose>
                            <c:when test="${userinfo != null}">
                                <li><a class="show-2 templatemo_page2 fa fa-check-circle fa-2x" href=""></a>
                                    <ul>
                                        <li>已登录</li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="show-4 templatemo_page4 fa fa-user-circle-o" href=""></a>
                                    <ul>
                                        <li>登录</li>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li><a class="show-5 templatemo_page5 fa fa-registered fa-3x" href=""></a>
                            <ul>
                                <li>注册</li>
                            </ul>
                        </li>
                        <li><i><a class="fa fa-sign-out fa-2x" id="declare"></a></i>
                            <ul>
                                <li>注销</li>
                            </ul>
                        </li>
                    </ul>
                </div> <!-- /.col-md-12 -->
            </div> <!-- /.row -->
        </div>
    </div> <!-- /.main-navigation -->
    <div class="container">
        <div class="row">
            <br />
            <br />
            <div class="col-md-12">
                <img src="../../static/ShouYe/images/gallery/HeadLeader.png" width="1170px" height="139px" />
            </div>
        </div>
    </div>
</div>
<div id="menu-container">
    <!--导航栏的第1部分的-->
    <div class="content homepage" id="menu-1">
        <div class="container-fluid">
            <div class="row">
            </div>
        </div>
    </div>
    <!--导航栏的第2部分的-->
    <!--导航栏的第3部分的-->
    <div class="content services" id="menu-3">
        <div class="container">
            <div class="row">
                <div class="col-md-9 col-sm-10">
                    <div class="inner-content">
                        <div class="toggle-content" id="tab1">
                            <h2 class="page-title">关于作者</h2>
                            <p>作者英文名Willian_Tang。家乡在中国四川省内江市威远，是一个优秀的全栈工程师
                                The author's English name is Willian_Tang. Hometown in Weiyuan, Neijiang, Sichuan, China, is an excellent full stack engineer.
                            </p>
                            <p>作者掌握前后端的相关技能如下</p>
                            <ul>
                                <li>Java,JavaWe,JavaEE,微服务及分布式架构,mysql数据库相关技术</li>
                                <li>熟练的使用Idea,Eclipse,Hbulider,Photoshop</li>
                                <li>Java, JavaWe, JavaEE, micro service and distributed architecture, MySQL database related technologies</li>
                                <li>Skilled use of Idea, Eclipse, Hbulider, Photoshop</li>
                            </ul>
                            <p>作者的爱好：旅游 美食 拍照 音乐 所以做次网站的原因之一就是给广大的拍照爱好者提供一个平台交流，打破传统的只有图片而没有交流心得的过程和图片的作者或者拍摄者不为人知的问题
                                Author's hobby: One of the reasons for making this website is to provide a platform for photographers to communicate with each other. It breaks the traditional process of only pictures but not the process of communicating what they have learned and the unknown problems of the author or the photographer.
                            </p>
                        </div>
                        <div class="toggle-content" id="tab2">
                            <h2 class="page-title">作者寄语</h2>
                            <p>在简约风里请遵守法律法规，严禁发表恶意，反动，污秽，辱骂他人等行为时，如果有违反的，请自行承担相应的责任，遵纪守法是每个公民应该尽到的责任，所以请严肃认真的斟酌自己的见解和意见，尊重他人，尊重自己</p>
                            <p>In T Mengli, please abide by the laws and regulations, strictly prohibit malicious, reactionary, dirty, abusive and other acts, if there is a violation, please bear the corresponding responsibility, compliance with the law is the responsibility of every citizen, so please seriously consider their own views and opinions, respect others, respect themselves.</p>
                            <p>
                                光阴太窄，指缝太宽，不知不觉又到了放逐秋叶的时节。隙风过眼，天高云淡，天空大多时候更像是一块青色的绸缎。流畅的色韵，通透而澄澈，让人心里一下子平添了几分喜欢。气势不凡的秋，向来承载着很多生命之重。这个绽放与凋零并存的盛大季节，将在一片秋潮中诠释生命的内涵。

                                俯仰生命万象，别有一番清绝在心头。曾经满枝滴翠流红，出尽了风头，占尽了风流，而今，不慌不忙地沉淀，从从容容地静美，尤其是第一片泛黄的树叶飘落，不由得令人想起旧时光阴。放眼回顾，那些杏雨梨云，奇花瑶草、裁红点翠的倩影，早已消逝成烟，当前，只剩下特立独行的人与自然，彼此默契地锁定秋光这一抹欢颜。

                                视线中，虽然秋风近，不乏沧桑之感，却也不失为一幅灵动的水墨丹青。无需刻意调色，也不用精心杜撰，秋风和秋阳同台演绎的金风玉露、云枝烟叶，已经抛开世俗的繁复礼节，乘坐一叶五色舢板，以超然、洒脱的姿态，摒弃浮华的追逐，在秋水长天的渡口诗意地靠岸。

                                于是，那成林成海的五彩丰韵，沉稳地带着我穿过摇落的时间，用一墨染念，速写生命的秋天。

                                仔细品味，其实我们和果实累累、落叶飞舞的秋天一样，前半生犹如春天的繁花，在美好的时光里尽情地绽放，后半生则像傲霜的秋叶，在薄凉的季节中脆弱地凋零。即便我们有思想和智慧，即便我们勇往直前，到最后依然要遵循人生一世，草木一秋的自然规律。

                                生命本身就是向死而行的过程。天地间新奇的风物本来也是层出不穷。就如此刻，东隅的枝头，西部的田间，南方的江水，北国的山峦……这些渐欲饱满的秋色，在阳光的照耀下，既潋滟又璀璨。

                                你看，远处的银桥枫畔，那一丛丛金灿灿的黄，那一片片如火如荼的红，在秋风里招摇地闪呀闪，这一场色彩的相遇，足以媲美人之春天的明艳。

                                你瞧，飞翔的白鸽，展翅的鸿雁，频繁迢递我字里行间的悠远，折几页韵脚含着清露的书笺，一笔一画全是对秋色对生命的婉叹。。。。。
                            </p>
                        </div>
                        <div class="toggle-content" id="tab3">
                            <h2 class="page-title">作者照片</h2>
                            <br />
                            <div class="widget-content" style="background-image: linear-gradient(225deg, #FF3CAC 0%, #FF1493 50%, #2B86C5 100%);" >
                                <img src="../../static/ShouYe/images/Author.jpeg"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-2">
                    <div id="icons">
                        <ul class="tabs">
                            <li>
                                <a href="#tab1" class="icon-item">
                                    <i class="fa fa-bars"></i>
                                    <span>关于作者</span>
                                </a>
                            </li>
                            <li>
                                <a href="#tab2" class="icon-item">
                                    <i class="fa fa-bars"></i>
                                    <span id="need_know">进站须知</span>
                                </a>
                            </li>
                            <li>
                                <a href="#tab3" class="icon-item">
                                    <i class="fa fa-bars"></i>
                                    <span>作者照片</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--导航栏的第4部分的-->
    <div class="content about" id="menu-4">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-2"></div>
                <div class="col-md-6 col-sm-8">
                    <div class="about-us-content">
                        <div class="widget-content">
                            <div class="page-title">Hei~~！I Am TWG Welcome to LoginOn Your Account</div>
                            <div class="contact-form">
                                <form action="/logregist/login" method="post" id="forms0">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input type="text" class="form-control" placeholder="用戶名" name="username" maxlength="6" id="Lusername">
                                </div>
                                    <span id="Ldiv1"></span>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input type="text" class="form-control" placeholder="密码" name="password" id="Lpassword" maxlength="8" id="Lpassword">
                                </div>
                                    <span id="Ldiv2"></span>
                                <br />
                                Attention:进站请请在作者页阅读<a href="#need_know">进站须知</a>，注册或登录即代表你愿意遵守相关条款规定
                                <br />
                                </form>
                                <input type="submit"  class="btn btn-info btn-lg" value="立即登录" id="denglu"/>
                                <div style="color: orangered">注意:登录成功后该界面将不再显示，否则证明用户不存在或输入错误</div>
                            </div> <!-- /.contact-form -->
                        </div> <!-- /.col-md-6 -->
                    </div> <!-- /.inner-content -->
                </div> <!-- /.col-md-9 -->
                <div class="col-md-3 col-sm-2">
                </div> <!-- /.col-md-3 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.services -->
    <!--导航栏的第5部分的-->
    <div class="content contact" id="menu-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="widget-content">
                        <div class="page-title">Hei~~！I Am TWG Welcome to Regist Your Account</div>
                        <%--<div class="contact-form">--%>
                            <form  method="post" action="/logregist/regist" id="forms">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" placeholder="用戶名" id="rusername" name="username" maxlength="6">
                            </div>
                                <span id="div1"></span>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input type="text" class="form-control" placeholder="密码" name="password" maxlength="8" id="rpassword">
                            </div>
                                <span id="div2"></span>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-ok"></i></span>
                                <input type="text" class="form-control" placeholder="确认密码" name="apassword" maxlength="8" id="apassword">
                            </div>
                                <span id="div3"></span>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                <input type="text" class="form-control" placeholder="手机号" name="phone" id="phone" maxlength="11">
                            </div>
                                <span id="div4"></span>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input type="text" class="form-control" placeholder="邮箱" name="email" id="email" maxlength="20">
                            </div>
                                <span id="div5"></span>
                            <br />
                            <input type="checkbox" id="checking">我同意并已阅读进站须知。
                                <%--<input type="submit" class="btn btn-info btn-lg" value="立即注册"/>--%>
                            </form>
                        <input type="submit" class="btn btn-info btn-lg" value="立即注册" id="tijioa"/>
                        <%--</div> <!-- /.contact-form -->--%>
                        <c:if test="${not empty validatemsg}">
                            <div style="color: orangered">
                                ${validatemsg}
                            </div>
                        </c:if>
                    </div>
                </div> <!-- /.col-md-6 -->
                <div class="col-md-3"></div>
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.contact -->

</div> <!-- /#menu-container -->

<div id="templatemo_footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <br>
                <br>
                <p>网站:创意Idea</p>
                <p>制作:TWG 唐微港 (www.twgfs.online)</p>
                <p>网站资源来自于网络，如有版权问题请联系速删</p>
            </div> <!-- /.col-md-12 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.templatemo_footer -->
<%--这里是表单验证--%>
<script src="/static/common_js/indexJS/yanzheng.js"></script>
<%--这里是将弹出框作为外部的引入--%>
<script src="/static/common_js/indexJS/confirm_kuang.js"></script>
<%--这里一直没出现模态框，然后找寻了很多办法也是无法出现效果，然后就将<script src="../../static/ShouYe/js/jquery-1.10.2.min.js"></script>
这句script放在最前面就行了，所以总结位置对效果有影响
--%>
<script src="../../static/ShouYe/js/jquery-1.10.2.min.js"></script>
<%--特别注意--%>
<script src="/static/jquery-confirm/dist/jquery-confirm.min.js"></script><!--这里放置的jQuery-confirm-->
<script src="../../static/ShouYe/js/jquery-migrate-1.2.1.min.js"></script>
<script src="../../static/ShouYe/js/modernizr.js"></script>
<script src="../../static/ShouYe/js/bootstrap.js"></script>
<script src="../../static/ShouYe/js/tabs.js"></script>
<script src="../../static/ShouYe/js/jquery.lightbox.js"></script>
<script src="../../static/ShouYe/js/templatemo_custom.js"></script>
<script type='text/javascript' src='../../static/ShouYe/js/logging.js'></script>
</body>
</html>
