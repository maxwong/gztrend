/**
 * Created by maxwong on 2/22/16.
 */

server = 'http://localhost:5000';
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function export_internal() {
    var orderId = $('#order_id').val();
    location.href = server + '/export?order_id=' + orderId;
}

$(document).ready(function () {
    var urlVars = getUrlVars();

    var orderId = urlVars['order_id'];

    var inputOrderId = $('#order_id');

    inputOrderId.val(orderId);

    $('#internal').click(export_internal);
});