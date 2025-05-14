import 'package:abacatepay_dart_sdk/src/models/enums/abacate_payment_method_enum.dart';
import 'package:abacatepay_dart_sdk/src/models/enums/billing_frequency_enum.dart';
import 'package:abacatepay_dart_sdk/src/models/enums/billing_status_enum.dart';
import 'package:abacatepay_dart_sdk/src/models/response/customer/abacatepay_customer_response.dart';
import 'package:abacatepay_dart_sdk/src/models/response/abacatepay_product_response.dart';

final class AbacatePayBillingResponse {
  final String id;
  final String url;
  final int amount;
  final BillingStatus status;
  final bool devMode;
  final List<AbacatePaymentMethod> methods;
  final List<AbacatePayProductDataResponse> products;
  final BillingFrequency frequency;
  final String? nextBilling;
  final AbacatePayCustomerDataResponse customer;

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

  factory AbacatePayBillingResponse.fromData(Map<String, dynamic> json) {
    return AbacatePayBillingResponse(
      id: json["id"],
      url: json["url"],
      amount: json["amount"],
      status: BillingStatus.values.singleWhere(
        (method) =>
            (json['status'] as List<String>).any((m) => m == method.apiKey),
      ),
      devMode: json["devMode"],
      methods:
          AbacatePaymentMethod.values
              .where(
                (method) => (json['methods'] as List<String>).any(
                  (m) => m == method.apiKey,
                ),
              )
              .toList(),
      products:
          (json["products"] as List<Map<String, dynamic>>)
              .map<AbacatePayProductDataResponse>(
                AbacatePayProductDataResponse.fromData,
              )
              .toList(),
      frequency: json["frequency"],
      nextBilling: json["nextBilling"],
      customer: AbacatePayCustomerDataResponse.fromData(json["customer"]),
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
