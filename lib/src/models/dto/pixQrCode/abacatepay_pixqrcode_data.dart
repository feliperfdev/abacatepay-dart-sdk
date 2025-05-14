import 'package:abacatepay/abacatepay.dart';
import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayPixQrCodeData {
  /// Valor da cobrança em centavos.
  final int amount;

  /// Tempo de expiração da cobrança em segundos.
  final int expiresIn;

  /// Mensagem que aparecerá na hora do pagamento do PIX.
  final String description;

  /// Os dados do seu cliente para criá-lo
  final AbacatePayCustomerData customer;

  AbacatePayPixQrCodeData({
    required this.amount,
    required this.expiresIn,
    required this.description,
    required this.customer,
  }) : assert(
         description.length <= 140,
         'The description should have the maximum of 140 characters.',
       );

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.amount: amount,
    AbacatePayConstants.expiresIn: expiresIn,
    AbacatePayConstants.description: description,
    AbacatePayConstants.customer: customer.toMap(),
  };
}
