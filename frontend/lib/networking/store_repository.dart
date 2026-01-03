import 'package:grocery_management_frontend/models/store.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/dto/store_dto.dart';

class StoreRepository {
  final ApiClient _apiClient;

  StoreRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<List<Store>> getStores() async {
    final response = await _apiClient.get('/api/stores/');
    final storeDtos = (response.data as List).map((e) => StoreDto.fromMap(e)).toList();
    return storeDtos.map((dto) => dto.toStore()).toList();
  }

  Future<Store> createStore(String name, String address) async {
    final response = await _apiClient.post('/api/stores/', data: {
      'name': name,
      'address': address,
    });
    final storeDto = StoreDto.fromMap(response.data);
    return storeDto.toStore();
  }
}

extension on StoreDto {
  Store toStore() {
    return Store(
      id: id,
      name: name,
      address: address,
      tripCount: tripCount,
    );
  }
}
