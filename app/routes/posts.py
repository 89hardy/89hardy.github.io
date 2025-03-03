from flask import Blueprint, render_template, redirect, url_for, request, flash
from flask_login import login_required
import os
import frontmatter
import yaml
from datetime import datetime
import pytz
from config.config import Config

bp = Blueprint('posts', __name__)

def get_all_posts():
    posts = []
    for filename in os.listdir(Config.POSTS_PATH):
        if filename.endswith('.md'):
            filepath = os.path.join(Config.POSTS_PATH, filename)
            with open(filepath, 'r') as f:
                post = frontmatter.load(f)
                post.metadata['filename'] = filename
                posts.append(post)
    return sorted(posts, key=lambda x: x.metadata.get('date', ''), reverse=True)

@bp.route('/posts')
@login_required
def list_posts():
    posts = get_all_posts()
    return render_template('posts/list.html', posts=posts)

@bp.route('/posts/new', methods=['GET', 'POST'])
@login_required
def new_post():
    if request.method == 'POST':
        title = request.form.get('title')
        content = request.form.get('content')
        categories = request.form.get('categories').split(',')
        tags = request.form.get('tags').split(',')
        
        # Clean and format categories and tags
        categories = [cat.strip() for cat in categories if cat.strip()]
        tags = [tag.strip() for tag in tags if tag.strip()]
        
        # Create slug from title
        slug = title.lower().replace(' ', '-')
        date = datetime.now(pytz.timezone('Australia/Melbourne'))
        filename = f"{date.strftime('%Y-%m-%d')}-{slug}.md"
        
        # Create post with frontmatter
        post = frontmatter.Post(
            content,
            title=title,
            date=date,
            categories=categories,
            tags=tags,
            layout='post'
        )
        
        # Save the post
        filepath = os.path.join(Config.POSTS_PATH, filename)
        with open(filepath, 'wb') as f:
            frontmatter.dump(post, f)
        
        flash('Post created successfully!')
        return redirect(url_for('posts.list_posts'))
    
    return render_template('posts/edit.html', post=None)

@bp.route('/posts/<filename>/edit', methods=['GET', 'POST'])
@login_required
def edit_post(filename):
    filepath = os.path.join(Config.POSTS_PATH, filename)
    
    if request.method == 'POST':
        title = request.form.get('title')
        content = request.form.get('content')
        categories = request.form.get('categories').split(',')
        tags = request.form.get('tags').split(',')
        
        # Clean and format categories and tags
        categories = [cat.strip() for cat in categories if cat.strip()]
        tags = [tag.strip() for tag in tags if tag.strip()]
        
        # Update post with frontmatter
        post = frontmatter.Post(
            content,
            title=title,
            categories=categories,
            tags=tags
        )
        
        # Preserve original date and other metadata
        with open(filepath, 'r') as f:
            original = frontmatter.load(f)
            post.metadata['date'] = original.metadata.get('date')
            post.metadata['layout'] = original.metadata.get('layout', 'post')
        
        # Save the updated post
        with open(filepath, 'wb') as f:
            frontmatter.dump(post, f)
        
        flash('Post updated successfully!')
        return redirect(url_for('posts.list_posts'))
    
    # Load existing post for editing
    with open(filepath, 'r') as f:
        post = frontmatter.load(f)
        post.metadata['filename'] = filename
    
    return render_template('posts/edit.html', post=post)

@bp.route('/posts/<filename>/delete', methods=['POST'])
@login_required
def delete_post(filename):
    filepath = os.path.join(Config.POSTS_PATH, filename)
    os.remove(filepath)
    flash('Post deleted successfully!')
    return redirect(url_for('posts.list_posts')) 