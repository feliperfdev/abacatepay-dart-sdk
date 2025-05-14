import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';
import 'package:abacatepay_dart_sdk/src/models/dto/billing/abacatepay_billing_data.dart';
import 'package:abacatepay_dart_sdk/src/models/response/billing/abacatepay_billing_response.dart';

final class AbacatePayBilling {
  late final AbacatePayClient _client;

  AbacatePayBilling(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/billing/';

  Future<List<AbacatePayBillingResponse>> listBillings() async {
    final response = await _client.get('${_basePath}list');

    final data = response['data'] as List<Map<String, dynamic>>;

    return data.map(AbacatePayBillingResponse.fromData).toList();
  }

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
