jQuery(function($) {
    jQuery.extend({
        clock_year : function clock(target){
            var now  = new Date();
            var year = now.getFullYear();

            var time_str = year + "年";

            // htmlの内容を更新
            target.text(time_str);
            //target.html(time_str);

            // 1000ミリ秒（1秒）毎に更新
            setTimeout(function(){
                clock(target)
            },1000);
        },
        clock_month_day : function clock(target){
            var dayOfTheWeek = new Array("日","月","火","水","木","金","土");
            var now  = new Date();
            var month = now.getMonth()+1;
            var date = now.getDate();
            var day = now.getDay();
            if(month < 10) {
                month = "0" + month;
            }
            if(date < 10) {
                date = "0" + date;
            }

            var time_str = month + "月" + date + "日" + "（" + dayOfTheWeek[day] + "曜日）";

            // htmlの内容を更新
            target.text(time_str);
            //target.html(time_str);

            // 1000ミリ秒（1秒）毎に更新
            setTimeout(function(){
                clock(target)
            },1000);
        },
        clock_time : function clock(target){
            var now  = new Date();
            var hour = now.getHours();
            var min = now.getMinutes();
            var sec = now.getSeconds();
            if(hour < 10) {
                hour = "0" + hour;
            }
            if(min < 10) {
                min = "0" + min;
            }
            if(sec < 10) {
                sec = "0" + sec;
                //$('body').css({
                //    backgroundImage: 'url("app/assets/images/4.jpg")'
                //});
                //document.body.style.backgroundImage='url("../images/4.jpg")';
                //$("body").css('color', 'black');
            //} else {
                //$("body").css('background-image', 'url(../images/4.jpg)');
                //$('body').css({
                //    backgroundImage: 'url("app/assets/images/4.jpg")'
                //});
                //document.body.style.backgroundImage='url("../images/4.jpg")';
            }
            var time_str = hour + "時" + min + "分" + sec + "秒";

            // htmlの内容を更新
            target.text(time_str);
            //target.html(time_str);

            // 1000ミリ秒（1秒）毎に更新
            setTimeout(function(){
                clock(target)
            },1000);
        }
    });

    // 現在日時を表示
    jQuery.clock_year(jQuery("#now_year"));
    jQuery.clock_month_day(jQuery("#now_month_day"));
    jQuery.clock_time(jQuery("#now_time"));
});