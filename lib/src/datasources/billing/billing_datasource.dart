import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/models/dto/billing/abacatepay_billing_data.dart';
import 'package:abacatepay/src/models/response/billing/abacatepay_billing_response.dart';

final class AbacatePayBilling {
  late final AbacatePayClient _client;

  AbacatePayBilling(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/billing/';

  /// Permite que você recupere uma lista de todas as cobranças criadas.
  Future<List<AbacatePayBillingResponse>> listBillings() async {
    final response = await _client.get('${_basePath}list');

    final data = List<Map<String, dynamic>>.from(response['data']);

    return data.map(AbacatePayBillingResponse.fromData).toList();
  }

  /// Permite que você crie um link de cobrança pro seu cliente pagar você.
  Future<AbacatePayBillingResponse> createBilling(
    AbacatePayBillingData billingData,
  ) async {
    final response = await _client.post(
      '${_basePath}create',
      body: billingData.toMap(),
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayBillingResponse.fromData(data);
  }
}
