# -*- coding: utf-8 -*-
from sqlalchemy import create_engine, pool
from sqlalchemy.orm import sessionmaker

from dao_model import Plan, Section, SectionMaterial, Material, Base, Order

from exporter import Exporter

import logging
import json
import traceback

db_engine = create_engine('mysql+pymysql://root:123@localhost:3306/gztrend?charset=utf8mb4', encoding='utf8', echo=True,
                          pool_size=4)
Base.metadata.bind = db_engine
db_session = sessionmaker(bind=db_engine)


class InfraService:
    def __init__(self):
        logging.basicConfig()
        logging.getLogger('sqlalchemy.engine').setLevel(logging.INFO)

    def add_plan(self, data):
        session = db_session()

        plan_data = json.loads(s=data, encoding='utf8')

        try:
            # insert plan
            plan = Plan()
            plan.name = plan_data['name'].strip()
            plan.description = plan_data['description'].strip()
            plan.footer = plan_data['footer'].strip()
            plan.comments = plan_data['comments'].strip()
            plan.type = plan_data['type'].strip()
            plan.status = 1

            session.add(plan)
            session.flush()

            plan_id = plan.plan_id

            sections_data = plan_data['sections']

            section_idx = 1
            # adding sections
            for section_data in sections_data:
                new_section = Section()
                new_section.plan_id = plan_id
                new_section.description = section_data['description'].strip()
                new_section.layer = 1
                new_section.sequence = section_idx
                new_section.name = section_data['name'].strip()
                new_section.status = 1

                session.add(new_section)
                session.flush()

                materials_data = section_data['materials']
                priorities_dict = {}

                # adding materials to section
                for material_data in materials_data:
                    material_name = material_data['name'].upper().strip()
                    material_spec = material_data['spec'].upper().strip()
                    material_brand = material_data['brand'].upper().strip()
                    material_unit = material_data['unit'].upper().strip()
                    material_unit_price = material_data['unit_price'].strip()
                    material_comments = material_data['comments'].strip()

                    material = session.query(Material).filter(Material.name == material_name,
                                                              Material.spec == material_spec,
                                                              Material.brand == material_brand,
                                                              Material.unit == material_unit,
                                                              Material.unit_price == material_unit_price,
                                                              Material.comments == material_comments,
                                                              Material.status == 1).first()

                    if material is None:
                        material = Material()
                        material.name = material_name
                        material.spec = material_spec
                        material.brand = material_brand
                        material.unit = material_unit
                        material.unit_price = material_unit_price
                        material.comments = material_comments

                        session.add(material)
                        session.flush()

                    sequence = material_data['sequence']
                    section_material = SectionMaterial()
                    section_material.section_id = new_section.section_id
                    section_material.material_id = material.material_id
                    section_material.sequence = sequence
                    section_material.default_quantity = material_data['default_quantity']

                    if priorities_dict.has_key(sequence) is False:
                        priorities_dict[sequence] = 0

                    priority = priorities_dict[sequence]

                    section_material.priority = priority
                    priorities_dict[sequence] = priority + 1

                    section_material.is_fixed_amount = 0
                    section_material.status = 1

                    session.add(section_material)
                    session.flush()

            session.commit()
        except Exception:
            traceback.print_exc()
            session.rollback()

        print data
        return

    def get_plan_summary(self):
        session = db_session()
        plans = session.query(Plan).all()

        result = []
        for plan in plans:
            cur_summary = dict()
            cur_summary['plan_id'] = plan.plan_id
            cur_summary['name'] = plan.name
            result.append(cur_summary)

        return result

    def get_sections(self, plan_id):
        session = db_session()
        result = dict()

        if plan_id is None:
            result['errcode'] = 1
            result['msg'] = 'plan_id is None'

        plan = session.query(Plan).filter(Plan.plan_id == plan_id).one()

        result['name'] = plan.name
        result['section_relation'] = plan.section_relation
        result['description'] = plan.description
        result['footer'] = plan.footer
        result['comments'] = plan.comments
        sections = session.query(Section).filter(Section.plan_id == plan_id).all()

        section_list = list()
        for section in sections:
            section_info = dict()
            section_info['section_id'] = section.section_id
            section_info['name'] = section.name
            section_info['sequence'] = section.sequence

            section_list.append(section_info)

        result['sections'] = section_list
        return result

    def get_details(self, plan_id, section_ids):
        session = db_session()
        result = dict()

        if plan_id is None:
            result['errcode'] = 1
            result['msg'] = 'plan_id is None'

        if section_ids is None:
            result['errcode'] = 2
            result['msg'] = 'section_ids is None'

        plan = session.query(Plan).filter(Plan.plan_id == plan_id).one()

        result['plan_id'] = plan_id
        result['name'] = plan.name
        result['section_relation'] = plan.section_relation
        result['description'] = plan.description
        result['footer'] = plan.footer
        result['comments'] = plan.comments

        section_results = list()
        result['sections'] = section_results

        sections = session.query(Section).order_by(Section.sequence).filter(Section.section_id.in_(section_ids)).all()

        for section in sections:
            # get session_materials per section
            section_materials = session.query(SectionMaterial) \
                .order_by(SectionMaterial.sequence.asc(), SectionMaterial.priority.asc()) \
                .filter(SectionMaterial.section_id == section.section_id).all()

            # construct material_ids to get concrete materials
            material_ids = list()
            for section_material in section_materials:
                material_ids.append(section_material.material_id)

            materials = session.query(Material).filter(Material.material_id.in_(material_ids)).all()
            material_results = list()
            material_tmp_dict = dict()  # dict to put material info instances

            material_grouped_dict = dict()

            # 1st stage: adding material info itself
            for material in materials:
                material_result = dict()
                material_tmp_dict[material.material_id] = material_result

                material_result['material_id'] = material.material_id
                material_result['name'] = material.name
                material_result['type'] = material.comments
                material_result['spec'] = material.spec
                material_result['brand'] = material.brand
                material_result['unit'] = material.unit
                material_result['unit_price'] = material.unit_price
                material_result['comments'] = material.comments

            max_sequence = 0
            # 2nd stage: adding section-related info
            for section_material in section_materials:
                sequence = section_material.sequence
                material_result = material_tmp_dict[section_material.material_id]
                material_result['is_fixed_amount'] = section_material.is_fixed_amount
                material_result['priority'] = section_material.priority
                material_result['sequence'] = sequence
                material_result['default_quantity'] = section_material.default_quantity

                if sequence not in material_grouped_dict:
                    material_grouped_dict[sequence] = list()
                    if sequence > max_sequence:
                        max_sequence = sequence

                material_grouped_dict[sequence].append(material_result)

            for i in range(1, max_sequence + 1):
                material_results.append(material_grouped_dict[i])

            # adding section info
            section_result = dict()
            section_result['section_id'] = section.section_id
            section_result['name'] = section.name
            section_result['sequence'] = section.sequence
            section_result['description'] = section.description
            section_result['layer'] = section.layer
            section_result['materials'] = material_results

            section_results.append(section_result)

        result['errcode'] = 0
        result['msg'] = 'ok'
        return result

    def save_order(self, content):
        session = db_session()
        order = Order()
        order.content = content

        session.add(order)

        session.commit()

        return order.order_id

    def export_detail(self, order_id):
        session = db_session()
        order = session.query(Order).filter(Order.order_id == order_id).one()

        exporter = Exporter()
        output = exporter.export_detail(order.content, order.order_id.__str__() + '_内部版')

        return output

    def export_summary(self, order_id):
        session = db_session()
        return

    def run(self):
        session = db_session()
        plan = session.query(Plan).one()
        return plan
