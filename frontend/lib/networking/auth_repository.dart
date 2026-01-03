import 'package:grocery_management_frontend/models/user.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/dto/user_dto.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<User> login(String email, String password) async {
    final response = await _apiClient.post('/api/auth/login/', data: {
      'email': email,
      'password': password,
    });

    final token = response.data['token'];
    _apiClient.setAuthToken(token);

    final userDto = UserDto.fromMap(response.data['user']);
    return userDto.toUser();
  }

  Future<User> register(String username, String email, String password) async {
    final response = await _apiClient.post('/api/auth/register/', data: {
      'username': username,
      'email': email,
      'password': password,
    });

    final token = response.data['token'];
    _apiClient.setAuthToken(token);

    final userDto = UserDto.fromMap(response.data['user']);
    return userDto.toUser();
  }

  void logout() {
    _apiClient.clearAuthToken();
  }
}

extension on UserDto {
  User toUser() {
    return User(
      id: id,
      username: username,
      email: email,
      phoneNumber: phoneNumber,
      bio: bio,
      lastLogin: lastLogin,
    );
  }
}
