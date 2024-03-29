from flask import Flask
application = Flask(__name__)
application.config['SECRET_KEY']='some_random_secret'

from random import randint 
from flask_wtf import FlaskForm
from wtforms import IntegerField, SubmitField, SelectField, RadioField
from wtforms.validators import DataRequired
import os

@application.route('/', methods=['GET', 'POST'])
def enter():
    form = EnterForm()
    result = None
    if form.is_submitted():
        first = int(str(form.first_digit.data))
        second = int(str(form.first_digit.data))
        if form.action.data == '+':
            result = form.first_digit.data + form.second_digit.data
        elif form.action.data == '-':
            result = form.first_digit.data - form.second_digit.data
        elif form.action.data == '*':
            result = form.first_digit.data * form.second_digit.data
        elif form.action.data == '\\':
            result = form.first_digit.data / form.second_digit.data
        return (f"Your result is <p id='result'>{int(result)}</p>")
    return (f'<html><head><title>Calculator</title></head><body><form action="" method="post" novalidate>{form.hidden_tag()}<p>{form.first_digit.label}<br>{form.first_digit(size=7)}</p><p>{form.second_digit.label}<br>{ form.second_digit(size=6)}<p>{form.action.label}<br>{form.action(size=6)}</p><p>{form.submit()}</p></form></body></html>')


class EnterForm(FlaskForm):
    first_digit = IntegerField('First', validators=[DataRequired()])
    second_digit = IntegerField('Second', validators=[DataRequired()])
    action = RadioField('Action', choices=[('+', 'plus'), ('-', 'minus'), ('*', 'multiply'), ('\\', 'divide')])
    submit = SubmitField('Count')
