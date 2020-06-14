from flask import Flask , render_template ,request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from flask_mail import Mail
import json 


with open('config.json','r') as c:
    params=json.load(c)["params"]



local_server =True    
app = Flask(__name__)
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

if __name__ == "__main__":
    app.run(debug=True)


