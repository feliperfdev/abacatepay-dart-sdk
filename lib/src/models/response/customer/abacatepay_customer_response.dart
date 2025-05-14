final class AbacatePayCustomerResponse {
  /// Identificador único do cliente
  final String id;

  /// Nome completo do seu cliente
  final String name;

  /// Celular do cliente
  final String cellphone;

  /// E-mail do cliente
  final String email;

  /// CPF ou CNPJ do cliente.
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
