import 'package:abacatepay/src/models/enums/abacate_payment_method_enum.dart';
import 'package:abacatepay/src/models/enums/billing_frequency_enum.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';
import 'package:abacatepay/src/models/response/customer/abacatepay_customer_response.dart';
import 'package:abacatepay/src/models/response/abacatepay_product_response.dart';

final class AbacatePayBillingResponse {
  final String id;
  final String url;
  final int amount;
  final PaymentStatus status;
  final bool devMode;
  final List<AbacatePaymentMethod> methods;
  final List<AbacatePayProductDataResponse> products;
  final BillingFrequency frequency;
  final String? nextBilling;
  final AbacatePayCustomerResponse customer;

  AbacatePayBillingResponse({
    required this.id,
    required this.url,
    required this.amount,
    required this.status,
    required this.devMode,
    required this.methods,
    required this.products,
    required this.frequency,
    required this.nextBilling,
    required this.customer,
  });

  factory AbacatePayBillingResponse.fromData(Map<String, dynamic> data) {
    return AbacatePayBillingResponse(
      id: data["id"],
      url: data["url"],
      amount: data["amount"],
      status: PaymentStatus.values.singleWhere(
        (method) =>
            (data['status'] as List<String>).any((m) => m == method.apiKey),
      ),
      devMode: data["devMode"],
      methods:
          AbacatePaymentMethod.values
              .where(
                (method) => (data['methods'] as List<String>).any(
                  (m) => m == method.apiKey,
                ),
              )
              .toList(),
      products:
          (data["products"] as List<Map<String, dynamic>>)
              .map<AbacatePayProductDataResponse>(
                AbacatePayProductDataResponse.fromData,
              )
              .toList(),
      frequency: data["frequency"],
      nextBilling: data["nextBilling"],
      customer: AbacatePayCustomerResponse.fromData(data["customer"]),
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "url": url,
    "amount": amount,
    "status": status,
    "devMode": devMode,
    "methods": methods.map((method) => method.apiKey).toList(),
    "products": products.map((product) => product.toMap()).toList(),
    "frequency": frequency,
    "nextBilling": nextBilling,
    "customer": customer.toMap(),
  };
}
