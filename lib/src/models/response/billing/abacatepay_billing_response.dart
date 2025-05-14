import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/enums/abacate_payment_method_enum.dart';
import 'package:abacatepay/src/models/enums/billing_frequency_enum.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';
import 'package:abacatepay/src/models/response/customer/abacatepay_customer_response.dart';
import 'package:abacatepay/src/models/response/abacatepay_product_response.dart';
import 'package:abacatepay/src/utils/get_enum_by_apikey.dart';

final class AbacatePayBillingResponse {
  /// Identificador único da cobrança.
  final String id;

  /// URL onde o usuário pode concluir o pagamento
  final String url;

  /// Valor total a ser pago em centavos.
  final int amount;

  /// Status atual da cobrança.
  ///
  /// Available options: PENDING, EXPIRED, CANCELLED, PAID, REFUNDED
  final PaymentStatus status;

  /// Indica se a cobrança foi criada em ambiente de testes.
  final bool devMode;

  /// Métodos de pagamento suportados para esta cobrança.
  ///
  /// Available options: PIX
  final List<AbacatePaymentMethod> methods;

  /// Lista de produtos na cobrança.
  final List<AbacatePayProductDataResponse> products;

  /// Frequência da cobrança.
  ///
  /// Available options: ONE_TIME, MULTIPLE_PAYMENTS
  final BillingFrequency frequency;

  /// Data e hora da próxima cobrança, ou null para cobranças únicas.
  final String? nextBilling;

  /// Os dados do seu cliente.
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
      id: data[AbacatePayConstants.id],
      url: data[AbacatePayConstants.url],
      amount: data[AbacatePayConstants.amount],
      status:
          getEnumByApiKey<PaymentStatus>(
            PaymentStatus.values,
            data[AbacatePayConstants.status],
          )!,
      devMode: data[AbacatePayConstants.devMode],
      methods: getMultipleEnumValuesByApiKey<AbacatePaymentMethod>(
        AbacatePaymentMethod.values,
        List<String>.from(data[AbacatePayConstants.methods]),
      ),
      products:
          (List<Map<String, dynamic>>.from(data[AbacatePayConstants.products]))
              .map<AbacatePayProductDataResponse>(
                AbacatePayProductDataResponse.fromData,
              )
              .toList(),
      frequency:
          getEnumByApiKey<BillingFrequency>(
            BillingFrequency.values,
            data[AbacatePayConstants.frequency],
          )!,
      nextBilling: data[AbacatePayConstants.nextBilling],
      customer: AbacatePayCustomerResponse.fromData(
        data[AbacatePayConstants.customer],
      ),
    );
  }

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.id: id,
    AbacatePayConstants.url: url,
    AbacatePayConstants.amount: amount,
    AbacatePayConstants.status: status.apiKey,
    AbacatePayConstants.devMode: devMode,
    AbacatePayConstants.methods:
        methods.map((method) => method.apiKey).toList(),
    AbacatePayConstants.products:
        products.map((product) => product.toMap()).toList(),
    AbacatePayConstants.frequency: frequency.apiKey,
    AbacatePayConstants.nextBilling: nextBilling,
    AbacatePayConstants.customer: customer.toMap(),
  };
}
