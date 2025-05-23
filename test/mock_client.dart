import 'dart:convert';
import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:http/testing.dart';

final class AbacatePayMockClient implements AbacatePayClient {
  final MockClient client;

  AbacatePayMockClient({required this.client});

  static const _baseURL = 'jsonplaceholder.typicode.com';

  Map<String, String> get _headers => {
    'Authorization': "Bearer $apiKey",
    'Content-Type': "application/json",
  };

  @override
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> body = const {},

    Map<String, String>? queryParams,
  }) async {
    final url = Uri.https(_baseURL, path, queryParams);

    print(url.toString());

    final response = await client.post(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    return jsonDecode(response.body);
  }

  @override
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, path);

    print(url.toString());

    final response = await client.put(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    return jsonDecode(response.body);
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    final url = Uri.https(_baseURL, path, queryParams);

    print(url.toString());

    final response = await client.get(url, headers: _headers);

    return jsonDecode(response.body);
  }

  @override
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, path);

    print(url.toString());

    final response = await client.delete(
      url,
      body: jsonEncode(body),
      headers: _headers,
    );

    return jsonDecode(response.body);
  }

  @override
  String get apiKey => 'fake-api-key';

  @override
  int get apiVersion => 1;
}
