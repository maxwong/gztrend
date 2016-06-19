# -*- coding: utf-8 -*-

import json

import xlwt


class Exporter:

    offset_row = 0
    offset_col = 0
#    output_dir = r'/home/maxwong/temp/'
    output_dir = r'/Users/maxwong/temp/'

    def __init__(self):
        self.default_max_col = 11

        self.style_border_top = xlwt.easyxf("borders: top thin")
        self.style_border_bottom = xlwt.easyxf("borders: bottom thin")
        self.style_border_left = xlwt.easyxf("borders: left thin")
        self.style_border_right = xlwt.easyxf("borders: right thin")

        self.style_plan_name = xlwt.easyxf("borders: top thin, bottom thin, left thin, right thin; align: horiz centre, wrap on;")
        self.style_row_start = xlwt.easyxf("borders: left thin, bottom thin;")
        self.style_row_empty_cell = xlwt.easyxf("borders: bottom thin;")
        self.style_row_end = xlwt.easyxf("borders: right thin, bottom thin;")

        self.style_description = xlwt.easyxf("borders: left thin, right thin, bottom thin; align: wrap on;")

        material_borders = 'borders: left thin, right thin, bottom thin;'
        align_left_with_wrap = 'align: horiz left, wrap on;'
        align_centre_with_wrap = 'align: horiz centre, wrap on;'
        align_right_with_wrap = 'align: horiz right, wrap on;'

        self.style_material_header = xlwt.easyxf(align_centre_with_wrap + material_borders)

        self.style_material_left = xlwt.easyxf(align_left_with_wrap + material_borders)
        self.style_material_centre = xlwt.easyxf(align_centre_with_wrap + material_borders)
        self.style_material_right = xlwt.easyxf(align_right_with_wrap + material_borders)

    def export_detail(self, content, file_name):
        file = self.output_dir + file_name + '.xls'

        order = json.JSONDecoder(encoding='utf-8').decode(content)

        book = xlwt.Workbook(encoding='utf-8')
        sheet = book.add_sheet('报价')

        sheet.col(0).width = 256 * 5
        sheet.col(1).width = 256 * 16
        sheet.col(2).width = 256 * 12
        sheet.col(3).width = 256 * 12
        sheet.col(4).width = 256 * 6
        sheet.col(5).width = 256 * 6
        sheet.col(10).width = 256 * 20

        cur_row = self.offset_row
        cur_col = self.offset_col

        # plan name
        sheet.write_merge(0, 0, 0, self.default_max_col - 1, order['name'], style=self.style_plan_name)
        cur_row += 1

        # plan description
        sheet.write(cur_row, cur_col, 'a. 设备概况', self.style_row_start)
        cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)
        sheet.write_merge(cur_row, cur_row, 0, self.default_max_col - 1, order['description'], self.style_description)
        sheet.row(cur_row).height = 256 * 16
        cur_row += 1

        cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)

        sheet.write(cur_row, cur_col, 'b. 报价详情', self.style_row_start)
        cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)

        sections = order['sections']
        for section in sections:
            sheet.write(cur_row, cur_col, section['sequence'].__str__() + '. ' + section['name'], self.style_row_start)
            cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)

            sheet.write(cur_row, cur_col, section['description'], self.style_row_start)
            cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)

            materials = section['materials']

            self.__write_material_header(sheet, cur_row, cur_col)
            cur_row += 1
            for material in materials:
                sheet.write(cur_row, cur_col, material['sequence'].__str__(), self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['name'], self.style_material_left)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['spec'], self.style_material_centre)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['brand'], self.style_material_centre)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['unit'], self.style_material_centre)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['quantity'], self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['unit_price'], self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['original_price'], self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['discount'], self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['final_price'], self.style_material_right)
                cur_col += 1

                sheet.write(cur_row, cur_col, material['comments'], self.style_material_left)

                cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)


            cur_row, cur_col = self.__write_total_row(sheet, cur_row, '小计', section['final_price'])

            cur_row, cur_col = self.__row_complete(sheet, cur_row, cur_col)

        cur_row, cur_col = self.__write_total_row(sheet, cur_row, u'总计(' + order['footer'] + ')', order['final_price'])

        book.save(file)

        return file

    def __write_material_header(self, sheet, offset_row, offset_col):
        cur_row = offset_row
        cur_col = offset_col

        sheet.write(cur_row, cur_col, '序号', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '项目明细', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '规格型号', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '品牌或产地', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '单位', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '数量', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '单价', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '总价', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '折扣', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '合价', self.style_material_header)
        cur_col += 1

        sheet.write(cur_row, cur_col, '备注', self.style_material_header)
        cur_col += 1

    def __row_complete(self, sheet, cur_row, cur_col):
        try:
            if cur_col == 0:
                sheet.write(cur_row, cur_col, '', self.style_row_start)
            if cur_col == self.default_max_col - 1:
                return cur_row + 1, self.offset_col
        except:
            None


        while (cur_col < self.default_max_col - 2):
            cur_col += 1
            sheet.write(cur_row, cur_col, '', self.style_row_empty_cell)
        sheet.write(cur_row, cur_col + 1, '', self.style_row_end)

        return cur_row + 1, self.offset_col

    def __write_total_row(self, sheet, cur_row, hint, total_price):
        cur_col = self.offset_col

        sheet.write(cur_row, cur_col, '', self.style_row_start)
        cur_col += 1

        sheet.write(cur_row, cur_col, hint, self.style_border_bottom)

        while (cur_col < self.default_max_col - 2):
            cur_col += 1
            sheet.write(cur_row, cur_col, '', self.style_row_empty_cell)

        cur_col += 1
        sheet.write(cur_row, cur_col, total_price, self.style_row_end)

        return cur_row + 1, self.offset_col
