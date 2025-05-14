import 'package:abacatepay_dart_sdk/abacatepay_dart_sdk.dart';
import 'package:abacatepay_dart_sdk/src/models/enums/abacate_payment_method_enum.dart';

final class AbacatePayBillingData {
  final String frequency;
  final List<AbacatePaymentMethod> methods;
  final String? returnUrl;
  final String? completitionId;
  final List<AbacatePayProductData> products;
  final String customerId;
  final AbacatePayCustomerData customer;

  AbacatePayBillingData({
    required this.frequency,
    required this.methods,
    required this.returnUrl,
    required this.completitionId,
    required this.products,
    required this.customerId,
    required this.customer,
  });

  Map<String, dynamic> toMap() => {
    "frequency": frequency,
    "methods": methods.map((method) => method.apiKey).toList(),
    "products": products.map((product) => product.toMap()).toList(),
    "returnUrl": returnUrl,
    "completionUrl": completitionId,
    "customerId": customerId,
    "customer": customer.toMap(),
  };
}
