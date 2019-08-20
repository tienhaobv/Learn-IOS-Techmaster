from sanic import Sanic
from sanic_jinja2 import SanicJinja2
from sanic.response import json

app = Sanic()

jinja = SanicJinja2(app)

movies = [
    {"id": 1, "title": "Gone with wind"},
    {"id": 2, "title": "Về nhà đi con"},
    {"id": 3, "title": "Người nhện xa nhà"},
]


@app.route('/')
@jinja.template('index.html')
async def index(request):
    return


@app.route('/movies/all')
async def get_movie(request):
    return json(movies)


@app.route('/movies')
async def get_movie(request):
    print(request.args["id"][0])
    print(request.query_args)
    return json(request.args)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
