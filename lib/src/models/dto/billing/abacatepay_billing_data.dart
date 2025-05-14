import 'package:abacatepay/abacatepay_dart_sdk.dart';
import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayBillingData {
  /// Define o tipo de frequência da cobrança. Para cobranças únicas, use ONE_TIME. Para cobranças que podem ser pagas mais de uma vez, use MULTIPLE_PAYMENTS.
  ///
  /// Available options: ONE_TIME, MULTIPLE_PAYMENTS
  final BillingFrequency frequency;

  /// Métodos de pagamento que serão utilizados. Atualmente, apenas PIX é suportado.
  ///
  /// Available options: PIX
  final List<AbacatePaymentMethod> methods;

  /// URL para redirecionar o cliente caso o mesmo clique na opção "Voltar".
  final String? returnUrl;

  /// URL para redirecionar o cliente quando o pagamento for concluído.
  final String? completitionId;

  /// Lista de produtos que seu cliente está pagando.
  final List<AbacatePayProductData> products;

  /// O id de um cliente já cadastrado em sua loja.
  final String? customerId;

  /// Os dados do seu cliente para criá-lo
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
    AbacatePayConstants.frequency: frequency.apiKey,
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
