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
