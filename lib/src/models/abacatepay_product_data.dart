import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayProductData {
  /// O id do produto em seu sistema. Utilizamos esse id para criar seu produto na AbacatePay de forma automática, então certifique-se de que seu id é único.
  final String externalId;

  /// Nome do produto.
  final String name;

  /// Descrição detalhada do produto.
  final String description;

  /// Quantidade do produto sendo adquirida.
  final int quantity;

  /// Preço por unidade do produto em centavos. O mínimo é 100 (1 BRL).
  final double price;

  AbacatePayProductData({
    required this.externalId,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.externalId: externalId,
    AbacatePayConstants.name: name,
    AbacatePayConstants.description: description,
    AbacatePayConstants.quantity: quantity,
    AbacatePayConstants.price: price,
  };
}
