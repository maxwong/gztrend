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

    var response = null;
    var json = $.parseJSON(dataString.replace(/\r/g, '\\\\r').replace(/\n/g, '\\\\n'));

    $.ajax({
            url: server + '/plan/' + planId + '/details?section_id=' + sectionId,
            datatype: 'jsonp',
            data: {},
            jsonp: 'callback',
            jsonpCallback: 'details',
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

        $.ajax({
            url: server + '/save_order',
            datatype: 'jsonp',
            data: {"order": JSON.stringify(result)},
            jsonp: 'callback',
            jsonpCallback: 'save_order',
            success: function(data) {
                var json = JSON.parse(data);
                var order_id = json.order_id;

                location.href = server + '/export?order_id=' + order_id;
            },
            failed: function(data) {
                alert('失败了，请联系管理员哦');
            }
        });
    };

});


var a = 100;
var dataString = '{"plan_id": "1", "description": "设备概况：\r\n1、304不锈钢过滤器（B2400，B1800，B1600）；\r\n2、304不锈钢毛发收集器；\r\n3、美国米顿罗消毒投药泵；\r\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。", "errcode": 0, "sections": [{"name": "_池（Ф2400，15kw）", "sequence": 1, "layer": 1, "section_id": 1, "description": "水面积_平方米，水深_米，体积_立方米，循环周期约_H", "materials": [[{"material_id": 1, "sequence": 1, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 69500.0, "name": "304不锈钢过滤器(2400)", "brand": "广州潮流", "spec": "Ф2400", "comments": null}], [{"material_id": 2, "sequence": 2, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 9600.0, "name": "水泵", "brand": "上海或广东", "spec": "15kw", "comments": null}, {"material_id": 3, "sequence": 2, "priority": 1, "unit": "台", "type": "15kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 9600.0, "name": "水泵", "brand": "凯泉（上海）", "spec": "KQW125/125-15/2", "comments": "15kw"}, {"material_id": 4, "sequence": 2, "priority": 2, "unit": "台", "type": "15kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 9600.0, "name": "水泵", "brand": "连成（上海）", "spec": "SLW125-125", "comments": "15kw"}, {"material_id": 5, "sequence": 2, "priority": 3, "unit": "台", "type": "15kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 9600.0, "name": "水泵", "brand": "肯富来（广东）", "spec": "GD125-20", "comments": "15kw"}], [{"material_id": 6, "sequence": 3, "priority": 0, "unit": "台", "type": "304不锈钢材质", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 6200.0, "name": "毛发收集器", "brand": "广州潮流", "spec": "XF4", "comments": "304不锈钢材质"}], [{"material_id": 7, "sequence": 4, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 8, "sequence": 4, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 9, "sequence": 4, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 10, "sequence": 5, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 11, "sequence": 5, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 12, "sequence": 5, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 13, "sequence": 6, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 250.0, "name": "投药架", "brand": "广州潮流", "spec": null, "comments": null}], [{"material_id": 14, "sequence": 7, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 80.0, "name": "药桶", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 15, "sequence": 8, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5300.0, "name": "过滤材料(I)", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 16, "sequence": 9, "priority": 0, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": "上海或广东", "spec": "1.5kw", "comments": "1.5kw"}, {"material_id": 17, "sequence": 9, "priority": 1, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ/D242-1.5", "comments": "1.5kw"}, {"material_id": 18, "sequence": 9, "priority": 2, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ15-16-1.5", "comments": "1.5kw"}, {"material_id": 19, "sequence": 9, "priority": 3, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50QW18-15-1.5", "comments": "1.5kw"}], [{"material_id": 20, "sequence": 10, "priority": 0, "unit": "批", "type": "给水口、回水口、池底隔栅", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5300.0, "name": "池体配件(I)", "brand": "国产优质", "spec": null, "comments": "给水口、回水口、池底隔栅"}], [{"material_id": 21, "sequence": 11, "priority": 0, "unit": "套", "type": "UPVC、铸铁阀门", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 31000.0, "name": "机房内配套的管路、阀门(I)", "brand": "台塑", "spec": null, "comments": "UPVC、铸铁阀门"}], [{"material_id": 22, "sequence": 12, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 7800.0, "name": "控制装置(I)", "brand": "广州潮流", "spec": null, "comments": null}]]}, {"name": "_池（Ф1800，7.5kw，1个泵）", "sequence": 2, "layer": 1, "section_id": 2, "description": "水面积_平方米，水深_米，体积_立方米，循环周期约_H", "materials": [[{"material_id": 24, "sequence": 1, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 40500.0, "name": "304不锈钢过滤器(1800)", "brand": "广州潮流", "spec": "Ф1800", "comments": null}], [{"material_id": 25, "sequence": 2, "priority": 0, "unit": "台", "type": "Q=89m3/Hr,H=16M,N=7.5KW", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "上海或广东", "spec": "7.5kw", "comments": "Q=89m3/Hr,H=16M,N=7.5KW"}, {"material_id": 26, "sequence": 2, "priority": 1, "unit": "台", "type": "7.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "凯泉（上海）", "spec": "KQW100/110-7.5/2", "comments": "7.5kw"}, {"material_id": 27, "sequence": 2, "priority": 2, "unit": "台", "type": "7.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "连成（上海）", "spec": "SLW100-125A", "comments": "7.5kw"}, {"material_id": 28, "sequence": 2, "priority": 3, "unit": "台", "type": "7.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "肯富来（广东）", "spec": "GD100-19", "comments": "7.5kw"}], [{"material_id": 29, "sequence": 3, "priority": 0, "unit": "台", "type": "304不锈钢材质", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4200.0, "name": "毛发收集器", "brand": "广州潮流", "spec": "XF3", "comments": "304不锈钢材质"}], [{"material_id": 7, "sequence": 4, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 8, "sequence": 4, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 9, "sequence": 4, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 10, "sequence": 5, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 11, "sequence": 5, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 12, "sequence": 5, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 13, "sequence": 6, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 250.0, "name": "投药架", "brand": "广州潮流", "spec": null, "comments": null}], [{"material_id": 14, "sequence": 7, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 80.0, "name": "药桶", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 30, "sequence": 8, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2800.0, "name": "过滤材料(II)", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 16, "sequence": 9, "priority": 0, "unit": "台", "type": "1.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": "上海或广东", "spec": "1.5kw", "comments": "1.5kw"}, {"material_id": 17, "sequence": 9, "priority": 1, "unit": "台", "type": "1.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ/D242-1.5", "comments": "1.5kw"}, {"material_id": 18, "sequence": 9, "priority": 2, "unit": "台", "type": "1.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ15-16-1.5", "comments": "1.5kw"}, {"material_id": 19, "sequence": 9, "priority": 3, "unit": "台", "type": "1.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50QW18-15-1.5", "comments": "1.5kw"}], [{"material_id": 31, "sequence": 10, "priority": 0, "unit": "批", "type": "给水口、回水口、池底隔栅", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2800.0, "name": "池体配件(II)", "brand": "国产优质", "spec": null, "comments": "给水口、回水口、池底隔栅"}], [{"material_id": 32, "sequence": 11, "priority": 0, "unit": "套", "type": "UPVC、铸铁阀门", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 17000.0, "name": "机房内配套的管路、阀门(II)", "brand": "台塑", "spec": null, "comments": "UPVC、铸铁阀门"}], [{"material_id": 22, "sequence": 12, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 7800.0, "name": "控制装置(I)", "brand": "广州潮流", "spec": null, "comments": null}]]}, {"name": "_池（Ф1800，7.5kw，2个泵）", "sequence": 3, "layer": 1, "section_id": 3, "description": "水面积_平方米，水深_米，体积_立方米，循环周期约_H", "materials": [[{"material_id": 24, "sequence": 1, "priority": 0, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 40500.0, "name": "304不锈钢过滤器(1800)", "brand": "广州潮流", "spec": "Ф1800", "comments": null}], [{"material_id": 25, "sequence": 2, "priority": 0, "unit": "台", "type": "Q=89m3/Hr,H=16M,N=7.5KW", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "上海或广东", "spec": "7.5kw", "comments": "Q=89m3/Hr,H=16M,N=7.5KW"}, {"material_id": 26, "sequence": 2, "priority": 1, "unit": "台", "type": "7.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "凯泉（上海）", "spec": "KQW100/110-7.5/2", "comments": "7.5kw"}, {"material_id": 27, "sequence": 2, "priority": 2, "unit": "台", "type": "7.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "连成（上海）", "spec": "SLW100-125A", "comments": "7.5kw"}, {"material_id": 28, "sequence": 2, "priority": 3, "unit": "台", "type": "7.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 5100.0, "name": "水泵", "brand": "肯富来（广东）", "spec": "GD100-19", "comments": "7.5kw"}], [{"material_id": 29, "sequence": 3, "priority": 0, "unit": "台", "type": "304不锈钢材质", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4200.0, "name": "毛发收集器", "brand": "广州潮流", "spec": "XF3", "comments": "304不锈钢材质"}], [{"material_id": 7, "sequence": 4, "priority": 0, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 8, "sequence": 4, "priority": 1, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 9, "sequence": 4, "priority": 2, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 10, "sequence": 5, "priority": 0, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 11, "sequence": 5, "priority": 1, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 12, "sequence": 5, "priority": 2, "unit": "台", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 13, "sequence": 6, "priority": 0, "unit": "个", "type": null, "default_quantity": 4, "is_fixed_amount": false, "unit_price": 250.0, "name": "投药架", "brand": "广州潮流", "spec": null, "comments": null}], [{"material_id": 14, "sequence": 7, "priority": 0, "unit": "个", "type": null, "default_quantity": 4, "is_fixed_amount": false, "unit_price": 80.0, "name": "药桶", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 30, "sequence": 8, "priority": 0, "unit": "套", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 2800.0, "name": "过滤材料(II)", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 16, "sequence": 9, "priority": 0, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": "上海或广东", "spec": "1.5kw", "comments": "1.5kw"}, {"material_id": 17, "sequence": 9, "priority": 1, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ/D242-1.5", "comments": "1.5kw"}, {"material_id": 18, "sequence": 9, "priority": 2, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ15-16-1.5", "comments": "1.5kw"}, {"material_id": 19, "sequence": 9, "priority": 3, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50QW18-15-1.5", "comments": "1.5kw"}], [{"material_id": 34, "sequence": 10, "priority": 0, "unit": "批", "type": "给水口、回水口、池底隔栅", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5800.0, "name": "池体配件(III)", "brand": "国产优质", "spec": null, "comments": "给水口、回水口、池底隔栅"}], [{"material_id": 35, "sequence": 11, "priority": 0, "unit": "套", "type": "UPVC、铸铁阀门", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 34000.0, "name": "机房内配套的管路、阀门(III)", "brand": "台塑", "spec": null, "comments": "UPVC、铸铁阀门"}], [{"material_id": 36, "sequence": 12, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 9800.0, "name": "控制装置(II)", "brand": "广州潮流", "spec": null, "comments": null}]]}, {"name": "_池（Ф1600，5.5kw）", "sequence": 4, "layer": 1, "section_id": 4, "description": "水面积_平方米，水深_米，体积_立方米，循环周期约_H", "materials": [[{"material_id": 38, "sequence": 1, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 36500.0, "name": "不锈钢过滤器(1600)", "brand": "广州潮流", "spec": "B1600", "comments": null}], [{"material_id": 39, "sequence": 2, "priority": 0, "unit": "台", "type": "Q=50m3/Hr,H=20M,N=5.5KW", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5600.0, "name": "水泵", "brand": "上海或广东", "spec": "5.5kw", "comments": "Q=50m3/Hr,H=20M,N=5.5KW"}, {"material_id": 40, "sequence": 2, "priority": 1, "unit": "台", "type": "5.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5600.0, "name": "水泵", "brand": "凯泉（上海）", "spec": "KQW100/250-5.5/4", "comments": "5.5kw"}, {"material_id": 41, "sequence": 2, "priority": 2, "unit": "台", "type": "5.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5600.0, "name": "水泵", "brand": "连成（上海）", "spec": "SLWD100-250", "comments": "5.5kw"}, {"material_id": 42, "sequence": 2, "priority": 3, "unit": "台", "type": "5.5kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5600.0, "name": "水泵", "brand": "肯富来（广东）", "spec": "GD100-21", "comments": "5.5kw"}], [{"material_id": 29, "sequence": 3, "priority": 0, "unit": "台", "type": "304不锈钢材质", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 4200.0, "name": "毛发收集器", "brand": "广州潮流", "spec": "XF3", "comments": "304不锈钢材质"}], [{"material_id": 7, "sequence": 4, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 8, "sequence": 4, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 9, "sequence": 4, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 10, "sequence": 5, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 11, "sequence": 5, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 12, "sequence": 5, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 13, "sequence": 6, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 250.0, "name": "投药架", "brand": "广州潮流", "spec": null, "comments": null}], [{"material_id": 14, "sequence": 7, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 80.0, "name": "药桶", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 43, "sequence": 8, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2400.0, "name": "过滤材料(III)", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 16, "sequence": 9, "priority": 0, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": "上海或广东", "spec": "1.5kw", "comments": "1.5kw"}, {"material_id": 17, "sequence": 9, "priority": 1, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ/D242-1.5", "comments": "1.5kw"}, {"material_id": 18, "sequence": 9, "priority": 2, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ15-16-1.5", "comments": "1.5kw"}, {"material_id": 19, "sequence": 9, "priority": 3, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50QW18-15-1.5", "comments": "1.5kw"}], [{"material_id": 44, "sequence": 10, "priority": 0, "unit": "批", "type": "", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2500.0, "name": "池体配件(IV)", "brand": "国产优质", "spec": null, "comments": ""}], [{"material_id": 45, "sequence": 11, "priority": 0, "unit": "套", "type": "UPVC、铸铁阀门", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 14500.0, "name": "机房内配套的管路、阀门(IV)", "brand": "台塑", "spec": null, "comments": "UPVC、铸铁阀门"}], [{"material_id": 46, "sequence": 12, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 6800.0, "name": "控制装置(III)", "brand": "广州潮流", "spec": null, "comments": null}]]}, {"name": "_落水池（Ф1200，4.0kw）", "sequence": 5, "layer": 1, "section_id": 5, "description": "水面积_平方米，水深_米，体积_立方米，循环周期约_H", "materials": [[{"material_id": 48, "sequence": 1, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 5800.0, "name": "玻璃纤维过滤器(1200)", "brand": "广州潮流", "spec": "Ф1200", "comments": null}], [{"material_id": 49, "sequence": 2, "priority": 0, "unit": "台", "type": "Q=45m3/Hr,H=16M,N=4.0KW", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3800.0, "name": "水泵", "brand": "上海或广东", "spec": "4.0kw", "comments": "Q=45m3/Hr,H=16M,N=4.0KW"}, {"material_id": 50, "sequence": 2, "priority": 1, "unit": "台", "type": "4.0kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3800.0, "name": "水泵", "brand": "凯泉（上海）", "spec": "KQW80/110-4/2", "comments": "4.0kw"}, {"material_id": 51, "sequence": 2, "priority": 2, "unit": "台", "type": "4.0kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3800.0, "name": "水泵", "brand": "连成（上海）", "spec": "SLW80-125A", "comments": "4.0kw"}, {"material_id": 52, "sequence": 2, "priority": 3, "unit": "台", "type": "4.0kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3800.0, "name": "水泵", "brand": "肯富来（广东）", "spec": "GD80-21", "comments": "4.0kw"}, {"material_id": 53, "sequence": 2, "priority": 4, "unit": "台", "type": "4.0kw", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3800.0, "name": "水泵", "brand": "蒲力德", "spec": "5.0HP（380V）", "comments": "4.0kw"}], [{"material_id": 54, "sequence": 3, "priority": 0, "unit": "台", "type": "304不锈钢材质，采用蒲力德时则不需要", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 3500.0, "name": "毛发收集器", "brand": "广州潮流", "spec": "XF2", "comments": "304不锈钢材质，采用蒲力德时则不需要"}], [{"material_id": 7, "sequence": 4, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 8, "sequence": 4, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 9, "sequence": 4, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "絮凝系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 10, "sequence": 5, "priority": 0, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "米顿罗", "spec": "P066-Y", "comments": null}, {"material_id": 11, "sequence": 5, "priority": 1, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "蓝白", "spec": "C-660P", "comments": null}, {"material_id": 12, "sequence": 5, "priority": 2, "unit": "台", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 2850.0, "name": "消毒系统", "brand": "赛高", "spec": "AKL-800", "comments": null}], [{"material_id": 13, "sequence": 6, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 250.0, "name": "投药架", "brand": "广州潮流", "spec": null, "comments": null}], [{"material_id": 14, "sequence": 7, "priority": 0, "unit": "个", "type": null, "default_quantity": 2, "is_fixed_amount": false, "unit_price": 80.0, "name": "药桶", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 55, "sequence": 8, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 1800.0, "name": "过滤材料(IV)", "brand": "国产优质", "spec": null, "comments": null}], [{"material_id": 16, "sequence": 9, "priority": 0, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": "上海或广东", "spec": "1.5kw", "comments": "1.5kw"}, {"material_id": 17, "sequence": 9, "priority": 1, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ/D242-1.5", "comments": "1.5kw"}, {"material_id": 18, "sequence": 9, "priority": 2, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50WQ15-16-1.5", "comments": "1.5kw"}, {"material_id": 19, "sequence": 9, "priority": 3, "unit": "台", "type": "1.5kw", "default_quantity": 2, "is_fixed_amount": false, "unit_price": 4230.0, "name": "机房排污泵", "brand": null, "spec": "50QW18-15-1.5", "comments": "1.5kw"}], [{"material_id": 56, "sequence": 10, "priority": 0, "unit": "批", "type": "给水口、回水口、池底隔栅", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 1500.0, "name": "池体配件(V)", "brand": "国产优质", "spec": null, "comments": "给水口、回水口、池底隔栅"}], [{"material_id": 57, "sequence": 11, "priority": 0, "unit": "套", "type": "UPVC、铸铁阀门", "default_quantity": 1, "is_fixed_amount": false, "unit_price": 8800.0, "name": "机房内配套的管路、阀门(V)", "brand": "台塑", "spec": null, "comments": "UPVC、铸铁阀门"}], [{"material_id": 58, "sequence": 12, "priority": 0, "unit": "套", "type": null, "default_quantity": 1, "is_fixed_amount": false, "unit_price": 6500.0, "name": "控制装置(IV)", "brand": "广州潮流", "spec": null, "comments": null}]]}], "comments": "", "section_relation": "pick_one", "name": "水处理设备", "msg": "ok", "footer": "小计（不含机房外的管道、阀门）"}';

