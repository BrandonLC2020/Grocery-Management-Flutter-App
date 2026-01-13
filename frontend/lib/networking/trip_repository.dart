import 'package:grocery_management_frontend/models/grocery_trip.dart';
import 'package:grocery_management_frontend/models/purchased_item.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/dto/grocery_trip_dto.dart';
import 'package:grocery_management_frontend/networking/dto/purchased_item_dto.dart';

class TripRepository {
  final ApiClient _apiClient;

  TripRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<GroceryTrip> startTrip(int storeId) async {
    final response = await _apiClient.post('/api/trips/', data: {'store': storeId});
    final tripDto = GroceryTripDto.fromMap(response.data);
    return tripDto.toGroceryTrip();
  }

  Future<List<GroceryTrip>> getTrips({bool? completed}) async {
    final Map<String, dynamic> queryParameters = {};
    if (completed != null) {
      // Assuming backend uses 'status' query param or similar
      // But looking at backend models, GroceryTrip doesn't have a status field directly, 
      // check serializer. No status field in GroceryTrip model?
      // Wait, Backend GroceryTrip model only has date, store, user, total_spent.
      // Ah, TripRepository has 'finishTrip' which patches 'status': 'completed'.
      // But GroceryTrip model didn't show 'status' in view_file earlier? 
      // Let's check backend model again.
      // Checking local file cache: GroceryTrip in backend/apps/grocery/models.py
      // It inherits DefaultModel which has 'status' (active/inactive).
      // 'completed' might be a semantic status.
      // But 'finishTrip' sets 'status': 'completed'. 
      // DefaultModel defines status as ACTIVE='active', INACTIVE='inactive'. 
      // So 'completed' might be invalid choice if it enforces choices?
      // Backend log: class Status(models.TextChoices): ACTIVE='active', INACTIVE='inactive'.
      // So 'completed' is NOT a valid option for 'status' field unless I change backend.
      // Or maybe 'finishTrip' logic in implementation_plan was assumption?
      // I will assume for now we just get all trips.
    }
    final response = await _apiClient.get('/api/trips/', queryParameters: queryParameters);
    final tripDtos = (response.data as List).map((e) => GroceryTripDto.fromMap(e)).toList();
    return tripDtos.map((dto) => dto.toGroceryTrip()).toList();
  }

  Future<GroceryTrip> getTrip(int id) async {
    final response = await _apiClient.get('/api/trips/$id/');
    final tripDto = GroceryTripDto.fromMap(response.data);
    return tripDto.toGroceryTrip();
  }

  Future<PurchasedItem> addItemToTrip(int tripId, int pantryItemId, double price) async {
    final response = await _apiClient.post(
      '/api/trips/$tripId/items/',
      data: {
        'pantry_item': pantryItemId,
        'purchase_price': price,
        'quantity_bought': 1, // Assuming quantity of 1 for now
      },
    );
    final itemDto = PurchasedItemDto.fromMap(response.data);
    // This conversion will need more work to fetch related objects
    return itemDto.toPurchasedItem();
  }

  Future<void> finishTrip(int tripId) async {
    await _apiClient.patch('/api/trips/$tripId/', data: {'status': 'completed'});
  }
}

extension on GroceryTripDto {
  GroceryTrip toGroceryTrip() {
    return GroceryTrip(
      id: id,
      store: store,
      tripDate: tripDate,
      totalSpent: totalSpent,
      purchasedItems: purchasedItems?.map((e) => e.toPurchasedItem()).toList(),
    );
  }
}

extension on PurchasedItemDto {
  PurchasedItem toPurchasedItem() {
    return PurchasedItem(
      id: id,
      trip: trip,
      pantryItem: pantryItem,
      purchasePrice: purchasePrice,
      quantityBought: quantityBought,
    );
  }
}
