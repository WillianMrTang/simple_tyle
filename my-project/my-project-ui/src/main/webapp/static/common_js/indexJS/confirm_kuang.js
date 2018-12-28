$(function () {
    /*
    * 这里是用于注销的
    * */
    $("#declare").click(function () {
        $.confirm({
            icon:'fa fa-frown-o',
            title: '',
            type:'purple',
            content: '你是认真的？，确定注销？',
            animation: 'Rotate',//这里是设置模态框的出现时的动画
            closeAnimation: 'rotateYR',//这里是模态框关闭时候的动画
            autoClose: '还是留下|7000',//这里设置的是5秒后自动关闭，如果没进行任何操作就调用自动关闭
            theme: 'Modern',
            animationSpeed: 1000,//这是设置动画出现和消失的速度
            backgroundDismissAnimation: 'random',
            buttons: {
                确定: {//这里确认
                    text: '嗯。。想好了',
                    btnClass: 'btn-purple',//这里可以通过改变btn后面的颜色达到改变按钮的颜色
                    action: function () {
                        location.href="/logregist/logout";
                    }
                },
                还是留下: function () {
                    $.alert({
                        title: '', //这里是警示框标题
                        content: '很高兴你留下来！', //这里是内容
                        type: 'purple',//模态框头部的颜色
                    });
                }
            }
        });
    })
    /*
    * 这里是用于前往文章首页的
    * */
    $("#toEssay").click(function () {
        $.confirm({
            icon:'fa fa-handshake-o',
            title: '',
            type:'purple',
            content: '进入网站前请认真阅读进站须知，请问你是否同意遵守进站须知的相关条例？',
            animation: 'scale',//这里是设置模态框的出现时的动画
            closeAnimation: 'rotateYR',//这里是模态框关闭时候的动画
            theme: 'Modern',
            animationSpeed: 1000,//这是设置动画出现和消失的速度
            backgroundDismissAnimation: 'random',
            buttons: {
                确定: {//这里确认
                    text: '我同意',
                    btnClass: 'btn-purple',//这里可以通过改变btn后面的颜色达到改变按钮的颜色
                    action: function () {
                        location.href="/article/articlshow";
                    }
                },
                拒绝: function () {
                    $.alert({
                        title: '', //这里是警示框标题
                        content: '你在好好想想！', //这里是内容
                        type: 'purple',//模态框头部的颜色
                    });
                }
            }
        });
    })
});