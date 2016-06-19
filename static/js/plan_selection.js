/**
 * Created by maxwong on 2/23/16.
 */
var server;

function getAvailablePlans() {
    var planList = $('#plan_list'), clickUrl = "'" + server + "/section_selection.html?plan_id=$plan_id'";
    var buttonTemplate = '<button type="button" class="btn btn-info" onclick="location.href=' + clickUrl + '">$name</button>';
    var vars = getUrlVars();
    $.ajax({
        url: '/plan?type=' + vars['type'],
        success: function (data) {
            var plan = JSON.parse(data);

            for (var i = 0; i < plan.length; ++i) {
                var planId = plan[i].plan_id,
                    name = plan[i].name;

                var button = buttonTemplate.replace("\$plan_id", planId).replace("\$name", name);

                planList.append(button);
            }

        }
    });
}

$(document).ready(function () {
    $.getScript("js/conf.js", function () {
        getAvailablePlans();

        $('#export').click(function () {
            location.href = server + '/export.html';
        });
    });
});