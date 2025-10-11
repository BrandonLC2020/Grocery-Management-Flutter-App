from datetime import datetime
import phonenumbers
from dateutil import parser
from rest_framework import serializers
from django.utils import timezone 

def normalize_phone_number(phone_number):
    """
    Normalizes a phone number by removing non-numeric characters.
    """
    return ''.join(filter(str.isdigit, phone_number))

def normalize_email(email):
    """
    Normalizes an email address by converting it to lowercase.
    """
    return email.lower() if email else email

def parse_date(date_string):
    """
    Parses a date string into a datetime.date object.
    """
    return parser.parse(date_string).date() if date_string else None