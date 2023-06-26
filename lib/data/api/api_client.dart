import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio() {
    // Set any common configurations for your API client
    _dio.options.baseUrl = 'https://api.example.com';
    _dio.options.connectTimeout = 5000; // 5 seconds
    _dio.options.receiveTimeout = 3000; // 3 seconds
  }

  Future<String> get(String path, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(path);
      return response.data.toString();
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<String> post(
    String url, {
    Map<String, String> headers = const {},
    Object? body,
  }) async {
    try {
      final response = await _dio.post(url, data: body);
      return response.data.toString();
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  // Add more methods for other types of requests (e.g., PUT, DELETE)

  // Add any custom headers or interceptors if needed
}
