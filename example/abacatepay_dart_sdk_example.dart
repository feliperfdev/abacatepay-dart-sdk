import 'package:abacatepay/abacatepay.dart';

void main() async {
  final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');

  final customers = await abacatePay.customers.listCustomers();
  final billings = await abacatePay.billing.listBillings();
  final coupons = await abacatePay.coupon.listCoupons();

  print(customers.map((customer) => customer.id));
  print(billings.map((billing) => billing.id));
  print(coupons.map((coupon) => coupon.code));

  return;
}
