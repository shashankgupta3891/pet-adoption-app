import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    // Set any common configurations for your API client
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.options.connectTimeout = 5000; // 5 seconds
    _dio.options.receiveTimeout = 3000; // 3 seconds
  }

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  // Add more methods for other types of requests (e.g., PUT, DELETE)

  // Add any custom headers or interceptors if needed
}
