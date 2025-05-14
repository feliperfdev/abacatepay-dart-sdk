import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/models/response/pixQrCode/abacatepay_pixqrcode_response.dart';
import 'package:abacatepay/src/models/response/pixQrCode/abcatepay_pixqrcode_status_response.dart';

final class AbacatePayPixQrCode {
  late final AbacatePayClient _client;

  AbacatePayPixQrCode(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/pixQrCode/';

  Future<AbacatePayPixQrCodeResponse> simulatePayment() async {
    final response = await _client.post('${_basePath}simulate-payment');

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeResponse.fromData(data);
  }

  Future<AbacatePayPixQrCodeResponse> createPayment() async {
    final response = await _client.post('${_basePath}create');

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeResponse.fromData(data);
  }

  Future<AbacatePayPixQrCodeStatusResponse> checkPaymentStatus() async {
    final response = await _client.get('${_basePath}check');

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeStatusResponse.fromData(data);
  }
}
