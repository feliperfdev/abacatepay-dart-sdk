import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';

final class AbacatePayPixQrCode {
  late final AbacatePayClient _client;

  AbacatePayPixQrCode(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/pixQrCode/';

  Future simulatePayment() async {
    final response = await _client.post('${_basePath}simulate-payment');

    final data = response['data'] as Map<String, dynamic>;

    return response;
  }

  Future createPayment() async {
    final response = await _client.post('${_basePath}create');

    final data = response['data'] as Map<String, dynamic>;

    return response;
  }

  Future checkPaymentStatus() async {
    final response = await _client.get('${_basePath}check');

    final data = response['data'] as Map<String, dynamic>;

    return response;
  }
}
