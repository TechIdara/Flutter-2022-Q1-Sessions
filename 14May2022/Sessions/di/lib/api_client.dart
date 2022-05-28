import 'package:dio/dio.dart';

class ApiClient {
  static ApiClient _instance = ApiClient._();
  ApiClient._();
  static ApiClient get instance => _instance;

  final String baseURL = "https://api.github.com";

  Future<Map<String, dynamic>> get(String endpoint) async {
    return (await Dio().get('$baseURL/$endpoint')).data;
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> params) async {
    return (await Dio().post('$baseURL/$endpoint', data: params)).data;
  }
}
