import 'package:abacatepay/abacatepay_dart_sdk.dart';
import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

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
    AbacatePayConstants.frequency: frequency,
    AbacatePayConstants.methods:
        methods.map((method) => method.apiKey).toList(),
    AbacatePayConstants.products:
        products.map((product) => product.toMap()).toList(),
    AbacatePayConstants.returnUrl: returnUrl,
    AbacatePayConstants.completionUrl: completitionId,
    AbacatePayConstants.customerId: customerId,
    AbacatePayConstants.customer: customer.toMap(),
  };
}
