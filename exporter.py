# -*- coding: utf-8 -*-

import json
import xlwt

class Exporter:
    example = '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":550130,"sections":[{"section_id":1,"name":"_池（Ф2400，15kw）","sequence":1,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":149520,"materials":[{"material_id":1,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":69500,"name":"304不锈钢过滤器(2400)","brand":"广州潮流","spec":"Ф2400","comments":null,"original_price":69500,"discount":1,"final_price":69500},{"material_id":2,"sequence":2,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":9600,"name":"水泵","brand":"上海或广东","spec":"15kw","comments":null,"original_price":9600,"discount":1,"final_price":9600},{"material_id":6,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":6200,"name":"毛发收集器","brand":"广州潮流","spec":"XF4","comments":"304不锈钢材质","original_price":6200,"discount":1,"final_price":6200},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":500,"discount":1,"final_price":500},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":160,"discount":1,"final_price":160},{"material_id":15,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5300,"name":"过滤材料(I)","brand":"国产优质","spec":null,"comments":null,"original_price":5300,"discount":1,"final_price":5300},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":8460,"discount":1,"final_price":8460},{"material_id":20,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":5300,"name":"池体配件(I)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":5300,"discount":1,"final_price":5300},{"material_id":21,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":31000,"name":"机房内配套的管路、阀门(I)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":31000,"discount":1,"final_price":31000},{"material_id":22,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":7800,"name":"控制装置(I)","brand":"广州潮流","spec":null,"comments":null,"original_price":7800,"discount":1,"final_price":7800}]},{"section_id":2,"name":"_池（Ф1800，7.5kw，1个泵）","sequence":2,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":90790,"materials":[{"material_id":24,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":40500,"name":"304不锈钢过滤器(1800)","brand":"广州潮流","spec":"Ф1800","comments":null,"original_price":40500,"discount":1,"final_price":40500},{"material_id":25,"sequence":2,"unit":"台","type":"Q=89m3/Hr,H=16M,N=7.5KW","quantity":1,"is_fixed_amount":false,"unit_price":5100,"name":"水泵","brand":"上海或广东","spec":"7.5kw","comments":"Q=89m3/Hr,H=16M,N=7.5KW","original_price":5100,"discount":1,"final_price":5100},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":4200,"discount":1,"final_price":4200},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":500,"discount":1,"final_price":500},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":160,"discount":1,"final_price":160},{"material_id":30,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2800,"name":"过滤材料(II)","brand":"国产优质","spec":null,"comments":null,"original_price":2800,"discount":1,"final_price":2800},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":1,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":4230,"discount":1,"final_price":4230},{"material_id":31,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":2800,"name":"池体配件(II)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":2800,"discount":1,"final_price":2800},{"material_id":32,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":17000,"name":"机房内配套的管路、阀门(II)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":17000,"discount":1,"final_price":17000},{"material_id":22,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":7800,"name":"控制装置(I)","brand":"广州潮流","spec":null,"comments":null,"original_price":7800,"discount":1,"final_price":7800}]},{"section_id":3,"name":"_池（Ф1800，7.5kw，2个泵）","sequence":3,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":175980,"materials":[{"material_id":24,"sequence":1,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":40500,"name":"304不锈钢过滤器(1800)","brand":"广州潮流","spec":"Ф1800","comments":null,"original_price":81000,"discount":1,"final_price":81000},{"material_id":25,"sequence":2,"unit":"台","type":"Q=89m3/Hr,H=16M,N=7.5KW","quantity":2,"is_fixed_amount":false,"unit_price":5100,"name":"水泵","brand":"上海或广东","spec":"7.5kw","comments":"Q=89m3/Hr,H=16M,N=7.5KW","original_price":10200,"discount":1,"final_price":10200},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":2,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":8400,"discount":1,"final_price":8400},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":5700,"discount":1,"final_price":5700},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":5700,"discount":1,"final_price":5700},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":1000,"discount":1,"final_price":1000},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":320,"discount":1,"final_price":320},{"material_id":30,"sequence":8,"unit":"套","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2800,"name":"过滤材料(II)","brand":"国产优质","spec":null,"comments":null,"original_price":5600,"discount":1,"final_price":5600},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":8460,"discount":1,"final_price":8460},{"material_id":34,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"池体配件(III)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":5800,"discount":1,"final_price":5800},{"material_id":35,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":34000,"name":"机房内配套的管路、阀门(III)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":34000,"discount":1,"final_price":34000},{"material_id":36,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":9800,"name":"控制装置(II)","brand":"广州潮流","spec":null,"comments":null,"original_price":9800,"discount":1,"final_price":9800}]},{"section_id":4,"name":"_池（Ф1600，5.5kw）","sequence":4,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":87320,"materials":[{"material_id":38,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":36500,"name":"不锈钢过滤器(1600)","brand":"广州潮流","spec":"B1600","comments":null,"original_price":36500,"discount":1,"final_price":36500},{"material_id":39,"sequence":2,"unit":"台","type":"Q=50m3/Hr,H=20M,N=5.5KW","quantity":1,"is_fixed_amount":false,"unit_price":5600,"name":"水泵","brand":"上海或广东","spec":"5.5kw","comments":"Q=50m3/Hr,H=20M,N=5.5KW","original_price":5600,"discount":1,"final_price":5600},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":4200,"discount":1,"final_price":4200},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":500,"discount":1,"final_price":500},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":160,"discount":1,"final_price":160},{"material_id":43,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2400,"name":"过滤材料(III)","brand":"国产优质","spec":null,"comments":null,"original_price":2400,"discount":1,"final_price":2400},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":8460,"discount":1,"final_price":8460},{"material_id":44,"sequence":10,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":2500,"name":"池体配件(IV)","brand":"国产优质","spec":null,"comments":"","original_price":2500,"discount":1,"final_price":2500},{"material_id":45,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":14500,"name":"机房内配套的管路、阀门(IV)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":14500,"discount":1,"final_price":14500},{"material_id":46,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6800,"name":"控制装置(III)","brand":"广州潮流","spec":null,"comments":null,"original_price":6800,"discount":1,"final_price":6800}]},{"section_id":5,"name":"_落水池（Ф1200，4.0kw）","sequence":5,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":46520,"materials":[{"material_id":48,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"玻璃纤维过滤器(1200)","brand":"广州潮流","spec":"Ф1200","comments":null,"original_price":5800,"discount":1,"final_price":5800},{"material_id":49,"sequence":2,"unit":"台","type":"Q=45m3/Hr,H=16M,N=4.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3800,"name":"水泵","brand":"上海或广东","spec":"4.0kw","comments":"Q=45m3/Hr,H=16M,N=4.0KW","original_price":3800,"discount":1,"final_price":3800},{"material_id":54,"sequence":3,"unit":"台","type":"304不锈钢材质，采用蒲力德时则不需要","quantity":1,"is_fixed_amount":false,"unit_price":3500,"name":"毛发收集器","brand":"广州潮流","spec":"XF2","comments":"304不锈钢材质，采用蒲力德时则不需要","original_price":3500,"discount":1,"final_price":3500},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":2850,"discount":1,"final_price":2850},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":500,"discount":1,"final_price":500},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":160,"discount":1,"final_price":160},{"material_id":55,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1800,"name":"过滤材料(IV)","brand":"国产优质","spec":null,"comments":null,"original_price":1800,"discount":1,"final_price":1800},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":8460,"discount":1,"final_price":8460},{"material_id":56,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"池体配件(V)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":1500,"discount":1,"final_price":1500},{"material_id":57,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":8800,"name":"机房内配套的管路、阀门(V)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":8800,"discount":1,"final_price":8800},{"material_id":58,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"控制装置(IV)","brand":"广州潮流","spec":null,"comments":null,"original_price":6500,"discount":1,"final_price":6500}]}]}'

    def export_detail(self, order_id):
        offset_row = 0
        offset_col = 0
        file = r'/Users/maxwong/temp/test.xls'

        order = json.JSONDecoder(encoding='utf-8').decode(self.example)

        book = xlwt.Workbook(encoding='utf-8')
        sheet = book.add_sheet('报价')

        cur_row = offset_row
        cur_col = offset_col

        # plan name
        sheet.write(cur_row, cur_col, order['name'])
        cur_row += 1

        # plan description
        sheet.write(cur_row, cur_col, '设备概况')
        cur_row += 1
        sheet.write(cur_row, cur_col, order['description'])
        cur_row += 1

        cur_row += 1

        sheet.write(cur_row, cur_col, '报价详情')
        cur_row += 1

        sections = order['sections']
        for section in sections:
            sheet.write(cur_row, cur_col, section['sequence'].__str__() + ' ' + section['name'])
            cur_row += 1
            sheet.write(cur_row, cur_col, section['description'])
            cur_row += 1

            materials = section['materials']

            self.__write_material_header(sheet, cur_row, cur_col)
            cur_row += 1
            for material in materials:
                sheet.write(cur_row, cur_col, material['sequence'].__str__())
                cur_col += 1

                sheet.write(cur_row, cur_col, material['name'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['spec'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['brand'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['unit'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['quantity'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['unit_price'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['original_price'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['discount'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['final_price'])
                cur_col += 1

                sheet.write(cur_row, cur_col, material['comments'])
                cur_col += 1

                cur_row += 1
                cur_col = offset_col

            sheet.write(cur_row, cur_col, '小计')
            sheet.write(cur_row, cur_col + 2, section['final_price'])
            cur_row += 1

            cur_row += 1

        sheet.write(cur_row, cur_col, u'总计(' + order['footer'] + ')')
        sheet.write(cur_row, cur_col + 2, order['final_price'])

        book.save(file)


    def __write_material_header(self, sheet, offset_row, offset_col):
        cur_row = offset_row
        cur_col = offset_col

        sheet.write(cur_row, cur_col, '序号')
        cur_col += 1

        sheet.write(cur_row, cur_col, '项目明细')
        cur_col += 1

        sheet.write(cur_row, cur_col, '规格型号')
        cur_col += 1

        sheet.write(cur_row, cur_col, '品牌或产地')
        cur_col += 1

        sheet.write(cur_row, cur_col, '单位')
        cur_col += 1

        sheet.write(cur_row, cur_col, '数量')
        cur_col += 1

        sheet.write(cur_row, cur_col, '单价')
        cur_col += 1

        sheet.write(cur_row, cur_col, '总价')
        cur_col += 1

        sheet.write(cur_row, cur_col, '折扣')
        cur_col += 1

        sheet.write(cur_row, cur_col, '合价')
        cur_col += 1

        sheet.write(cur_row, cur_col, '备注')
        cur_col += 1