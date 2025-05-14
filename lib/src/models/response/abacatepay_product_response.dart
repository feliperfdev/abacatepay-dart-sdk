import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

final class AbacatePayProductDataResponse {
  final String id;
  final String externalId;
  final int quantity;

  AbacatePayProductDataResponse({
    required this.id,
    required this.externalId,
    required this.quantity,
  });

  factory AbacatePayProductDataResponse.fromData(Map<String, dynamic> data) =>
      AbacatePayProductDataResponse(
        id: data[AbacatePayConstants.id],
        externalId: data[AbacatePayConstants.externalId],
        quantity: data[AbacatePayConstants.quantity],
      );

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.id: id,
    AbacatePayConstants.externalId: externalId,
    AbacatePayConstants.quantity: quantity,
  };
}
