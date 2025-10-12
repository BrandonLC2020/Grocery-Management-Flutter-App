from rest_framework import viewsets
from .models import GroceryTrip, Store, PurchasedItem
from .serializers import GroceryTripSerializer, StoreSerializer, PurchasedItemSerializer

class GroceryTripViewSet(viewsets.ModelViewSet):
    queryset = GroceryTrip.objects.all()
    serializer_class = GroceryTripSerializer

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def perform_update(self, serializer):
        serializer.save(updated_by=self.request.user)

    def perform_destroy(self, instance):
        instance.delete()

class StoreViewSet(viewsets.ModelViewSet):
    queryset = Store.objects.all()
    serializer_class = StoreSerializer

    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def perform_update(self, serializer):
        serializer.save(updated_by=self.request.user)

    def perform_destroy(self, instance):
        instance.delete()

class PurchasedItemViewSet(viewsets.ModelViewSet):
    queryset = PurchasedItem.objects.all()
    serializer_class = PurchasedItemSerializer

    def get_queryset(self):
        return self.queryset.filter(trip__user=self.request.user)
    
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    
    def perform_update(self, serializer):
        serializer.save(updated_by=self.request.user)

    def perform_destroy(self, instance):
        instance.delete()
        

