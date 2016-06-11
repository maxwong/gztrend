# -*- coding: utf-8 -*-
import json
import urllib

from flask import Flask, request, send_from_directory, send_file, redirect, url_for
from infra_service import InfraService
from exporter import Exporter

app = Flask(__name__, static_url_path='')


@app.route('/add', methods=['POST'])
def add_plan():
    infra_service = InfraService()
    data = urllib.unquote(request.form['data'])

    result = infra_service.add_plan(data)

    return 'hello'


@app.route('/plan', methods=['GET'])
def get_plan():
    infra_service = InfraService()
    summary = infra_service.get_plan_summary()
    return json.dumps(summary, ensure_ascii=False)


@app.route('/plan/<plan_id>/sections', methods=['GET', 'POST'])
def get_sections(plan_id):
    infra_service = InfraService()

    result = infra_service.get_sections(plan_id)

    return json.dumps(result, ensure_ascii=False)


@app.route('/plan/<plan_id>/details', methods=['GET', 'POST'])
def get_details(plan_id):
    infra_service = InfraService()

    request_section = request.args.get('section_id')

    try:
        section_ids = request_section.split(',')
        result = infra_service.get_details(plan_id, section_ids)
    except AttributeError:
        result = dict()
        result['errcode'] = 2
        result['msg'] = 'section_ids is None'

    return json.dumps(result, ensure_ascii=False)


@app.route('/save_order', methods=['GET', 'POST'])
def save_order():
    infra_service = InfraService()
    raw_order = request.form['order']

    decoded_order = urllib.unquote(raw_order.__str__())

    order_id = infra_service.save_order(decoded_order)

    host = request.args.get('request_uri')

    result = dict()

    result['url'] = request.host_url + 'export.html?order_id=' + order_id.__str__()
    return json.dumps(result, ensure_ascii=False)


@app.route('/export', methods=['GET', 'POST'])
def export():
    order_id = request.args.get('order_id')
    infra_service = InfraService()

    output = infra_service.export_detail(order_id)

    return send_file(output, as_attachment=True)
#    return 'done'


@app.route('/')
def hello_world():
    return app.send_static_file('index.html')


@app.route('/<path:path>')
def send_static_resources(path):
    return send_from_directory('', path)


if __name__ == '__main__':
    app.debug=True
    app.run()
