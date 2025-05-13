import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';
import 'package:abacatepay_dart_sdk/src/models/abacatepay_customer.dart';

final class AbacatePayCustomers {
  late final AbacatePayClient _client;

  AbacatePayCustomers(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/customer/';

  Future listCustomers() async {
    final response = await _client.get('${_basePath}list');

    return response;
  }

  Future createCustomer(AbacatePayCustomer customer) async {
    final response = await _client.post(
      '${_basePath}create',
      body: customer.toMap(),
    );

    return response;
  }
}
