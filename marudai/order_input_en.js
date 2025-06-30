$(function() {
    $('input[type="number"]').change(function() {
        var val = $(this).val();
        if (val > 0) {
            $(this).css('background-color','orange');
        } else {
            $(this).val('');
            $(this).css('background-color','transparent');
        }
    });
    
    $('#order').click(function() {
        var orderText = '';
        for (var i = 1; i <= 34; i++) {

            var input_1 = $("#" + i).val(); // 入力1個目
            var isExistOrder = false;
            if (input_1 && input_1.length > 0) {
                orderText += '\n' + $("#s_" + i).text();
                orderText += '　' + input_1;
                orderText += $("#u_" + i).text();
                isExistOrder = true;
            }

            var input_2 = $("#" + i + "_2").val(); // 入力2個目
            if (input_2 && input_2.length > 0) {
                if (!isExistOrder) {
                    orderText += '\n' + $("#s_" + i).text();
                }
                orderText += '　' + input_2;
                orderText += $("#u_" + i + "_2").text();
            }
        }

        if (orderText.length > 0) {
            if ($('#remarks').val().length > 0) {
                orderText += "\n\n" + $('#remarks_title').text();
                orderText += "\n" + $('#remarks').val();
            }
            if (confirm('以下の内容で注文します\n' + orderText)) {
                var date_time = new Date();
                var date_time_str =
                    + date_time.getFullYear()
                    + "年"
                    + ("0" + (date_time.getMonth() + 1)).slice(-2)
                    + "月"
                    + ("0" + date_time.getDate()).slice(-2)
                    + "日_"
                    + ("0" + date_time.getHours()).slice(-2)
                    + "時"
                    + ("0" + date_time.getMinutes()).slice(-2)
                    + "分"
                    + ("0" + date_time.getSeconds()).slice(-2)
                    + "秒";

                orderText = "<html lang=\'ja\'><head><meta charset=\'utf-8\'></head><body>"
                    + "韓国料理　縁　" + date_time_str + "　発注<br>"
                    + orderText.split("\n").join("<br>")
                    + "</body></html>"

                var text_name = "韓国料理_縁_" + date_time_str + ".html";

                $.ajax({
                    type: "POST",
                    url: "./save_file.php",
                    data: {file_name: text_name , post_data: orderText}
                }).done(function(response, textStatus, xhr) {
                    alert("注文を完了しました");
                    location.reload();
                }).fail(function(xhr, textStatus, errorThrown) {
                    alert("送信に失敗しました");
                });


            }else{
	        alert("注文をキャンセルしました");
	        return false;
            }
	} else {
	    alert("1点以上のご注文の入力が必要です");
	}
    });
});
