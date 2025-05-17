import 'package:abacatepay/abacatepay.dart';

void main() async {
  final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');

  await abacatePay.coupon.listCoupons();

  return;
}
