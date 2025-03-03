from flask import Flask
from flask_login import LoginManager
from config.config import Config

app = Flask(__name__)
app.config.from_object(Config)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'auth.login'

from app.routes import auth, posts, media

app.register_blueprint(auth.bp)
app.register_blueprint(posts.bp)
app.register_blueprint(media.bp) 