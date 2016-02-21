import json

from flask import Flask, request, send_from_directory

from infra_service import InfraService
from exporter import Exporter

app = Flask(__name__, static_url_path='')


@app.route('/plan', methods=['GET'])
def get_plan():
    infra_service = InfraService()
    summary = infra_service.get_plan_summary()
    return json.dumps(summary, ensure_ascii=False)


@app.route('/plan/<plan_id>/section', methods=['GET', 'POST'])
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


@app.route('/save', methods=['GET', 'POST'])
def save_quotation():
    return 'save'


@app.route('/export', methods=['GET', 'POST'])
def export():
    exporter = Exporter()

    exporter.export_detail(1)

    return 'done'


@app.route('/')
def hello_world():
    return app.send_static_file('section_selection.html')


@app.route('/<path:path>')
def send_static_resources(path):
    return send_from_directory('', path)


if __name__ == '__main__':
    app.debug=True
    app.run()
