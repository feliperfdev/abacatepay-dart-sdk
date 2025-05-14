import 'dart:convert';

import 'package:http/http.dart';

class AbacatePayClient {
  final String apiKey;
  final int apiVersion;

  AbacatePayClient({required this.apiKey, required this.apiVersion});

  final _http = Client();

  String get _baseURL => 'api.abacatepay.com';

  Map<String, String> get _headers => {
    'Authorization': "Bearer $apiKey",
    'Content-Type': "application/json",
  };

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> body = const {},

    Map<String, String>? queryParams,
  }) async {
    final url = Uri.https(_baseURL, '/v$apiVersion$path', queryParams);

    print(url.toString());

    final response = await _http.post(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    print('Status: ${response.statusCode}');

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, '/v$apiVersion$path');

    print(url.toString());

    final response = await _http.put(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    print('Status: ${response.statusCode}');

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    final url = Uri.https(_baseURL, '/v$apiVersion$path', queryParams);

    print(url.toString());

    final response = await _http.get(url, headers: _headers);

    print('Status: ${response.statusCode}');

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, '/v$apiVersion$path');

    print(url.toString());

    final response = await _http.put(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    print('Status: ${response.statusCode}');

    return jsonDecode(response.body);
  }
}
