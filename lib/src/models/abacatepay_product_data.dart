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
    "externalId": externalId,
    "name": name,
    "description": description,
    "quantity": quantity,
    "price": price,
  };
}
