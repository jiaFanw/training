$(function(){

    timeFn();
    setInterval("timeFn()",1000);

})
function timeFn(){
    var mydate = new Date();
    var month = mydate.getMonth()+1;//月
    var day = mydate.getDate();
    var week = mydate.getDay(); //获取当前星期X(0-6,0代表星期天)
// var mydate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
    var hour = mydate.getHours(); //获取当前小时数(0-23)
    var minutes = mydate.getMinutes(); //获取当前分钟数(0-59)
    var second = mydate.getSeconds(); //获取当前秒数(0-59)
    if( week == '0'){
        week = "星期天";
    }else if(week == '1'){
        week = "星期一";
    }else if(week == '2'){
        week = "星期二";
    }else if(week == '3'){
        week = "星期三";
    }else if(week == '4'){
        week = "星期四";
    }else if(week == '5'){
        week = "星期五";
    }else if(week == '6'){
        week = "星期六";
    };
    var str = fn1(hour)+":"+fn1(minutes)+":"+fn1(second);
    var str1 = month+"月"+day+"日"+week;
    $('#time').html(str);
    $('#day').html(str1);
};
function fn1(n){
    return n<10?'0'+n:''+n;
};