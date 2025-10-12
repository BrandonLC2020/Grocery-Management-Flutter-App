from rest_framework import viewsets
from .models import PantryItem, Category
from .serializers import PantryItemSerializer, CategorySerializer

class PantryItemViewSet(viewsets.ModelViewSet):
    queryset = PantryItem.objects.all()
    serializer_class = PantryItemSerializer

    def get_queryset(self):
        return PantryItem.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    
    def perform_update(self, serializer):
        serializer.save(user=self.request.user)

    def perform_destroy(self, instance):
        instance.delete()

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

    def get_queryset(self):
        # Categories are not user-specific in this model, so return all
        return Category.objects.all()

    def perform_create(self, serializer):
        serializer.save()

    def perform_update(self, serializer):
        serializer.save()

    def perform_destroy(self, instance):
        instance.delete()
