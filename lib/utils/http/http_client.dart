import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class HttpClient {
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers});
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers});
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers});
  Future<Map<String, dynamic>> delete(String endpoint, {Map<String, String>? headers});
}

class EshopHttpHelper implements HttpClient {
  static const String _baseUrl = 'http://192.168.32.105:8000/api/v1';

  static String get baseUrl => _baseUrl;

  @override
  Future<Map<String, dynamic>> get(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse(endpoint.startsWith('http') ? endpoint : '$_baseUrl/$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse(endpoint.startsWith('http') ? endpoint : '$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (headers != null) ...headers,
      },
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse(endpoint.startsWith('http') ? endpoint : '$_baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (headers != null) ...headers,
      },
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  @override
  Future<Map<String, dynamic>> delete(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse(endpoint.startsWith('http') ? endpoint : '$_baseUrl/$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }
    throw Exception(body['message'] ?? 'Failed to load data: ${response.statusCode}');
  }
}