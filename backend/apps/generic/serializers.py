from rest_framework import serializers
from .models import User, Address


class AddressSerializer(serializers.ModelSerializer):
    class Meta:
        model = Address
        fields = ['address_line', 'city', 'state', 'zip_code', 'country']