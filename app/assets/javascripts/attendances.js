$(function(){
    $(".square_btn_s").click(function(){
        var time_now = get_time_now_timestamp();
        $.ajax({
            url: "/attendances/regist",
            type: "GET",
            data: {
                time_now: time_now,
                division_id: "1"
            },
            dataType: "xml",
            success: function(data) {
                alert("出勤時間を登録しました。");
                $(".square_btn_s").prop("disabled", true);
                $(".square_btn_s").css("background-image", "-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #D3D3D3), color-stop(1.0, #D3D3D3))");
                $('.square_btn_e').removeAttr('disabled');
                $(".square_btn_e").css("background-image", "-webkit-linear-gradient(45deg, #FFC107 0%, #ff8b5f 100%)");
            },
            error: function(data) {
                alert('出勤時間の登録に失敗しました。');
            }
        });
    });

    $(".square_btn_e").click(function(){
        var time_now = get_time_now_timestamp();
        $.ajax({
            url: "/attendances/regist",
            type: "GET",
            data: {
                time_now: time_now,
                division_id: "2"
            },
            dataType: "xml",
            success: function(data) {
                alert('退勤時間を登録しました。');
                $(".square_btn_e").prop("disabled", true);
                $(".square_btn_e").css("background-image", "-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #D3D3D3), color-stop(1.0, #D3D3D3))");
                $('.square_btn_s').removeAttr('disabled');
                $(".square_btn_s").css("background-image", "-webkit-linear-gradient(#6795fd 0%, #67ceff 100%)");
            },
            error: function(data) {
                alert('退勤時間の登録に失敗しました。');
            }
        });
    });

    var get_time_now_timestamp = function() {
        var d = new Date();

        // 年月日・曜日・時分秒の取得
        var month  = d.getMonth() + 1;
        var day    = d.getDate();
        var hour   = d.getHours();
        var minute = d.getMinutes();

        // 1桁を2桁に変換する
        if (month < 10) {month = "0" + month;}
        if (day < 10) {day = "0" + day;}
        if (hour < 10) {hour = "0" + hour;}
        if (minute < 10) {minute = "0" + minute;}

        // 整形して返却
        return d.getFullYear()  + month + day + hour + minute;
    }
});