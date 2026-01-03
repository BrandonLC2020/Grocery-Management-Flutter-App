# backend/apps/auth/serializers.py
from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    # You can also add custom serializer fields that aren't in the model
    full_name = serializers.ReadOnlyField() 

    class Meta:
        model = User
        # Add the new fields to this list
        fields = [
            'id', 'username', 'email', 'first_name', 'last_name', 
            'phone_number', 'bio', 'full_name', # <-- Added here
            'is_admin', 'is_active', 'date_joined', 'last_login'
        ]
        read_only_fields = ['id', 'is_admin', 'is_active', 'date_joined', 'last_login', 'full_name']