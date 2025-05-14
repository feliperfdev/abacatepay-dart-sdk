import 'package:abacatepay_dart_sdk/abacatepay_dart_sdk.dart';

void main() async {
  final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');

  await abacatePay.customers.listCustomers();
  await abacatePay.billing.listBillings();
  await abacatePay.pixQrCode.simulatePayment();
}
