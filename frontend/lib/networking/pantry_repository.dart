import 'package:grocery_management_frontend/models/pantry_item.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/dto/pantry_item_dto.dart';

class PantryRepository {
  final ApiClient _apiClient;

  PantryRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<List<PantryItem>> getPantryItems() async {
    final response = await _apiClient.get('/api/pantry/');
    final pantryItemDtos =
        (response.data as List).map((e) => PantryItemDto.fromMap(e)).toList();
    return pantryItemDtos.map((dto) => dto.toPantryItem()).toList();
  }

  Future<PantryItem> createPantryItem(
      String name, int quantity, int categoryId) async {
    final response = await _apiClient.post('/api/pantry/', data: {
      'name': name,
      'quantity': quantity,
      'category': categoryId,
    });
    final pantryItemDto = PantryItemDto.fromMap(response.data);
    return pantryItemDto.toPantryItem();
  }

  Future<PantryItem> updatePantryItem(int id, String name, int? categoryId) async {
    final response = await _apiClient.patch('/api/pantry/$id/', data: {
      'name': name,
      if (categoryId != null) 'category': categoryId,
    });
    final pantryItemDto = PantryItemDto.fromMap(response.data);
    return pantryItemDto.toPantryItem();
  }

  Future<PantryItem> updatePantryItemQuantity(int id, int quantity) async {
    final response = await _apiClient.patch('/api/pantry/$id/', data: {
      'quantity': quantity,
    });
    final pantryItemDto = PantryItemDto.fromMap(response.data);
    return pantryItemDto.toPantryItem();
  }

  Future<void> deletePantryItem(int id) async {
    await _apiClient.delete('/api/pantry/$id/');
  }
}

extension on PantryItemDto {
  PantryItem toPantryItem() {
    return PantryItem(
      id: id,
      name: name,
      quantity: quantity,
      // The category is not fully implemented in this model yet.
      // We will need to fetch categories separately and map them.
      category: category,
      lastUpdated: lastUpdated,
      regularPrice: regularPrice,
    );
  }
}
