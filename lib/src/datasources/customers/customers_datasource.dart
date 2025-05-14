import 'package:abacatepay_dart_sdk/abacatepay_dart_sdk.dart';
import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';
import 'package:abacatepay_dart_sdk/src/models/response/customer/abacatepay_customer_response.dart';

final class AbacatePayCustomerDatas {
  late final AbacatePayClient _client;

  AbacatePayCustomerDatas(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/customer/';

  Future<List<AbacatePayCustomerDataResponse>> listCustomers() async {
    final response = await _client.get('${_basePath}list');

    final data = response['data'] as List<Map<String, dynamic>>;

    return data.map(AbacatePayCustomerDataResponse.fromData).toList();
  }

  Future<AbacatePayCustomerDataResponse> createCustomer(
    AbacatePayCustomerData customerData,
  ) async {
    final response = await _client.post(
      '${_basePath}create',
      body: customerData.toMap(),
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayCustomerDataResponse.fromData(data);
  }
}
