from apps.grocery.models import Store, GroceryTrip, PurchasedItem
from rest_framework import serializers

class PurchasedItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = PurchasedItem
        fields = ['id', 'trip', 'pantry_item', 'purchase_price', 'quantity_bought']
        read_only_fields = ['id']

class StoreSerializer(serializers.ModelSerializer):
    class Meta:
        model = Store
        fields = ['id', 'user', 'name', 'address', 'trip_count']
        read_only_fields = ['id', 'user', 'trip_count']

class GroceryTripSerializer(serializers.ModelSerializer):
    purchased_items = PurchasedItemSerializer(many=True, read_only=True)

    class Meta:
        model = GroceryTrip
        fields = ['id', 'user', 'store', 'trip_date', 'total_spent', 'purchased_items']
        read_only_fields = ['id', 'user', 'purchased_items']