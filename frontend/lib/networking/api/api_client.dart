import 'package:dio/dio.dart';
import 'package:grocery_management_frontend/services/app_config.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl)) {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response<T>> patch<T>(String path, {dynamic data}) async {
    return _dio.patch(path, data: data);
  }

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Token $token';
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
