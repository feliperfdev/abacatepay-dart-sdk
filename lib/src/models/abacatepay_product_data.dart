import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayProductData {
  final String externalId;
  final String name;
  final String description;
  final int quantity;
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
