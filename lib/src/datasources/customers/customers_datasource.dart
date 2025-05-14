import 'package:abacatepay/abacatepay_dart_sdk.dart';
import 'package:abacatepay/src/client/abacatepay_client.dart';

final class AbacatePayCustomer {
  late final AbacatePayClient _client;

  AbacatePayCustomer(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/customer/';

  /// Permite que você recupere uma lista de todos os seus clientes.
  Future<List<AbacatePayCustomerResponse>> listCustomers() async {
    final response = await _client.get('${_basePath}list');

    final data = List<Map<String, dynamic>>.from(response['data']);

    return data.map(AbacatePayCustomerResponse.fromData).toList();
  }

  /// Permite que você crie um novo cliente para a sua loja.
  Future<AbacatePayCustomerResponse> createCustomer(
    AbacatePayCustomerData customerData,
  ) async {
    final response = await _client.post(
      '${_basePath}create',
      body: customerData.toMap(),
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayCustomerResponse.fromData(data);
  }
}
