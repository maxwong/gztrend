/**
 * Created by maxwong on 2/23/16.
 */

var server;

function getAvailableSections() {
    var sectionList = $('#section_list'),
        clickUrl = "'" + server + "/details.html?plan_id=$plan_id'",
        urlVars = getUrlVars();

    var planId= urlVars['plan_id'];
    var buttonTemplate = '<label class="btn btn-default"><input type="checkbox" value="$section_id">$name</label>';

    $.ajax({
            url: '/plan/' + planId + '/sections',
            success: function(data) {
                var planSummary = JSON.parse(data);
                $('#heading').html('<h4>' + planSummary.name + '</h4>');
                var sections = planSummary.sections;


                for (var i = 0; i < sections.length; ++i) {
                    var sectionId = sections[i].section_id,
                        name = sections[i].name;

                    var button = buttonTemplate.replace("\$section_id", sectionId).replace("\$name", name);

                    sectionList.append(button);
                }

            }
        });
}

function onSubmit() {
    var selectedSection = $('#section_list label input:checked');
    var urlVars = getUrlVars(),
        result = "",
        planId = urlVars['plan_id'];
    for (var i = 0; i < selectedSection.length; ++i) {
        result += ',' + selectedSection[i].value;
    }

    result = result.substr(1, result.length - 1);

    location.href = server + '/details.html?plan_id=' + planId + '&section_id=' + result;
}

$(document).ready(function () {
    $.getScript("js/conf.js", function() {
        getAvailableSections();
    });

});