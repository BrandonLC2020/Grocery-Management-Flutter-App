from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import GroceryTripViewSet, StoreViewSet, PurchasedItemViewSet

router = DefaultRouter()
router.register(r'grocery-trips', GroceryTripViewSet)
router.register(r'stores', StoreViewSet)
router.register(r'purchased-items', PurchasedItemViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
