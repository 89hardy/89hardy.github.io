from flask import Blueprint, request, jsonify, current_app
from flask_login import login_required
import os
from werkzeug.utils import secure_filename
from config.config import Config

bp = Blueprint('media', __name__)

ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@bp.route('/upload', methods=['POST'])
@login_required
def upload_file():
    if 'file' not in request.files:
        return jsonify({'error': 'No file part'}), 400
    
    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        filepath = os.path.join(Config.IMAGES_PATH, filename)
        
        # Create directory if it doesn't exist
        os.makedirs(Config.IMAGES_PATH, exist_ok=True)
        
        file.save(filepath)
        return jsonify({
            'location': f'/assets/images/posts/{filename}',
            'filename': filename
        })
    
    return jsonify({'error': 'File type not allowed'}), 400

@bp.route('/images', methods=['GET'])
@login_required
def list_images():
    images = []
    if os.path.exists(Config.IMAGES_PATH):
        for filename in os.listdir(Config.IMAGES_PATH):
            if allowed_file(filename):
                images.append({
                    'filename': filename,
                    'url': f'/assets/images/posts/{filename}'
                })
    return jsonify(images) 