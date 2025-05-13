import 'package:abacatepay_dart_sdk/abacatepay_dart_sdk.dart';

void main() {
  final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');

  final customers = abacatePay.customers;
  final billing = abacatePay.billing;
  final pixQrCode = abacatePay.pixQrCode;
}
