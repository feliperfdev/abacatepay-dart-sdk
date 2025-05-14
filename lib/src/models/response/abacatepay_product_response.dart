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
        id: data['id'],
        externalId: data['externalId'],
        quantity: data['quantity'],
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'externalId': externalId,
    'quantity': quantity,
  };
}
