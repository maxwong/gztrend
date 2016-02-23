/**
 * Created by maxwong on 2/22/16.
 */

var server = 'http://localhost:5000';


function export_internal() {
    var orderId = $('#order_id').val();
    location.href = server + '/export?order_id=' + orderId;
}

$(document).ready(function () {
    $.getScript("js/conf.js", function() {
        var urlVars = getUrlVars(),
            orderId = urlVars['order_id'],
            inputOrderId = $('#order_id');

        inputOrderId.val(orderId);

        $('#internal').click(export_internal);
    });

});