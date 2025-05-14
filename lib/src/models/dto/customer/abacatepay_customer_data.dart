import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayCustomerData {
  final String name;
  final String cellphone;
  final String email;
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
