$(function () {
    $.ajax({
        url:'/article/getcount',
        type:'POST',
        dataType: 'JSON',
        data:{
        },
        success:function(data){
//                    $.alert(data+"总数量")
            var pagesize = 12;
            var totalpage = data%pagesize==0?data/pagesize:Math.ceil(data/pagesize);
//                    alert(totalpage+"总页数")
            $('.M-box').pagination({
                pageCount:totalpage,   //总页码
                coping:true,                 //是否开启首页和末页
                homePage:'首页',
                endPage:'末页',
                prevContent:'&laquo;',//这里是设置的默认样式
                nextContent:'&raquo;',//这里是设置的默认样式
                current:1, //当前页码
                className: 'paginationjs-small',
                callback:function (api) {
                    var currentpage = api.getCurrent()-1;//获得当前点击页
//                            alert(currentpage+"当前页 ")
                    $.post("/article/currenpage",{"pagesize":pagesize,"currentpage":currentpage},function (infos) {
//                                    alert(infos);
                        var commentinfo =  $.parseJSON(infos);
                        $("#changebom").empty()
                        for (i = 0;i<commentinfo.length;i++){
                            $("#changebom").append(
                                // "<article class='excerpt excerpt-1'><a class='focus' target='_blank' ><img class='thumb' src='"+commentinfo[i].artieimg+"' alt='文章插图' style='display: inline;width: 220px;height: 150px'></a><header><a class='cat' >小标题 <i></i></a><h2><a href='/article/selectsinglessay?essayid="+commentinfo[i].id+"' target='_blank' >"+commentinfo[i].smalltitle+"</a></h2></header><p class='meta'><time class='time'><i class='glyphicon glyphicon-time'>"+commentinfo[i].uoloadtime+"</i></time><span class='views' style='color: pink'><i class='glyphicon glyphicon-heart'></i>"+commentinfo[i].fabulous+"</span>&nbsp;&nbsp;<a href='/article/selectsinglessay?essayid="+commentinfo[i].id+"'><i class='fa fa-link fa-1x'></i>查看原文</a>&nbsp;&nbsp;&nbsp;<a class='comment' href='/percenter/collection?aid="+commentinfo[i].id+"&uid='{userinfo.id}' title='收藏' target='_blank' ><i class='fa fa-bookmark fa-2x'></i></a></p><p class='note'>"+commentinfo[i].smalltitle+"</p></article><br/>"
                                "<article class='excerpt excerpt-1'><a class='focus' target='_blank' ><img class='thumb' src='"+commentinfo[i].artieimg+"' alt='文章插图' style='display: inline;width: 220px;height: 150px'></a><header><a class='cat' >小标题 <i></i></a><h2><a href='/article/selectsinglessay?essayid="+commentinfo[i].id+"' target='_blank' >"+commentinfo[i].smalltitle+"</a></h2></header><p class='meta'><time class='time'><i class='glyphicon glyphicon-time'>"+commentinfo[i].uoloadtime+"</i></time><span class='views' style='color: pink'><i class='glyphicon glyphicon-heart'></i>"+commentinfo[i].fabulous+"</span>&nbsp;&nbsp;<a href='/article/selectsinglessay?essayid="+commentinfo[i].id+"'><i class='fa fa-link fa-1x'></i>查看原文</a>&nbsp;&nbsp;&nbsp;<a class='comment' href='/percenter/collection?aid="+commentinfo[i].id+"&uid=kong' title='收藏' target='_blank' ><i class='fa fa-bookmark fa-2x'></i></a></p><p class='note'>"+commentinfo[i].smalltitle+"</p></article><br/>"
                            )
                        }
                    })
                }
            });
        }
    })
})