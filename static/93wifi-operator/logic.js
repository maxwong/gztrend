function clearContent(elementId) {
    $("#result").html("");
}

function getIdFromPhp() {
    var start_time = $('#start_time').val().trim(),
        end_time = $('#end_time').val().trim(),
        gw_id = $('#gw_id').val().trim(),
        $resultDiv = $("#result");

    var result = jQuery.ajax({
            url: "query_id.php",
            type: "POST",
            data: {
                "start_time" : start_time,
                "end_time" : end_time,
                "gw_id" : gw_id,
                "register" : $('#register').is(":checked"),
                "login" : $('#login').is(":checked"),
                "credit" : $('#credit').is(":checked"),
                "rmb" : $('#rmb').is(":checked"),
                "android" : $('#android').is(":checked"),
                "ios" : $('#ios').is(":checked")
            },
            success: function(data) {
                if (data == "") {
                    alert("页面错误。请保留输入与运行环境，然后联系开发人员");
                }
                var rows = data.split('\n');

                var headers = rows[0].split(',');

                var rowCount = rows.length,
                    columnCount = headers.length;

                $resultDiv.append('<div class="alert alert-success">记录总数: ' + ((rows.length - 2) > 0 ? (rows.length - 2) : 0) + '</div>');
                $resultDiv.append('<table id="dataTable" class="table table-striped" style="table-layout: fixed;">');
                $table = $("#dataTable");

                var rowHtml = '<tr>';
                for (var i = 0; i < columnCount; ++i) {
                    rowHtml += '<th>' + headers[i] + '</th>';
                }
                rowHtml += '</tr>';

                $table.append(rowHtml);

                for (var i = 1; i < rowCount - 1; ++i) {
                    var values = rows[i].split(',');
                    rowHtml = '<tr>';
                    for (var j = 0; j < columnCount; ++j) {
                        rowHtml += '<td>' + values[j] + '</td>';
                    }
                    rowHtml += '</tr>';
                    $table.append(rowHtml);
                }

                $resultDiv.append("<hr></hr>显示完毕。以下空白。");
            },
            error: function(data) {
                alert("页面错误。请保留输入与运行环境，然后联系开发人员");
            }
    });

    return result;
}

function updateDeadlineFromPhp() {
    var duration = $('#duration').val().trim(),
        mnemonic = $('#mnemonic').val().trim(),
        $resultDiv = $("#result");


    var result = jQuery.ajax({
        url: "update_deadline.php",
        type: 'POST',
        data: {
            "duration" : duration,
            "mnemonic" : mnemonic
        },
        success: function(data) {
            var result = '<div class="alert alert-',
                now = new Date();

            if (data == "successful") {

                result += 'success">' + now.toLocaleString() + ' - 时长更新成功^_^。时长：' + duration + '分钟';
                $('#duration').val("");
            }else {
                result += 'danger">' + now.toLocaleString() + ' - :时长更新失败。原因：' + data;
            }
            result += "</div>";
            $resultDiv.append(result);
        },
        error: function(data) {
            alert("页面错误。请保留输入与运行环境，然后联系开发人员");
        }
    });

    return result;
}


function queryId() {
    clearContent("result");
    var start_time = $('#start_time').val().trim(),
        end_time = $('#end_time').val().trim(),
        gw_id = $('#gw_id').val().trim();

    if (start_time == "" || end_time == "" || gw_id == "") {
        alert("请检查输入。开始时间、结束时间与设备序列号皆为必填项。");
        return;
    }
    getIdFromPhp();
}

function updateDeadline() {

    var duration = $('#duration').val().trim(),
        mnemonic = $('#mnemonic').val().trim();

    if (duration == "" || mnemonic == "") {
        alert("请检查输入。时长与93ID皆为必填项。");
        return;
    }


    updateDeadlineFromPhp();
}

$(function() {
    $('#header').load('header.html');
    $('#footer').load('footer.html');
});
