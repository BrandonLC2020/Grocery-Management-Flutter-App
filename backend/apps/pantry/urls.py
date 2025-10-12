from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import PantryItemViewSet, CategoryViewSet

router = DefaultRouter()
router.register(r'pantry-items', PantryItemViewSet)
router.register(r'categories', CategoryViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
