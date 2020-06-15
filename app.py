from flask import Flask , render_template ,request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json 


with open('config.json','r') as c:
    params=json.load(c)["params"]



local_server =True    
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail_user'],
    MAIL_PASSWORD=params['gmail_pass']
)
mail=Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['production_uri']

db = SQLAlchemy(app)



class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(52), unique=False, nullable=False)
    email = db.Column(db.String(52), unique=False, nullable=False)
    phone_num = db.Column(db.String(15), unique=False, nullable=False)
    mes = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(8), unique=False, nullable=True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30), unique=False, nullable=False)
    slug = db.Column(db.String(100), unique=False, nullable=False)
    content = db.Column(db.String(15000), unique=False, nullable=False)
    date = db.Column(db.String(8), unique=False, nullable=True)
    img_file = db.Column(db.String(30), unique=False, nullable=False)
    tagline = db.Column(db.String(100), unique=False, nullable=False)
    


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,posts=posts)


@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)

@app.route('/about')
def about():
    return render_template('/about.html',params=params)

@app.route('/contact',methods=["GET","POST"])
def contact():
    if(request.method =='POST'):
        #Add into databse
        name=request.form.get('name')
        email=request.form.get('email')
        phone_num=request.form.get('phone')
        mes=request.form.get('message')

        entry = Contacts(name=name,email=email,phone_num=phone_num,mes=mes,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from '+name,sender=email,recipients=[params['gmail_user']],body=mes+"\n"+phone_num )
    return render_template('/contact.html',params=params)

@app.route('/dashboard',methods=["GET","POST"])
def dashboard():
    if ('user' in session and session['user']==params['admin_user']):
         posts=Posts.query.all()
         return render_template('dashboard.html',params=params,posts=posts)
    if request.method=='POST':
        username=request.form.get('uname')
        password=request.form.get('pass')
        if(username==params['admin_user'] and password==params['admin_pass']):
            session['user'] = username 
            posts=Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    return render_template('/login.html',params=params)

@app.route('/edit/<string:sno>',methods=["GET","POST"])
def edit(sno):
    if('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            box_title= request.form.get('title')
            tagline = request.form.get('tagline')
            slug=request.form.get('slug')
            content=request.form.get('content')
            img_file=request.form.get('img')
            date=datetime.now()

            if sno == '0':
                post = Posts(title=box_title,slug=slug,tagline=tagline,content=content,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.slug=slug
                post.tagline=tagline
                post.content=content
                post.img_file=img_file
                post.date=date
                db.session.commit()
                return redirect('/edit/'+sno)
        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post=post)



if __name__ == "__main__":
    app.run(debug=True)


