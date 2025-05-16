import 'dart:convert';

import 'package:abacatepay/src/client/abacatepay_base_client.dart';
import 'package:abacatepay/src/client/interceptors/header_interceptor.dart';
import 'package:abacatepay/src/client/interceptors/logger_interceptor.dart';
import 'package:abacatepay/src/exceptions/abacatepay_client_exception.dart';
import 'package:http/http.dart';

class AbacatePayClient {
  final String apiKey;
  final int apiVersion;

  AbacatePayClient({required this.apiKey, required this.apiVersion});

  late final _client =
      AbacatePayBaseClient(
        interceptors: [LoggerInterceptor(), HeaderInterceptor(apiKey: apiKey)],
      ).clientWithInterceptor();

  String get _baseURL => 'api.abacatepay.com';

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> body = const {},

    Map<String, String>? queryParams,
  }) async {
    try {
      final url = Uri.https(_baseURL, '/v$apiVersion$path', queryParams);

      final response = await _client.post(url, body: jsonEncode(body));

      return jsonDecode(response.body);
    } on ClientException catch (e) {
      throw AbacatePayClientException(externalExceptionMessage: e.message);
    } catch (genericException) {
      throw AbacatePayClientException(
        externalExceptionMessage: genericException.toString(),
      );
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final url = Uri.https(_baseURL, '/v$apiVersion$path');

      final response = await _client.put(url, body: jsonEncode(body));

      return jsonDecode(response.body);
    } on ClientException catch (e) {
      throw AbacatePayClientException(externalExceptionMessage: e.message);
    } catch (genericException) {
      throw AbacatePayClientException(
        externalExceptionMessage: genericException.toString(),
      );
    }
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParams,
  }) async {
    try {
      final url = Uri.https(_baseURL, '/v$apiVersion$path', queryParams);

      final response = await _client.get(url);

      return jsonDecode(response.body);
    } on ClientException catch (e) {
      throw AbacatePayClientException(externalExceptionMessage: e.message);
    } catch (genericException) {
      throw AbacatePayClientException(
        externalExceptionMessage: genericException.toString(),
      );
    }
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    try {
      final url = Uri.https(_baseURL, '/v$apiVersion$path');

      final response = await _client.delete(url, body: jsonEncode(body));

      return jsonDecode(response.body);
    } on ClientException catch (e) {
      throw AbacatePayClientException(externalExceptionMessage: e.message);
    } catch (genericException) {
      throw AbacatePayClientException(
        externalExceptionMessage: genericException.toString(),
      );
    }
  }
}
