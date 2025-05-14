final class AbacatePayCustomerResponse {
  final String id;
  final String name;
  final String cellphone;
  final String email;
  final String taxId;

  AbacatePayCustomerResponse({
    required this.id,
    required this.name,
    required this.cellphone,
    required this.email,
    required this.taxId,
  });

  factory AbacatePayCustomerResponse.fromData(Map<String, dynamic> data) {
    final metadata = data['metadata'];

    return AbacatePayCustomerResponse(
      id: data['id'],
      name: metadata['name'],
      cellphone: metadata['cellphone'],
      email: metadata['email'],
      taxId: metadata['taxId'],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "metadata": {
      "name": name,
      "cellphone": cellphone,
      "email": email,
      "taxId": taxId,
    },
  };
}
