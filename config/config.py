import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-key-please-change'
    BLOG_PATH = os.environ.get('BLOG_PATH') or '../89hardy.github.io'
    POSTS_PATH = os.path.join(BLOG_PATH, '_posts')
    IMAGES_PATH = os.path.join(BLOG_PATH, 'assets/images/posts')
    GITHUB_TOKEN = os.environ.get('GITHUB_TOKEN')
    GITHUB_USERNAME = os.environ.get('GITHUB_USERNAME')
    GITHUB_REPO = os.environ.get('GITHUB_REPO') or '89hardy/89hardy.github.io' 