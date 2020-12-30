$(function(){
    var _index;
    // 首页、政务公开tab切换
    $('.content-list>p>span').hover(function() {
        _index = $(this).index();
        $(this).siblings().removeClass('show');
        $(this).siblings('a').eq(_index).addClass('show');
        $(this).addClass('show');
        $(this).parents('p').siblings('ul').children('li').removeClass('show');
        $(this).parents('p').siblings('ul').children('li').eq(_index).addClass('show');
    });

    // 政务公开
    $('.rule>p>b>a').click(function(event) {
        var _index =$(this).index();
        $(this).siblings('a').removeClass('active');
        $(this).addClass('active');
        $(this).parent('b').parent('p').siblings('ol').children('li').removeClass('show');
        $(this).parent('b').parent('p').siblings('ol').children('li').eq(_index).addClass('show');


    });
});