from rest_framework import serializers
from backend.apps.pantry.models import PantryItem, Category

class PantryItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = PantryItem
        fields = ['id', 'user', 'name', 'category', 'quantity', 'unit', 'expiration_date', 'is_favorite']
        read_only_fields = ['id', 'user']

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']
        read_only_fields = ['id']