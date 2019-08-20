from sanic import Sanic
from sanic_jinja2 import SanicJinja2  # pip install sanic_jinja2
from sanic.response import json

app = Sanic()

jinja = SanicJinja2(app)


@app.route('/')
@jinja.template('index.html')  # decorator method is static method
async def index(request):
    return


@app.route('/', methods=['POST'])
@jinja.template('index.html')  # decorator method is static method
async def post_index(request):
    return json(request.form)


# Chú ý là file template luôn phải để trong thư mục templates
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
