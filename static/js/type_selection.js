/**
 * Created by maxwong on 6/18/16.
 */
var server;

function getTypes() {
    var typeList = $('#type_list'), clickUrl = "'" + server + "/plan_selection.html?type=$type'";
    var buttonTemplate = '<button type="button" class="btn btn-info" onclick="location.href=' + clickUrl + '">$name</button>';
    $.ajax({
            url: '/type',
            success: function(data) {
                var types = JSON.parse(data);

                for (var i = 0; i < types.length; ++i) {
                    var type = types[i],
                        name = type;
                    if (type == null) {
                        type = '_NULL';
                        name = '未分类';
                    }

                    var button = buttonTemplate.replace("\$type", type).replace('\$name', name);

                    typeList.append(button);
                }

            }
        });
}

$(document).ready(function () {
    $.getScript("js/conf.js", function() {
        getTypes();

    });
});