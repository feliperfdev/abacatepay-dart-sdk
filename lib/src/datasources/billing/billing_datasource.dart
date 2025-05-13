import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';
import 'package:abacatepay_dart_sdk/src/models/abacatepay_customer.dart';
import 'package:abacatepay_dart_sdk/src/models/abacatepay_product.dart';

final class AbacatePayBilling {
  late final AbacatePayClient _client;

  AbacatePayBilling(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/billing/';

  Future listBillings() async {
    final response = await _client.get('${_basePath}list');

    return response;
  }

  Future createBilling({
    required String frequency,
    required List<String> methods,
    String? returnUrl,
    String? completitionId,
    required List<AbacatePayProduct> products,
    required String customerId,
    required AbacatePayCustomer customer,
  }) async {
    final response = await _client.post(
      '${_basePath}create',
      body: {
        "frequency": frequency,
        "methods": methods,
        "products": products.map((product) => product.toMap()).toList(),
        "returnUrl": returnUrl,
        "completionUrl": completitionId,
        "customerId": customerId,
        "customer": customer.toMap(),
      },
    );

    return response;
  }
}
