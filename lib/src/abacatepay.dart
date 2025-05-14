import 'package:abacatepay_dart_sdk/src/client/abacatepay_client.dart';
import 'package:abacatepay_dart_sdk/src/datasources/billing/billing_datasource.dart';
import 'package:abacatepay_dart_sdk/src/datasources/customers/customers_datasource.dart';
import 'package:abacatepay_dart_sdk/src/datasources/pixQrCode/pix_qr_code_datasource.dart';

final class AbacatePay {
  late final AbacatePayBilling billing;
  late final AbacatePayCustomerDatas customers;
  late final AbacatePayPixQrCode pixQrCode;

  late final String _apiKey;

  AbacatePay({required String apiKey}) {
    _apiKey = apiKey;

    final client = AbacatePayClient(apiKey: _apiKey);

    billing = AbacatePayBilling(client);
    customers = AbacatePayCustomerDatas(client);
    pixQrCode = AbacatePayPixQrCode(client);
  }
}
