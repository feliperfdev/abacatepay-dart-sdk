final class AbacatePayCustomer {
  final String name;
  final String cellphone;
  final String email;
  final String taxId;

  AbacatePayCustomer({
    required this.name,
    required this.cellphone,
    required this.email,
    required this.taxId,
  });

  Map<String, dynamic> toMap() => {
    "name": name,
    "cellphone": cellphone,
    "email": email,
    "taxId": taxId,
  };
}
