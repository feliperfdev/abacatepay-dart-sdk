import 'package:abacatepay_dart_sdk/src/models/enums/billing_status_enum.dart';

class AbacatePayPixQrCodeResponse {
  final String id;
  final int amount;
  final BillingStatus status;
  final bool devMode;
  final String brCode;
  final String brCodeBase64;
  final int platformFee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;

  AbacatePayPixQrCodeResponse({
    required this.id,
    required this.amount,
    required this.status,
    required this.devMode,
    required this.brCode,
    required this.brCodeBase64,
    required this.platformFee,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });

  factory AbacatePayPixQrCodeResponse.fromData(Map<String, dynamic> data) {
    return AbacatePayPixQrCodeResponse(
      id: data["id"],
      amount: data["amount"],
      status: BillingStatus.values.singleWhere(
        (method) =>
            (data['status'] as List<String>).any((m) => m == method.apiKey),
      ),
      devMode: data["devMode"],
      brCode: data["brCode"],
      brCodeBase64: data["brCodeBase64"],
      platformFee: data["platformFee"],
      createdAt: DateTime.parse(data["createdAt"]),
      updatedAt: DateTime.parse(data["updatedAt"]),
      expiresAt: DateTime.parse(data["expiresAt"]),
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "amount": amount,
    "status": status,
    "devMode": devMode,
    "brCode": brCode,
    "brCodeBase64": brCodeBase64,
    "platformFee": platformFee,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "expiresAt": expiresAt.toIso8601String(),
  };
}
