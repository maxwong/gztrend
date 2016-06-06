/**
 * Created by maxwong on 6/5/16.
 */


function add_section() {
    var section_root = $("#section");

    var sections = $("#section > div");

    var section_html = '<div id="section_<n>"> \
                        <label>模块<n></n></label> \
                        <div><label>名称</label><div><input type="text" id="section_name_<n>"></div></div> \
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
                            <tbody id="body_<n>"> \
                            </tbody> \
                        </table> \
                        <button id="add_material_<n>" type="button" class="btn btn-default" onclick="add_material(<n>)">新增物料</button> \
                    </div> \
                    <hr/>';

    target = section_html.replace(/\<n\>/g, sections.length + 1);

    section_root.append(target);

    console.log(target);
}

function add_material(number) {
    
    console.log(number);
}

function submit() {
    console.log("submit");
}