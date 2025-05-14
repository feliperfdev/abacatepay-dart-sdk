import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/dto/pixQrCode/abacatepay_pixqrcode_data.dart';
import 'package:abacatepay/src/models/response/pixQrCode/abacatepay_pixqrcode_response.dart';
import 'package:abacatepay/src/models/response/pixQrCode/abcatepay_pixqrcode_status_response.dart';

final class AbacatePayPixQrCode {
  late final AbacatePayClient _client;

  AbacatePayPixQrCode(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/pixQrCode/';

  /// Simula o pagamento de um QRCode Pix criado no modo de desenvolvimento.
  Future<AbacatePayPixQrCodeResponse> simulatePayment(String id) async {
    final response = await _client.post(
      '${_basePath}simulate-payment',
      queryParams: {AbacatePayConstants.id: id},
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeResponse.fromData(data);
  }

  /// Permite que você crie um código copia-e-cola e um QRCode Pix para seu cliente fazer o pagamento.
  Future<AbacatePayPixQrCodeResponse> createPayment(
    AbacatePayPixQrCodeData pixQrCodeData,
  ) async {
    final response = await _client.post(
      '${_basePath}create',
      body: pixQrCodeData.toMap(),
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeResponse.fromData(data);
  }

  /// Checar status do pagamento do QRCode Pix.
  Future<AbacatePayPixQrCodeStatusResponse> checkPaymentStatus(
    String id,
  ) async {
    final response = await _client.get(
      '${_basePath}check',
      queryParams: {AbacatePayConstants.id: id},
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayPixQrCodeStatusResponse.fromData(data);
  }
}
