import 'package:http/http.dart';

final class AbacatePayClient {
  final String apiKey;

  AbacatePayClient({required this.apiKey});

  final _http = Client();

  static const _baseURL = 'api.AbacatePay.com/v1';

  Map<String, String> get _headers => {
    'Authorization': "Bearer $apiKey",
    'Content-Type': "application/json",
  };

  Future<dynamic> post(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, path);

    final response = await _http.post(url, body: body, headers: _headers);

    return response.body;
  }

  Future<dynamic> put(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, path);

    final response = await _http.put(url, body: body, headers: _headers);

    return response.body;
  }

  Future<dynamic> get(String path) async {
    final url = Uri.https(_baseURL, path);

    final response = await _http.get(url, headers: _headers);

    return response.body;
  }

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    final url = Uri.https(_baseURL, path);

    final response = await _http.put(url, body: body, headers: _headers);

    return response.body;
  }
}
