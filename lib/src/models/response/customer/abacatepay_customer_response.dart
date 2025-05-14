final class AbacatePayCustomerDataResponse {
  final String id;
  final String name;
  final String cellphone;
  final String email;
  final String taxId;

  AbacatePayCustomerDataResponse({
    required this.id,
    required this.name,
    required this.cellphone,
    required this.email,
    required this.taxId,
  });

  factory AbacatePayCustomerDataResponse.fromData(Map<String, dynamic> data) {
    final metadata = data['metadata'];

    return AbacatePayCustomerDataResponse(
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
