from flask import Flask , render_template
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:12345@localhost/prakashblog'
db = SQLAlchemy(app)

#sno,name,email,phone_num,mes,date

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(52), unique=False, nullable=False)
    email = db.Column(db.String(52), unique=True, nullable=False)
    phone_num = db.Column(db.String(15), unique=True, nullable=False)
    mes = db.Column(db.String(120), unique=False, nullable=False)
    date = db.Column(db.String(8), unique=False, nullable=False)


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/post')
def post():
    return render_template('post.html')

@app.route('/about')
def about():
    return render_template('/about.html')

@app.route('/contact',methods=["GET","POST"])
def contact():
    if(request.method =='POST'):
        #Add into databse
        name=request.form.get('name')
        email=request.form.get('email')
        phone_num=request.form.get('phone')
        mes=request.form.get('message')

        entry = Contacts(name=name,email=email,phone_num=phone_num,mes=mes)
        db.session.add(entry)
        db.session.commit()
    return render_template('/contact.html')

if __name__ == "__main__":
    app.run(debug=True)


