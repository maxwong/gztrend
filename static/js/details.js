/**
 * Created by maxwong on 16/1/17.
 */

var details = angular.module('details', []);

function roundTo2(decimal) {
    return Math.round(decimal * 100) / 100;
}

function waitForData(data) {
    if (typeof data == 'undefined') {
        setTimeout(function () {
            waitForData(data);
        }, 100);
    } else {
        return data;
    }
}

details.service('detailsService', function($http, $timeout, $q) {
    var urlVars = getUrlVars();
    var planId = urlVars['plan_id'],
        sectionId = urlVars['section_id'];

    var promise = $http.get(server + '/plan/' + planId + '/details?section_id=' + sectionId)
        .success(function successCallback(response) {
            var data = response.data;
            return data;
        });

    return promise;
});

details.controller('detailsCtrl', function ($scope, detailsService) {

    var urlVars = getUrlVars();
    var planId = urlVars['plan_id'],
        sectionId = urlVars['section_id'];

    var response = null, json = null, param = null;
//    var json = $.parseJSON(dataString.replace(/\r/g, '\\\\r').replace(/\n/g, '\\\\n'));

    $.ajax({
            url: '/plan/' + planId + '/details?section_id=' + sectionId,
            success: function(data) {
                response = data;
                json = $.parseJSON(response.replace(/\r/g, '\\\\r').replace(/\n/g, '\\\\n'));
            },
            failed: function(data) {
                alert('failed');
            }
        });

    detailsService.then(function (response) {
       $scope.plan = response.data;
    });

//    $scope.plan = json;
    $scope.result = {};

    $scope.changeSelect = function (material) {
        material[0].selected_spec = material[material[0].selected_priority].spec;

    };

    $scope.getSectionTotal = function (index) {
        var sectionTotal = 0;
        var section = $scope.plan.sections[index];
        for (var i = 0; i < section.materials.length; ++i) {
            var material = section.materials[i], item = {};
            /*            if (material.length == 1) {
             item = material[0];
             } else {
             item =  material[material[0].selected_priority];
             }*/

            sectionTotal += roundTo2(material[0].final_price);//material.unit_price * material.default_quantity * material.discount;

        }

        return sectionTotal;
    };

    $scope.getPlanTotal = function () {
        var planTotal = 0;

        var plan = $scope.plan;
        if (typeof plan.sections == 'undefined') {
            return;
        }
        for (var i = 0; i < plan.sections.length; ++i) {
            var section = plan.sections[i];

            planTotal += section.final_price;
        }

        return planTotal;
    };


    $scope.submit = function () {
        var result = {}, plan = $scope.plan;

        result.plan_id = plan.plan_id;
        result.description = plan.description;
        result.name = plan.name;
        result.footer = plan.footer;
        result.final_price = plan.final_price;

        var result_sections = [];
        result.sections = result_sections;
        for (var section_count = 0; section_count < plan.sections.length; ++section_count) {
            var section = plan.sections[section_count], result_section = {};
            result_sections.push(result_section);

            result_section.section_id = section.section_id;
            result_section.name = section.name;
            result_section.sequence = section.sequence;
            result_section.layer = section.layer;
            result_section.description = section.description;
            result_section.final_price = section.final_price;

            var result_materials = [];
            result_section.materials = result_materials;
            for (var material_count = 0; material_count < section.materials.length; ++material_count) {
                var material = section.materials[material_count], result_material = {};
                result_materials.push(result_material);
                var item = material[0];
                result_material.material_id = item.material_id;
                result_material.sequence = item.sequence;
                result_material.unit = item.unit;
                result_material.type = item.type;
                result_material.quantity = item.quantity;
                result_material.is_fixed_amount = item.is_fixed_amount;
                result_material.unit_price = item.selected_unit_price;
                result_material.name = item.name;
                result_material.brand = item.brand;
                result_material.spec = item.selected_spec;
                result_material.comments = item.comments;
                result_material.original_price = item.original_price.toFixed(2);
                result_material.discount = item.discount;
                result_material.final_price = item.final_price.toFixed(2);
            }
        }

/*        $.ajax({
            url: server + '/save_order',
            datatype: 'jsonp',
            data: {"order": JSON.stringify(result)},
            jsonp: 'callback',
            jsonpCallback: 'save_order',
            success: function(data) {
                var json = JSON.parse(data);
                var order_id = json.order_id;

                location.href = server + '/export.html?order_id=' + order_id;
            },
            failed: function(data) {
                alert('失败了，请联系管理员哦');
            }
        });*/

        param = encodeURI(JSON.stringify(result));

        $('<form action="save_order" method="POST">' +
            '<input type="hidden" name="order" value="' + param + '">' +
            '</form>').submit();
    };

});
