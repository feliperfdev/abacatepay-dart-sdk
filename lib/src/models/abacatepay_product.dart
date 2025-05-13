final class AbacatePayProduct {
  final String externalId;
  final String name;
  final String description;
  final int quantity;
  final double price;

  AbacatePayProduct({
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
