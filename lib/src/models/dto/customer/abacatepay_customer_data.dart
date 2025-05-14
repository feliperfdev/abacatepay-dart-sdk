import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayCustomerData {
  /// Nome completo do seu cliente
  final String name;

  /// Celular do cliente
  final String cellphone;

  /// E-mail do cliente
  final String email;

  /// CPF ou CNPJ do cliente.
  final String taxId;

  AbacatePayCustomerData({
    required this.name,
    required this.cellphone,
    required this.email,
    required this.taxId,
  });

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.name: name,
    AbacatePayConstants.cellphone: cellphone,
    AbacatePayConstants.email: email,
    AbacatePayConstants.taxId: taxId,
  };
}
