/**
 * Created by maxwong on 6/5/16.
 */


function add_section() {
    var section_root = $("#section");

    var sections = $("#section > div");

    var section_html = '<div id="section_<n>"> \
                        <label>模块<n></n></label> \
                        <div><label>名称</label><div><input type="text" id="section_name_<n>"></div></div> \
                        <div><label>描述</label><div><input type="text" id="section_description_<n>"></div></div> \
                        <table id="table_<n>" class="table table-striped"> \
                            <thead> \
                                <tr> \
                                    <th>序号</th> \
                                    <th>项目明细</th> \
                                    <th>规格型号</th> \
                                    <th>品牌或产地</th> \
                                    <th>单位</th> \
                                    <th>数量</th> \
                                    <th>单价(元)</th> \
                                    <th>备注</th> \
                                </tr> \
                            </thead> \
                            <tbody id="tbody_<n>"> \
                            </tbody> \
                        </table> \
                        <button id="add_material_<n>" type="button" class="btn btn-default" onclick="add_material(<n>)">新增物料</button> \
                    </div> \
                    <hr/>';

    target = section_html.replace(/\<n\>/g, sections.length + 1);

    section_root.append(target);
}

function add_material(number) {
    var tbody = $("#tbody_" + number);

    tbody.append('<tr> \
                    <td><input type="text" size="3"></td> \
                    <td><input type="text" size="16"></td> \
                    <td><input type="text" size="20"></td> \
                    <td><input type="text" size="10"></td> \
                    <td><input type="text" size="4"></td> \
                    <td><input type="text" size="3"></td> \
                    <td><input type="text" size="10"></td> \
                    <td><input type="text" size="20"></td> \
        </tr>');

    console.log(number);
}

function submit() {
    var section_elements = $("#section > div");

    var plan = {};
    plan["type"] = $("#plan_type").val().trim();
    plan["name"] = $("#plan_name").val().trim();
    plan["description"] = $("#plan_description").val().trim();
    plan["footer"] = $("#plan_footer").val().trim();
    plan["comments"] = $("#plan_comments").val().trim();
    var sections = [];
    for (var i = 0; i < section_elements.length; ++i) {
        var section_div = section_elements[i];
        var section_data = {};
        var idx = i + 1;

        section_data["name"] = $(section_div).find("#section_name_" + idx).val().trim();
        section_data["description"] = $(section_div).find("#section_description_" + idx).val().trim();

        var trs = $(section_div).find("tbody").children();
        var section_materials = [];

        for (var j = 0; j < trs.length; ++j) {
            var col = $(trs[j]).find("input");
            var material = {};

            material["sequence"] = col[0].value.trim();
            material["name"] = col[1].value.trim();
            material["spec"] = col[2].value.trim();
            material["brand"] = col[3].value.trim();
            material["unit"] = col[4].value.trim();
            material["default_quantity"] = col[5].value.trim();
            material["unit_price"] = col[6].value.trim();
            material["comments"] = col[7].value.trim();

            section_materials.push(material);
        }

        section_data["materials"] = section_materials;
        sections.push(section_data);
    }

    plan["sections"] = sections;

    var param = JSON.stringify(plan);

    $.ajax({
        url: server + '/add',
        method: 'post',
        data: {'data': param},
        success: function(data) {
            console.log('success');
        },
        failed: function(data) {
            console.log('failed');
        }
    });
    console.log(plan);
}