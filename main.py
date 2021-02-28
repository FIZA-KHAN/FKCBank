from flask import Flask, render_template, request, session, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
import json 
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:@localhost/bank"

db = SQLAlchemy(app)

class Customers(db.Model):
    #customer_id, fname, lname, email, phone, current_balance, gender, city
    customer_id = db.Column(db.Integer, primary_key=True)
    fname = db.Column(db.String(80), nullable=False)
    lname = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    current_balance = db.Column(db.Integer, nullable=False)
    gender = db.Column(db.Integer, nullable=False)
    city = db.Column(db.String(20), nullable=False)

class Transaction(db.Model):
    customer_id = db.Column(db.Integer, primary_key=True)
    sender_name = db.Column(db.String(80), nullable=False)
    receiver_name = db.Column(db.String(80), nullable=False)
    amount = db.Column(db.Integer, nullable=False)
    date = db.Column(db.String(12))

@app.route('/')
def home():
    return(render_template('index.html'))

#displayng customers
@app.route('/customers', methods = ['GET', 'POST'])
def customers():
    data = Customers.query.all()  
    return(render_template('customer.html', customers = data))

#viewing a particula customer
@app.route('/view/<string:customer_id>', methods = ['GET', 'POST'])
def view(customer_id):
    data = Customers.query.filter_by(customer_id = customer_id).first()
    return(render_template('view.html', data = data))

#transfering money
@app.route('/transfer', methods = ['GET', 'POST'])
def transfer():
    data = Customers.query.all()  
    if request.method == 'POST':
        sender = request.form.get('payee')
        receiver = request.form.get('beneficiary')
        amount = request.form.get('balance')
        entry = Transaction(sender_name=sender, receiver_name=receiver, amount=amount, date=datetime.now())
        if receiver != sender:
            edited = db.session.query(Customers).filter_by(fname = receiver).one()
            edited.current_balance = edited.current_balance + int(amount)
            edited3 = db.session.query(Customers).filter_by(fname = sender).one()

            #if balance is greater than amount to be transferred only then transaction occurs
            if edited3.current_balance >= int(amount):
                edited3.current_balance = edited3.current_balance - int(amount)
                db.session.add(entry)
                db.session.commit()
                #result = Transaction.query.all()
                #print(result)
                return(redirect(url_for('transhist'))) #result=result 
    return(render_template('transfer.html', data = data))

#viewing transaction history
@app.route('/transhist', methods = ['GET', 'POST'])
def transhist():
    result = Transaction.query.all()  
    return(render_template('transhist.html', result=result))

app.run(debug=True)

